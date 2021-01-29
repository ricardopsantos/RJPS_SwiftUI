//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import RJSLibUFBase

public class SimpleNetworkAgentB: SimpleNetworkAgentProtocol {
    private init() { self.session = URLSession.defaultForConnectivity }
    public var session: URLSession
    public init(session: URLSession = URLSession.defaultForConnectivity) {
        self.session = session
    }
}

public extension SimpleNetworkAgentB {
    func run<T>(_ components: URLComponents, _ decoder: JSONDecoder, _ dumpResponse: Bool) -> AnyPublisher<T, APIError> where T: Decodable {
        // Try to create an instance of URL from the URLComponents. If this fails, return an error
        // wrapped in a Fail value. Then, erase its type to AnyPublisher, since that’s the method’s return type.
        guard let url = components.url else {
            let error = APIError.network(description: "Couldn't create URL")
            print("# Couldn't create URL")
            print(components)
            return Fail(error: error).eraseToAnyPublisher()
        }

        //print(url.absoluteString)

        // Uses the new URLSession method dataTaskPublisher(for:) to fetch the data. This method takes
        // an instance of URLRequest and returns either a tuple (Data, URLResponse) or a URLError.
        return session.dataTaskPublisher(for: URLRequest(url: url))
            // Because the method returns AnyPublisher<T, WeatherError>, you map the error from URLError to WeatherError.
            .mapError { error in
                print(components)
                print("\(error)")
                print("\(error.localizedDescription)")
                return APIError.network(description: error.localizedDescription)
            }
            // The uses of flatMap deserves a post of their own. Here, you use it to convert the data
            // coming from the server as JSON to a fully-fledged object. You use decode(_:) as an auxiliary
            // function to achieve this. Since you are only interested in the first value emitted by the network request, you set .max(1).
            .flatMap(maxPublishers: .max(1)) { [weak self] pair in self!.decode(pair.data, url, decoder, dumpResponse) }
            .receive(on: DispatchQueue.main)
            // If you don’t use eraseToAnyPublisher() you’ll have to carry over the full type returned
            // by flatMap: Publishers.FlatMap<AnyPublisher<_, WeatherError>, Publishers.MapError<URLSession.DataTaskPublisher, WeatherError>>.
            // As a consumer of the API, you don’t want to be burdened with these details. So, to improve the API ergonomics,
            // you erase the type to AnyPublisher. This is also useful because adding any new transformation (e.g. filter)
            // changes the returned type and, therefore, leaks implementation details.
            .eraseToAnyPublisher()
    }

    private func decode<T: Decodable>(_ data: Data, _ url: URL, _ decoder: JSONDecoder, _ dumpResponse: Bool) -> AnyPublisher<T, APIError> {
        if dumpResponse {
            print("url: \(url)\n\(String(decoding: data, as: UTF8.self))")
            print(data)
        }

        let dataFormatEscaped = Data(String(decoding: data, as: UTF8.self).utf8)

        return Just(dataFormatEscaped)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                print("########################## DECODE ERROR ########################## ")
                print("# Expected   : \(T.self)")
                print("# Error      : \(error.localizedDescription)")
                print("# Error full : \(error)\n")
                return APIError.parsing(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }

}
