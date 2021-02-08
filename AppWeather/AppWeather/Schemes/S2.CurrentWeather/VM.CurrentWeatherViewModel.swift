//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
//
import RJSLibUFBase
import Utils
//
import AppWeatherDomain
import AppWeatherCore
import BaseDomain

public extension VM {
    class CurrentWeatherViewModel: ObservableObject {
        
        @Published var dataSource: CurrentWeatherRowViewModel?
        @State var isAnimating: Bool = true
        let city: String

        private let fetcher: APIWeatherProtocol
        private var cancelBag = CancelBag()

        init(city: String, weatherFetcher: APIWeatherProtocol) {
            self.fetcher = weatherFetcher
            self.city = city
        }

        func refresh() {
            fetcher
                .currentWeatherForecast(request: RequestDto.CurrentWeatherForecast(city: self.city), cache: .cacheElseLoad)
                .map(VM.CurrentWeatherRowViewModel.init)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure: self.dataSource = nil
                    case .finished:
                        break
                    }
                    }, receiveValue: { [weak self] weather in
                        guard let self = self else { return }
                        self.dataSource = weather
                })
                .store(in: cancelBag)
        }
    }
}
