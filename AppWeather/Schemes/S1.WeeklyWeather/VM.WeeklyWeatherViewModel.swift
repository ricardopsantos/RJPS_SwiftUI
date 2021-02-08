//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
//
import RJSLibUFBase
//
import Utils
import AppWeatherCore
import AppWeatherDomain
import BaseDomain

public extension VM {

    class WeeklyWeatherViewModel: ObservableObject {

        // Encapsulate the ViewModel internal/auxiliar state properties
        @Published private var vmInternalState: ViewModelState = ViewModelState()
        class ViewModelState: ObservableObject {

        }

        // Encapsulate that the View properties that the ViewModel needs to read on to work
        @Published var viewOut: ViewStateOut = ViewStateOut()
        class ViewStateOut: ObservableObject {
            @Published var city: String = ""
        }

        // Encapsulate that the View properties that the ViewModel updates in order to change UI
        @Published var viewIn: ViewStateIn = ViewStateIn()
        class ViewStateIn: ObservableObject {
            @Published fileprivate(set) var dataSourceB: [VM.DailyWeatherRowViewModel] = []
        }

        @Published var isLoading: Bool = false

        private let fetcher: APIWeatherProtocol
        private var repository: RepositoryWeatherProtocol
        private var cancelBag = CancelBag()

        public init(fetcher: APIWeatherProtocol, repository: RepositoryWeatherProtocol, scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")) {
            self.fetcher = fetcher
            self.repository = repository

            let observer = self.viewOut.$city.dropFirst(1).debounce(for: .seconds(1), scheduler: DispatchQueue.main)

            // 1 - call fetchWeather
            observer.sink(receiveValue: fetchWeather(forCity:)).store(in: cancelBag)

            // 2 - Update AppDefaultsRepository.shared.lastCity on change
            observer.sink(receiveValue: { [weak self] (some) in
                self?.repository.lastCity = some
            }).store(in: cancelBag)

            // This code is after the observers, so that when we change the value of [city] the app will react and refresh
            self.viewOut.city = repository.lastCity
            
        }
    }
}

private extension VM.WeeklyWeatherViewModel {

    func fetchWeather(forCity city: String) {

        self.isLoading = true
        // Start by making a new request to fetch the information from the OpenWeatherMap API.
        // Pass the city name as the argument.
        fetcher.weeklyWeatherForecast(request: RequestDto.WeeklyWeatherForecast(city: city), cache: .cacheElseLoad)
            .map { response in response.list.map(VM.DailyWeatherRowViewModel.init) }
            .map(Array.removeDuplicates)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    self.isLoading = false
                    switch value {
                    case .failure: self.viewIn.dataSourceB = []
                    case .finished: break
                    }
                },
                receiveValue: { [weak self] records in
                    guard let self = self else { return }
                    self.viewIn.dataSourceB = records
                    DevTools.log("Received \(records.count) records. \(records.map({ $0.temperature }))")
            })
            .store(in: cancelBag)
    }
}

extension VM.WeeklyWeatherViewModel {
    var currentWeatherView: some View {
        let viewModel = VM.CurrentWeatherViewModel(city: viewOut.city, weatherFetcher: fetcher)
        return CurrentWeatherView(viewModel: viewModel)
    }
}
