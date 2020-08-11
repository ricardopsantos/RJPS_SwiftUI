import Foundation
import Combine

// https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/

/*
 Agent is a promise-based HTTP client. It fulfils and configures requests by passing a single URLRequest object to it.
 The agent automatically transforms JSON data into a Codable value and returns an AnyPublisher instance:

 1 - Response<T> carries both parsed value and a URLResponse instance. The latter can be used for status code validation and logging.
 2 - The run<T>() method is the single entry point for requests execution. It accepts a URLRequest instance that fully
 describes the request configuration. The decoder is optional in case custom JSON parsing is needed.
 3 - Create data task as a Combine publisher.
 4 - Parse JSON data. We have constrained T to be Decodable in the run<T>() method declaration.
 5 - Create the Response<T> object and pass it downstream. It contains the parsed value and the URL response.
 6 - Deliver values on the main thread.
 7 - Erase publisher’s type and return an instance of AnyPublisher.

 */
class SimpleNetworkAgent_A {
    // 1
    struct Response<T: Decodable> {
        let value: T
        let response: URLResponse
    }

    // 2
    func run<T>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, APIError> where T: Decodable {
        return URLSession.shared
           .dataTaskPublisher(for: request) // 3
           .tryMap { result -> Response<T> in
               let value = try decoder.decode(T.self, from: result.data) // 4
               return Response(value: value, response: result.response)  // 5
           }
           .mapError { error in .network(description: error.localizedDescription) }
           .receive(on: DispatchQueue.main) // 6
           .eraseToAnyPublisher()           // 7
    }

    private func decode<T>(_ data: Data, _ request: URLRequest, _ dumpResponse: Bool) -> AnyPublisher<T, APIError> where T: Decodable {
        if dumpResponse {
            print("request: \(request)\n\(String(decoding: data, as: UTF8.self))")
        }

        let decoder = JSONDecoder()
        //decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data).decode(type: T.self, decoder: decoder).mapError { error in .parsing(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
}
