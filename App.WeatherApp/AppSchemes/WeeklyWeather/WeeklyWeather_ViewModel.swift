//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
import Extensions

//public extension VM {

    public class WeeklyWeather_ViewModel: ObservableObject {
        @Published var city: String = ""
        @Published var dataSource: [VM.DailyWeatherRow_ViewModel] = []

        private let weatherFetcher: WeatherAPI_Protocol
        private var disposables = Set<AnyCancellable>()

        public init(weatherFetcher: WeatherAPI_Protocol, scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")) {
            self.weatherFetcher = weatherFetcher
            _ = $city.dropFirst(1).debounce(for: .seconds(0.5), scheduler: scheduler).sink(receiveValue: fetchWeather(forCity:))
        }

        public func fetchWeather(forCity city: String) {
            weatherFetcher.weeklyWeatherForecast(forCity: city)
                .map { response in response.list.map(VM.DailyWeatherRow_ViewModel.init) }
                .map(Array.removeDuplicates)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { [weak self] value in
                        print(value)
                        guard let self = self else { return }
                        switch value {
                        case .failure: self.dataSource = []
                        case .finished: break
                        }
                    },
                    receiveValue: { [weak self] forecast in
                        guard let self = self else { return }
                        self.dataSource = forecast
                })
                .store(in: &disposables)
        }
    }
//}

extension WeeklyWeather_ViewModel {
    var currentWeatherView: some View {
        return WeeklyWeather_Builder.makeCurrentWeatherView(withCity: city, weatherFetcher: weatherFetcher)
    }
}
