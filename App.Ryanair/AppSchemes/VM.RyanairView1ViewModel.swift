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

    var isValid: Bool {
        return children >= 0 && adult >= 0 && teen >= 0 && origin.count >= 3 && destination.count >= 3
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
        Publishers.CombineLatest(viewRequest.$origin, viewRequest.$destination).sink(receiveValue: { [weak self] _ in
            self?.refreshData()
        }).store(in: cancelBag)

        // Observer passenger changes
        Publishers.CombineLatest3(viewRequest.$adult, viewRequest.$children, viewRequest.$teen).sink(receiveValue: { [weak self] _ in
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
        guard viewRequest.isValid else { return }
        isLoading = true
        let apiRequest = RyanairRequestDto.Availability(origin: viewRequest.origin.uppercased(),
                                                        destination: viewRequest.destination.uppercased(),
                                                        dateout: "2021-08-09",
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
            case .finished: self.display("")
            case .failure(let error): self.display("No results : \(error)")
            }
        }) { [weak self]  (result) in
            guard let self = self else { return }
            let count = result.trips.first?.dates.first?.flights.count
            if let flight = result.trips.first?.dates.first?.flights.first {
                self.display("\(count) \n\n\(flight)")
            }
        }.store(in: cancelBag)
    }
}
