//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
//
import Utils_Extensions
import Utils
//
import App_Ryanair_Core
import Base_Domain

public class RyanairView1ViewModel: ObservableObject {

    // Encapsulate that the View properties that the ViewModel needs to read on to work
    class ViewStateOut: ObservableObject {
        @Published var children = 0
        @Published var teen = 0
        @Published var adult = 0
        @Published var origin = "DUB"
        @Published var destination = "STN"
        @Published var dateDeparture = Calendar.current.date(byAdding: .day, value: 1, to: Date())! // Tomorrow...
    }

    // Encapsulate that the View properties that the ViewModel updates in order to change UI
    class ViewStateIn: ObservableObject {
        @Published var outputText: String = ""
        @Published var outputList: [ListItemModel] = []
        @Published var airportsDepartureSuggestions: [RyanairModel.AirPort] = []
        @Published var airportsArrivalSuggestions: [RyanairModel.AirPort] = []
    }

    @Published var isLoading: Bool = false
    @Published var viewStateOut: ViewStateOut = ViewStateOut()
    @Published var viewStateIn: ViewStateIn = ViewStateIn()

    private let fetcher: APIRyanairProtocol
    private var repository: RepositoryRyanairProtocol
    private var cancelBag = CancelBag()
    private var airports: [RyanairModel.AirPort] = []
    private var trips: [RyanairResponseDto.Trip] = [] {
        didSet {
            //DispatchQueue.main.async { [weak self] in
               // guard let self = self else { return }
                self.viewStateIn.outputList = []
                self.viewStateIn.outputList.append(contentsOf: RyanairMappers.listItemsWith(trips: self.trips))
                if self.viewStateIn.outputList.count == 0 {
                    self.display("No results")
                } else {
                    self.display("")
                }
           // }
        }
    }

    public init(fetcher: APIRyanairProtocol,
                repository: RepositoryRyanairProtocol,
                scheduler: DispatchQueue = DispatchQueue(label: "Schemes1TemplateViewModel")) {
        self.fetcher = fetcher
        self.repository = repository
        fetchStations()
        observeUserInteractions()
    }
}

// MARK: - Combine

private extension RyanairView1ViewModel {
    func observeUserInteractions() {

        // Observer Origin/Destination (TextField) changes
        let origin = viewStateOut.$origin.debounce(for: 0.8, scheduler: RunLoop.main)
        let destination = viewStateOut.$destination.debounce(for: 0.8, scheduler: RunLoop.main)
        let dateDeparture = viewStateOut.$dateDeparture.debounce(for: 0.8, scheduler: RunLoop.main)

        Publishers.CombineLatest3(origin, destination, dateDeparture).sink(receiveValue: { [weak self] _ in
            self?.fetchResults()
        }).store(in: cancelBag)

        // Observer passenger changes
        let adult = viewStateOut.$adult.debounce(for: 0.8, scheduler: RunLoop.main)
        let children = viewStateOut.$children.debounce(for: 0.8, scheduler: RunLoop.main)
        let teen = viewStateOut.$teen.debounce(for: 0.8, scheduler: RunLoop.main)
        Publishers.CombineLatest3(adult, children, teen).sink(receiveValue: { [weak self] _ in
            self?.fetchResults()
        }).store(in: cancelBag)

        // Update departure suggestions (will show 3 hits results max)
        origin.sink { [weak self] (some) in
            guard let self = self else { return }
            self.viewStateIn.airportsDepartureSuggestions = []
            guard some.count == 2 else { return } // User must type 2 chars for autocomplete
            let value = some.lowercased()
            let matchs = self.airports.filter({ $0.name.lowercased().contains(value) || $0.code.lowercased().contains(value) })
            self.viewStateIn.airportsArrivalSuggestions.append(contentsOf: matchs.prefix(3))

        }.store(in: cancelBag)

        // Update destination suggestions (will show 3 hits results max)
        destination.sink { [weak self] (some) in
            guard let self = self else { return }
            self.viewStateIn.airportsArrivalSuggestions = []
            guard some.count == 2 else { return } // User must type 2 chars for autocomplete
            let value = some.lowercased()
            let matchs = self.airports.filter({ $0.name.lowercased().contains(value) || $0.code.lowercased().contains(value) })
            self.viewStateIn.airportsArrivalSuggestions.append(contentsOf: matchs.prefix(3))
        }.store(in: cancelBag)
    }
}

