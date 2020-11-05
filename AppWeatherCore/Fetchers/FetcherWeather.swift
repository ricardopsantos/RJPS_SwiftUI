//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import Network
//
import BaseDomain

public class FetcherWeather {
    private let session: URLSession
    public init(session: URLSession = .shared) {
        self.session = session
    }
}

extension FetcherWeather: APIWeatherProtocol {
    public func weeklyWeatherForecast(forCity city: String) -> AnyPublisher<WeatherResponseDto.WeeklyForecastEntity, APIError> {
        return forecast(with: APIWeather.makeWeeklyForecastComponents(withCity: city))
    }

    public func currentWeatherForecast(forCity city: String) -> AnyPublisher<WeatherResponseDto.CurrentWeatherForecastEntity, APIError> {
        return forecast(with: APIWeather.makeCurrentDayForecastComponents(withCity: city))
    }
}

fileprivate extension FetcherWeather {
     func forecast<T>(with components: URLComponents) -> AnyPublisher<T, APIError> where T: Decodable {
        // Try to create an instance of URL from the URLComponents. If this fails, return an error
        // wrapped in a Fail value. Then, erase its type to AnyPublisher, since that’s the method’s return type.
        guard let url = components.url else {
            let error = APIError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }

        // Uses the new URLSession method dataTaskPublisher(for:) to fetch the data. This method takes
        // an instance of URLRequest and returns either a tuple (Data, URLResponse) or a URLError.
        return session.dataTaskPublisher(for: URLRequest(url: url))
            // Because the method returns AnyPublisher<T, WeatherError>, you map the error from URLError to WeatherError.
            .mapError { error in .network(description: error.localizedDescription) }
            // The uses of flatMap deserves a post of their own. Here, you use it to convert the data
            // coming from the server as JSON to a fully-fledged object. You use decode(_:) as an auxiliary
            // function to achieve this. Since you are only interested in the first value emitted by the network request, you set .max(1).
            .flatMap(maxPublishers: .max(1)) { [weak self] pair in self!.decode(pair.data) }
            // If you don’t use eraseToAnyPublisher() you’ll have to carry over the full type returned
            // by flatMap: Publishers.FlatMap<AnyPublisher<_, WeatherError>, Publishers.MapError<URLSession.DataTaskPublisher, WeatherError>>.
            // As a consumer of the API, you don’t want to be burdened with these details. So, to improve the API ergonomics,
            // you erase the type to AnyPublisher. This is also useful because adding any new transformation (e.g. filter)
            // changes the returned type and, therefore, leaks implementation details.
            .eraseToAnyPublisher()
    }

    func decode<T>(_ data: Data) -> AnyPublisher<T, APIError> where T: Decodable {
        //let str = String(decoding: data, as: UTF8.self)
        //
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data).decode(type: T.self, decoder: decoder).mapError { error in
            .parsing(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }

}
