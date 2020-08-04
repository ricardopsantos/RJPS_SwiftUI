//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine

public extension VM {
    class CurrentWeather_ViewModel: ObservableObject {
        @Published var dataSource: CurrentWeatherRow_ViewModel?

        let city: String
        private let weatherFetcher: WeatherAPI_Protocol
        private var disposables = Set<AnyCancellable>()

        init(city: String, weatherFetcher: WeatherAPI_Protocol) {
            self.weatherFetcher = weatherFetcher
            self.city = city
        }

        func refresh() {
            weatherFetcher
                .currentWeatherForecast(forCity: city)
                .map(VM.CurrentWeatherRow_ViewModel.init)
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
                .store(in: &disposables)
        }
    }
}