// MARK: - Private in/out

private extension RyanairView1ViewModel {
    func hideLoading() {
       // DispatchQueue.main.async { [weak self] in
            self.isLoading = false
       // }
    }

    func display(_ message: String) {
       // DispatchQueue.main.async { [weak self] in
            self.hideLoading()
            self.viewStateIn.outputText = message
       // }
    }

    func cleanViewOutput() {
       // DispatchQueue.main.async { [weak self] in
            self.trips = []
            self.viewStateIn.airportsDepartureSuggestions = []
            self.viewStateIn.airportsArrivalSuggestions = []
            self.viewStateIn.airportsDepartureSuggestions = []
            self.viewStateIn.airportsArrivalSuggestions = []
            self.viewStateIn.outputList = []
            self.viewStateIn.outputText = ""
            self.isLoading = false
      //  }
    }
}

// MARK: - Private fetchers

private extension RyanairView1ViewModel {

    func fetchStations() {
        cleanViewOutput()
        isLoading = true
        let stations = self.fetcher.stations(request: RyanairRequestDto.Stations(), cache: .cacheElseLoad)
        _ = stations.sink(receiveCompletion: { [weak self] (result) in
            self?.hideLoading()
        }) { [weak self] (result) in
            guard let self = self else { return }
            self.airports = result.stations.map({ RyanairModel.AirPort(name: $0.name, code: $0.code) })
        }.store(in: cancelBag)
    }

    func fetchResults() {
        //cleanViewOutput()
        guard viewStateOut.errorMessage.count == 0 else {
            display(viewStateOut.errorMessage)
            return
        }
        isLoading = true

        let origin = viewStateOut.origin.trim.uppercased()
        let destination = viewStateOut.destination.trim.uppercased()
        let dateout = DateFormatters.yearMonthDayFormatter.string(from: viewStateOut.dateDeparture)
        let adt = viewStateOut.adult
        let teen = viewStateOut.teen
        let chd = viewStateOut.children
        let apiRequest = RyanairRequestDto.Availability(origin: origin,
                                                        destination: destination,
                                                        dateout: dateout,
                                                        datein: "",
                                                        flexdaysbeforeout: "3",
                                                        flexdaysout: "3",
                                                        flexdaysbeforein: "3",
                                                        flexdaysin: "3",
                                                        adt: adt,
                                                        teen: teen,
                                                        chd: chd,
                                                        roundtrip: true,
                                                        ToUs: "AGREED")
        let availability = self.fetcher.availability(request: apiRequest, cache: .cacheElseLoad)
        availability.sink(receiveCompletion: { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading()
        }) { [weak self] (result) in
            guard let self = self else { return }
            self.trips = result.trips
        }.store(in: cancelBag)
    }
}

extension RyanairView1ViewModel.ViewStateOut {
    var errorMessage: String {
        var acc = ""
        // Don't allow any negative passenger
        if children < 0 || adult < 0 || teen < 0 {
            acc = "\(acc)No negative passengers...\n"
        }
        // At least one passenger
        if children == 0 && adult == 0 && teen == 0 {
            acc = "\(acc)Add passengers...\n"
        }
        // Airports info filled
        if origin.count < 3 && destination.count < 3 {
            acc = "\(acc)Add airports\n"
        }
        // Departure date filled (improve validation!)
        if dateDeparture < Date() {
            acc = "\(acc)Invalid departure date\n"
        }
        return acc
    }
}

// MARK: - Router

public extension RyanairView1ViewModel {
    func routeWithFight(id: String) -> some View {
        var param: RyanairResponseDto.Flight!
        trips.forEach { (trip) in
            trip.flights.forEach { (flight) in
                if flight.id == id {
                    param = flight
                }
            }
        }
        return RyanairView2Builder.buildView(flight: param)
    }
}
