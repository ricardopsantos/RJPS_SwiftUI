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

public class Schemes1TemplateViewModel: ObservableObject {

    // The properly delegate @Published modifier makes it possible to observe
    // the city property. You’ll see in a moment how to leverage this.
    @Published var city: String = ""
    @Published var isAnimating: Bool = false

    // You’ll keep the View’s data source in the ViewModel. This is in contrast
    // to what you might be used to doing in MVC. Because the property is marked @Published,
    // the compiler automatically synthesizes a publisher for it. SwiftUI subscribes to
    // that publisher and redraws the screen when you change the property.
    //@Published var dataSource: [VM.DailyWeatherRowViewModel] = []

    private let fetcher: APIRyanairProtocol
    private var repository: RepositoryRyanairProtocol

    // Think of disposables as a collection of references to requests.
    // Without keeping these references, the network requests you’ll make won’t be
    // kept alive, preventing you from getting responses from the server.
    private var cancelBag = CancelBag()

    public init(fetcher: APIRyanairProtocol, repository: RepositoryRyanairProtocol, scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")) {
        self.fetcher = fetcher
        self.repository = repository

       /* let observer = $city.dropFirst(1).debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)

        // 1 - call fetchWeather
        _ = observer.sink(receiveValue: fetchWeather(forCity:)).store(in: cancelBag)

        // 2 - Update AppDefaultsRepository.shared.lastCity on change
        _ = observer.sink(receiveValue: { [weak self] (some) in
            self?.repository.lastCity = some
        }).store(in: cancelBag)

        // After the observers, so that when we change the value of [city] the app will react
        // and refresh
        self.city = repository.lastCity*/
    }
}

private extension Schemes1TemplateViewModel {

    func fetchWeather(forCity city: String) {

        /*
        isAnimating = true
        // Start by making a new request to fetch the information from the OpenWeatherMap API.
        // Pass the city name as the argument.
        fetcher.weeklyWeatherForecast(forCity: city)
            .map {
                // Map the response (WeeklyForecastResponse object) to an array of DailyWeatherRowViewModel
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
                    self?.isAnimating = false
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
            // Finally, add the cancellable reference to the disposables set. As previously
            // mentioned, without keeping this reference alive, the network publisher will terminate immediately.
            .store(in: cancelBag)*/
    }
}
/*
extension WeeklyWeatherViewModel {
    var currentWeatherView: some View {
        let viewModel = VM.CurrentWeatherViewModel(city: city, weatherFetcher: fetcher)
        return CurrentWeatherView(viewModel: viewModel)
    }
}*/
