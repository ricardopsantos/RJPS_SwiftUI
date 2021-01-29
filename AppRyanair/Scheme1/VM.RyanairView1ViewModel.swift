//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
//
import RJSLibUFBase
//
import UtilsExtensions
import Utils
//
import BaseDomain
import AppRyanairDomain
import AppRyanairCore

public extension VM {
    class RyanairView1ViewModel: ObservableObject {

        // Encapsulate the ViewModel internal/auxiliar state properties
        @Published private var vmInternalState: ViewModelState = ViewModelState()
        class ViewModelState: ObservableObject {
            fileprivate var airports: [RyanairModel.AirPort] = []
        }

        // Encapsulate that the View properties that the ViewModel needs to read on to work
        @Published var viewOut: ViewStateOut = ViewStateOut()
        class ViewStateOut: ObservableObject {
            @Published var children = 0
            @Published var teen = 0
            @Published var adult = 0
            @Published var origin = "" { didSet { if origin.count > 3 && oldValue.count <= 3 { origin = oldValue } } } // Limit size
            @Published var destination = "" { didSet { if destination.count > 3 && oldValue.count <= 3 { destination = oldValue } } } // Limit size
            @Published var dateDeparture = Calendar.current.date(byAdding: .day, value: 1, to: Date())! // Tomorrow...
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
                if origin.trim.count == 0 || destination.trim.count == 0 {
                    acc = "\(acc)Add airports\n"
                } else if origin.trim.count != 3 || destination.trim.count != 3 {
                    acc = "\(acc)Invalid airport code format\n"
                }

                // Departure date filled (improve validation!)
                if dateDeparture < Date() {
                    acc = "\(acc)Invalid departure date\n"
                }
                return acc
            }
        }

        // Encapsulate that the View properties that the ViewModel updates in order to change UI
        @Published var viewIn: ViewStateIn = ViewStateIn()
        class ViewStateIn: ObservableObject {
            @Published fileprivate(set) var outputText: String = ""
            @Published fileprivate(set) var outputList: [ListItemModel] = []
            @Published fileprivate(set) var airportsDepartureSuggestions: [RyanairModel.AirPort] = []
            @Published fileprivate(set) var airportsArrivalSuggestions: [RyanairModel.AirPort] = []
        }

        @Published var isLoading: Bool = false

        private let fetcher: APIRyanairProtocol
        private var repository: RepositoryRyanairProtocol
        private var cancelBag = CancelBag()

        private var trips: [RyanairResponseDto.Trip] = [] {
            didSet {
                self.viewIn.outputList = []
                self.viewIn.outputList.append(contentsOf: RyanairMappers.listItemsWith(trips: self.trips))
                if self.viewIn.outputList.count == 0 {
                    self.display("No results")
                } else {
                    self.display("")
                }
            }
        }

        public init(fetcher: APIRyanairProtocol,
                    repository: RepositoryRyanairProtocol,
                    scheduler: DispatchQueue = DispatchQueue(label: "RyanairView1ViewModel")) {
            self.fetcher = fetcher
            self.repository = repository
            fetchStations()
            observeUserInteractions()
        }
    }
}

// MARK: - Combine

