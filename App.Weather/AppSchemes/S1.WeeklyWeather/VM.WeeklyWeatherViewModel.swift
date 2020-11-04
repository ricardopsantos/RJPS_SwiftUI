//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
//
import DevTools
import Utils_Extensions
import Utils
//
import App_Weather_Core

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
        fetcher.weeklyWeatherForecast(forCity: city)
            .map {
                // Map the response (WeatherResponseDto.WeeklyForecastEntity object) to an array of DailyWeatherRowViewModel
                // objects. This entity represents a single row in the list. You can check the
                // implementation located in DailyWeatherRowViewModel.swift. With MVVM, it’s paramount
                // for the ViewModel layer to expose to the View exactly the data it will need. It
                // doesn’t make sense to expose directly to the View a WeeklyForecastResponse, since
                // this forces the View layer to format the model in order to consume it. It’s a good
                // idea to make the View as dumb as possible and concerned only with rendering.
                response in response.list.map(VM.DailyWeatherRowViewModel.init)
        }
            // The OpenWeatherMap API returns multiple temperatures for the same day depending on
            // the time of the day, so remove the duplicates. You can check Array+Filtering.swift to see how that’s done.
            .map(Array.removeDuplicates)
            // Although fetching data from the server, or parsing a blob of JSON, happens on a
            // background queue, updating the UI must happen on the main queue. With receive(on:),
            // you ensure the update you do in steps 5, 6 and 7 occurs in the right place.
            .receive(on: DispatchQueue.main)
            // Start the publisher via sink(receiveCompletion:receiveValue:). This is where
            // you update dataSource accordingly. It’s important to notice that handling a
            // completion — either a successful or failed one — happens separately from handling values.
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
            // Finally, add the cancellable reference to the disposables set. As previously
            // mentioned, without keeping this reference alive, the network publisher will terminate immediately.
            .store(in: cancelBag)
    }
}

extension VM.WeeklyWeatherViewModel {
    var currentWeatherView: some View {
        let viewModel = VM.CurrentWeatherViewModel(city: viewOut.city, weatherFetcher: fetcher)
        return CurrentWeatherView(viewModel: viewModel)
    }
}
