//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

public class WeatherFetcher {
    private let session: URLSession
    public init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - WeatherAPI_Protocol
extension WeatherFetcher: WeatherAPI_Protocol {
    public func weeklyWeatherForecast(forCity city: String) -> AnyPublisher<E.WeeklyForecastResponse, E.WeatherError> {
        return forecast(with: OpenWeatherAPI.makeWeeklyForecastComponents(withCity: city))
    }

    public func currentWeatherForecast(forCity city: String) -> AnyPublisher<E.CurrentWeatherForecastResponse, E.WeatherError> {
        return forecast(with: OpenWeatherAPI.makeCurrentDayForecastComponents(withCity: city))
    }

    private func forecast<T>(with components: URLComponents) -> AnyPublisher<T, E.WeatherError> where T: Decodable {
        guard let url = components.url else {
            let error = E.WeatherError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        print("URL: \(url)")
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in .network(description: error.localizedDescription) }
            .flatMap(maxPublishers: .max(1)) { pair in decode(pair.data) }
            .eraseToAnyPublisher()
    }
}