private extension VM.RyanairView1ViewModel {
    func observeUserInteractions() {

        // Observer Origin/Destination (TextField) changes
        let origin = viewOut.$origin.debounce(for: 0.8, scheduler: RunLoop.main)
        let destination = viewOut.$destination.debounce(for: 0.8, scheduler: RunLoop.main)
        let dateDeparture = viewOut.$dateDeparture.debounce(for: 0.8, scheduler: RunLoop.main)

        Publishers.CombineLatest3(origin, destination, dateDeparture).sink(receiveValue: { [weak self] _ in
            self?.fetchResults()
        }).store(in: cancelBag)

        // Observer passenger changes
        let adult = viewOut.$adult.debounce(for: 0.8, scheduler: RunLoop.main)
        let children = viewOut.$children.debounce(for: 0.8, scheduler: RunLoop.main)
        let teen = viewOut.$teen.debounce(for: 0.8, scheduler: RunLoop.main)
        Publishers.CombineLatest3(adult, children, teen).sink(receiveValue: { [weak self] _ in
            self?.fetchResults()
        }).store(in: cancelBag)

        // Update departure suggestions (will show 5 hits results max)
        origin.sink { [weak self] (some) in
            guard let self = self else { return }
            self.viewIn.airportsDepartureSuggestions = []
            guard some.count > 0 && some.count < 3 else { return } // User must type 2 chars for autocomplete
            let value = some.lowercased()
            let matchs = self.vmInternalState.airports.filter({ $0.name.lowercased().contains(value) || $0.code.lowercased().contains(value) })
            self.viewIn.airportsDepartureSuggestions.append(contentsOf: matchs.prefix(5))

        }.store(in: cancelBag)

        // Update destination suggestions (will show 5 hits results max)
        destination.sink { [weak self] (some) in
            guard let self = self else { return }
            self.viewIn.airportsArrivalSuggestions = []
            guard some.count > 0 && some.count < 3 else { return } // User must type 2 chars for autocomplete
            let value = some.lowercased()
            let matchs = self.vmInternalState.airports.filter({ $0.name.lowercased().contains(value) || $0.code.lowercased().contains(value) })
            self.viewIn.airportsArrivalSuggestions.append(contentsOf: matchs.prefix(5))
        }.store(in: cancelBag)
    }
}

// MARK: - Private in/out

private extension VM.RyanairView1ViewModel {
    func hideLoading() {
        self.isLoading = false
    }

    func display(_ message: String) {
        self.hideLoading()
        self.viewIn.outputText = message
    }

    func cleanViewOutput() {
        self.trips = []
        self.viewIn.airportsArrivalSuggestions = []
        self.viewIn.airportsDepartureSuggestions = []
        self.viewIn.outputList = []
        self.viewIn.outputText = ""
        self.isLoading = false
    }
}

// MARK: - Private fetchers

private extension VM.RyanairView1ViewModel {

    func fetchStations() {
        cleanViewOutput()
        self.isLoading = true
        let stations = self.fetcher.stations(request: RyanairRequestDto.Stations(), cache: .cacheElseLoad)
        stations.sink(receiveCompletion: { [weak self] (result) in
            self?.hideLoading()
        }) { [weak self] (result) in
            guard let self = self else { return }
            self.vmInternalState.airports = result.stations.map({ RyanairModel.AirPort(name: $0.name, code: $0.code) })
        }.store(in: cancelBag)
    }

    func fetchResults() {

        guard self.vmInternalState.airports.count > 0 else {
            return
        }

        // Clear view data
        cleanViewOutput()

        // View data validations...
        var errorMessage = viewOut.errorMessage

        // View data validations : if the airport code have right shape, see it exists...
        if viewOut.origin.trim.count == 3 && !(self.vmInternalState.airports.filter({ $0.code.lowercased() == viewOut.origin.lowercased().trim }).count == 1) {
            errorMessage = "\(errorMessage)Invalid origin airport\n"
        }

        // View data validations : if the airport code have right shape, see it exists...
        if viewOut.destination.trim.count == 3 && !(self.vmInternalState.airports.filter({ $0.code.lowercased() == viewOut.destination.lowercased().trim }).count == 1) {
            errorMessage = "\(errorMessage)Invalid destination airport\n"
        }
        guard errorMessage.count == 0 else {
            display(errorMessage)
            return
        }

        // Fetch
        self.isLoading = true

        let origin = viewOut.origin.trim.uppercased()
        let destination = viewOut.destination.trim.uppercased()
        let dateout = DateFormatters.yearMonthDayFormatter.string(from: viewOut.dateDeparture)
        let adt = viewOut.adult
        let teen = viewOut.teen
        let chd = viewOut.children
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

// MARK: - Router

#warning("create some router")

public extension VM.RyanairView1ViewModel {
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
