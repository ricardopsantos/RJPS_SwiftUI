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
    @Published var origin = "DUB"
    @Published var destination = "STN"
    @Published var dateDeparture = Formatters.yearMonthDayFormatter.string(from: Date())

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
        if dateDeparture.count != "2020-01-01".count {
            acc = "\(acc)Invalid departure date\n"
        }

        return acc
    }
}

struct AirPorts {
    let name: String
    let code: String
}

public class RyanairView1ViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var output: String = ""
    @Published var viewRequest: ViewRequestState = ViewRequestState()

    private var airports: [AirPorts] = []
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
        let destination = viewRequest.$origin.debounce(for: 0.8, scheduler: RunLoop.main)
        Publishers.CombineLatest(origin, destination).sink(receiveValue: { [weak self] _ in
            self?.refreshData()
        }).store(in: cancelBag)

        // Observer passenger changes
        let adult = viewRequest.$adult.debounce(for: 0.8, scheduler: RunLoop.main)
        let children = viewRequest.$children.debounce(for: 0.8, scheduler: RunLoop.main)
        let teen = viewRequest.$teen.debounce(for: 0.8, scheduler: RunLoop.main)
        Publishers.CombineLatest3(adult, children, teen).sink(receiveValue: { [weak self] _ in
            self?.refreshData()
        }).store(in: cancelBag)

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
            self?.output = message
        }
    }

    func refreshData() {
        guard viewRequest.errorMessage.count == 0 else {
            display(viewRequest.errorMessage)
            return
        }
        isLoading = true
        let apiRequest = RyanairRequestDto.Availability(origin: viewRequest.origin.trim.uppercased(),
            destination: viewRequest.destination.trim.uppercased(),
            dateout: viewRequest.dateDeparture.trim.uppercased(),
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
            let count = result.trips.first?.dates.first?.flights.count
            if let flight = result.trips.first?.dates.first?.flights.first {
                self.display("\(count) \n\n\(flight)")
            } else {
                self.display("Weird\n\n\(result)")
            }
        }.store(in: cancelBag)
    }
}
