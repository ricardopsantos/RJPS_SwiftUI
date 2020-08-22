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

class ViewRequestState: ObservableObject {
    @Published var children = 0
    @Published var teen = 0
    @Published var adult = 0
    @Published var origin = "DUB"
    @Published var destination = "STN"
    @Published var dateDeparture = Calendar.current.date(byAdding: .day, value: 1, to: Date())! // Tomorrow...
}

extension ViewRequestState {
    var errorMessage: String {
        var acc = ""
        // Dont allow any negative passenger
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

struct AirPorts: Identifiable {
    var id: String { return code }
    let name: String
    let code: String
}

extension AirPorts: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
        hasher.combine(name)
    }
}

public struct Mappers {
    private init() { }
}

public extension Mappers {

    static func listItemsWith(trips: [RyanairResponseDto.Trip]) -> [ListItemModel] {
        var acc: [ListItemModel] = []
        trips.forEach { (trip) in
            trip.flights.forEach { (flight) in
                let flightNumber = flight.flightNumber
                let duration = flight.duration
                let timeUTC = flight.timeUTC
                let title = "\(flightNumber) | \(timeUTC)"
                let subTitle = "\(duration)"
                acc.append(ListItemModel(id: flight.id, title: title, subtitle: subTitle))
            }
        }
        return acc
    }
}

public extension RyanairView1ViewModel {
    func goTo(id: String) -> some View {
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

public class RyanairView1ViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var outputText: String = ""
    @Published var outputList: [ListItemModel] = []
    @Published var viewRequest: ViewRequestState = ViewRequestState()

    var airportsDepartureSuggestions: [AirPorts] = []
    var airportsArrivalSuggestions: [AirPorts] = []
    private let fetcher: APIRyanairProtocol
    private var repository: RepositoryRyanairProtocol
    private var cancelBag = CancelBag()
    private var airports: [AirPorts] = []
    private var trips: [RyanairResponseDto.Trip] = [] {
        didSet {
            self.outputList.append(contentsOf: Mappers.listItemsWith(trips: trips))
            if self.outputList.count == 0 {
                self.display("No results")
            }
        }
    }
    public init(fetcher: APIRyanairProtocol,
                repository: RepositoryRyanairProtocol,
                scheduler: DispatchQueue = DispatchQueue(label: "Schemes1TemplateViewModel")) {
        self.fetcher = fetcher
        self.repository = repository
        isLoading = true

        let stations = self.fetcher.stations(request: RyanairRequestDto.Stations(), cache: .cacheElseLoad)
        _ = stations.sink(receiveCompletion: { [weak self] (result) in
            self?.hideLoading()
        }) { [weak self] (result) in
            guard let self = self else { return }
            result.stations.forEach { [weak self] (station) in
                self?.airports.append(AirPorts(name: station.name, code: station.code))
            }
            self.display("\(self.airports)")
        }.store(in: cancelBag)

        // Observer Origin/Destination changes
        let origin = viewRequest.$origin.debounce(for: 0.8, scheduler: RunLoop.main)
        let destination = viewRequest.$destination.debounce(for: 0.8, scheduler: RunLoop.main)
        let dateDeparture = viewRequest.$dateDeparture.debounce(for: 0.8, scheduler: RunLoop.main)

        Publishers.CombineLatest3(origin, destination, dateDeparture).sink(receiveValue: { [weak self] _ in
            self?.refreshData()
        }).store(in: cancelBag)

        // Observer passenger changes
        let adult = viewRequest.$adult.debounce(for: 0.8, scheduler: RunLoop.main)
        let children = viewRequest.$children.debounce(for: 0.8, scheduler: RunLoop.main)
        let teen = viewRequest.$teen.debounce(for: 0.8, scheduler: RunLoop.main)
        Publishers.CombineLatest3(adult, children, teen).sink(receiveValue: { [weak self] _ in
            self?.refreshData()
        }).store(in: cancelBag)

        // Update departure suggestions
        origin.sink { [weak self] (some) in
            guard let self = self else { return }
            self.airportsDepartureSuggestions = []
            guard some.count == 2 else { return } // User must type 2 chars for autocomplete
            let value = some.lowercased()
            self.airportsDepartureSuggestions = self.airports.filter({ $0.name.lowercased().contains(value) || $0.code.lowercased().contains(value) })
        }.store(in: cancelBag)

        // Update destination suggestions
        destination.sink { [weak self] (some) in
            guard let self = self else { return }
            self.airportsArrivalSuggestions = []
            guard some.count == 2 else { return } // User must type 2 chars for autocomplete
            let value = some.lowercased()
            self.airportsArrivalSuggestions = self.airports.filter({ $0.name.lowercased().contains(value) || $0.code.lowercased().contains(value) })
        }.store(in: cancelBag)
    }
}

private extension RyanairView1ViewModel {

    func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = false
        }
    }

    func display(_ message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.hideLoading()
            self?.outputText = message
        }
    }

    func refreshData() {
        trips = []
        guard viewRequest.errorMessage.count == 0 else {
            display(viewRequest.errorMessage)
            return
        }
        airportsDepartureSuggestions = []
        airportsArrivalSuggestions = []
        outputList = []
        outputText = ""
        isLoading = true
        let apiRequest = RyanairRequestDto.Availability(origin: viewRequest.origin.trim.uppercased(),
            destination: viewRequest.destination.trim.uppercased(),
            dateout: Formatters.yearMonthDayFormatter.string(from: viewRequest.dateDeparture),
            datein: "",
            flexdaysbeforeout: "3",
            flexdaysout: "3",
            flexdaysbeforein: "3",
            flexdaysin: "3",
            adt: viewRequest.adult,
            teen: viewRequest.teen,
            chd: viewRequest.children,
            roundtrip: true,
            ToUs: "AGREED")
        let availability = self.fetcher.availability(request: apiRequest, cache: .cacheElseLoad)
        availability.sink(receiveCompletion: { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading()
            switch result {
            case .finished: ()
            case .failure: self.display("No results")
            }
        }) { [weak self]  (result) in
            guard let self = self else { return }
            self.trips = result.trips
        }.store(in: cancelBag)
    }
}
