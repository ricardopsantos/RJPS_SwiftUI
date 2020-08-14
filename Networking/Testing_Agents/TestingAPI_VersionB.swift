//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import DevTools
import Storage

// MARK: - Class & Constants

public class TestingAPI_VersionB {
    public struct Constants {
        static let agent = SimpleNetworkAgent_B()
        static let scheme = "https"
        static let host = "api.github.com"
        static let path = "" // API Version
        static let dumpResponse = false
        static let decoder = JSONDecoder()
    }
    var decoder: JSONDecoder { return Self.Constants.decoder }
    var dumpResponse: Bool { return Self.Constants.dumpResponse }
    var subscriptions: Set<AnyCancellable> = []
}

extension TestingAPI_VersionB: TestingAPIProtocol {
    public func repos(username: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        let key = "\(#function)"
        let params = [username]
        if let cached = APICacheManager.shared.get(key: key, params: params, type: [APIResponseDto.Repository].self) {
            return Just(cached).mapError { _ in .none }.eraseToAnyPublisher()
        }
        let response: AnyPublisher<[APIResponseDto.Repository], APIError> = run(repos(username: username), decoder, dumpResponse)
        response.sink(receiveCompletion: { (result) in
            switch result {
            case .finished: _ = ()
            case .failure(let error): _ = error
            }
        }, receiveValue: { (data) in
            APICacheManager.shared.save(data, key: key, params: params, lifeSpam: 5)
        }).store(in: &subscriptions)
        return response
    }

    public func issues(repo: String, owner: String) -> AnyPublisher<[APIResponseDto.Issue], APIError> {
        return run(issues(repo: repo, owner: owner), decoder, dumpResponse)
    }

    public func repos(org: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        return run(repos(org: org), decoder, dumpResponse)
    }

    public func members(org: String) -> AnyPublisher<[APIResponseDto.User], APIError> {
        return run(members(org: org), decoder, dumpResponse)
    }

}

// MARK: - Requestables

private extension TestingAPI_VersionB {
    func repos(username: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/users/\(username)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

    func issues(repo: String, owner: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/repos/\(owner)/\(repo)/issues"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

    func repos(org: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/orgs/\(org)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

    func members(org: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/orgs/\(org)/members"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

}

// MARK: - Private

private extension TestingAPI_VersionB {
    func run<T>(_ components: URLComponents, _ decoder: JSONDecoder, _ dumpResponse: Bool) -> AnyPublisher<T, APIError> where T: Decodable {
        return Self.Constants.agent.run(components, decoder, dumpResponse)
    }
}
