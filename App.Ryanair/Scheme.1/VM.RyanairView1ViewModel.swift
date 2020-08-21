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

class ViewRequestState: ObservableObject {
    @Published var children = 0
    @Published var teen = 0
    @Published var adult = 0
    @Published var origin = ""
    @Published var destination = ""
    @Published var dateDeparture = Calendar.current.date(byAdding: .day, value: 1, to: Date())! // Tomorrow...

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

struct ViewResults: Identifiable {
    var id = UUID()
    let title: String
    let subtitle: String
}

extension ViewResults: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public class RyanairView1ViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var outputText: String = ""
    @Published var outputList: [ViewResults] = []
    @Published var viewRequest: ViewRequestState = ViewRequestState()

    private var airports: [AirPorts] = []
    var airportsDepartureSuggestions: [AirPorts] = []
    var airportsArrivalSuggestions: [AirPorts] = []
    private let fetcher: APIRyanairProtocol
    private var repository: RepositoryRyanairProtocol
    private var cancelBag = CancelBag()

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
            guard some.count >= 2 else { return } // User must type 2 chars for autocomplete
            let value = some.lowercased()
            self.airportsDepartureSuggestions = self.airports.filter({ $0.name.lowercased().contains(value) || $0.code.lowercased().contains(value) })
        }.store(in: cancelBag)

        // Update destination suggestions
        destination.sink { [weak self] (some) in
            guard let self = self else { return }
            guard some.count >= 2 else { return } // User must type 2 chars for autocomplete
            let value = some.lowercased()
            self.airportsArrivalSuggestions = self.airports.filter({ $0.name.lowercased().contains(value) || $0.code.lowercased().contains(value) })
        }.store(in: cancelBag)

        self.outputList.append(ViewResults(title: "title_1", subtitle: "subtitle_1"))
        self.outputList.append(ViewResults(title: "title_2", subtitle: "subtitle_1"))
        self.outputList.append(ViewResults(title: "title_3", subtitle: "subtitle_1"))
        self.outputList.append(ViewResults(title: "title_4", subtitle: "subtitle_1"))

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
            switch result {
            case .finished: ()
            case .failure(let error): self.display("No results")
            }
        }) { [weak self]  (result) in
            guard let self = self else { return }
            if let flights = result.trips.first?.dates.first?.flights, flights.count > 0 {
                self.display("FLIGTH on first date \n\n\(flights)")
                flights.forEach { (some) in
                    // STRONG SELF
                    self.outputList.append(ViewResults(title: some.flightKey, subtitle: some.flightNumber))
                }
            } else if let dates = result.trips.first?.dates {
                self.display("No fligth on any of the dates dates\n\n\(dates)")
                dates.forEach { (some) in
                    // STRONG SELF
                    self.outputList.append(ViewResults(title: "\(some)", subtitle: ""))
                }
            } else {
                self.display("Weird\n\n\(result)")
            }
        }.store(in: cancelBag)
    }
}
