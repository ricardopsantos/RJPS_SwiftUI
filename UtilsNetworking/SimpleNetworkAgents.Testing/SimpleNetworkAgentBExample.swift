//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import DevTools
import Utils
//
import BaseDomain

// MARK: - Class & Constants

public class SimpleNetworkAgentBExample {
    public struct Constants {
        static let agent = SimpleNetworkAgentB()
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

extension SimpleNetworkAgentBExample: TestingAPIProtocol {
    
    public func repos(username: String, cache: CachePolicy) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        let key = "\(#function)"
        let params = [username]

        let apiSubscriber           = run(repos(username: username), decoder, dumpResponse) as AnyPublisher<[APIResponseDto.Repository], APIError>
        let cacheSubscriberFailable = APICacheManager.shared.getAsyncFallible(key: key, params: params, type: [APIResponseDto.Repository].self)
        let cacheSubscriberFailSafe = APICacheManager.shared.getAsyncFailSafe(key: key, params: params, type: [APIResponseDto.Repository].self, onFail: apiSubscriber)

        apiSubscriber.sink(receiveCompletion: { _ in }, receiveValue: { (data) in
            APICacheManager.shared.save(data, key: key, params: params, lifeSpam: 5)
        }).store(in: &subscriptions)

        switch cache {
        case .ignoringCache: return apiSubscriber
        case .cacheElseLoad: return cacheSubscriberFailSafe
        case .cacheAndLoad : return Publishers.Merge(cacheSubscriberFailable, apiSubscriber).eraseToAnyPublisher()
        case .cacheDontLoad: return cacheSubscriberFailable.eraseToAnyPublisher()
        }
    }

    public func issues(repo: String, owner: String, cache: CachePolicy) -> AnyPublisher<[APIResponseDto.Issue], APIError> {
        return run(issues(repo: repo, owner: owner), decoder, dumpResponse)
    }

    public func repos(org: String, cache: CachePolicy) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        return run(repos(org: org), decoder, dumpResponse)
    }

    public func members(org: String, cache: CachePolicy) -> AnyPublisher<[APIResponseDto.User], APIError> {
        return run(members(org: org), decoder, dumpResponse)
    }

}

// MARK: - Requestables

private extension SimpleNetworkAgentBExample {
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

private extension SimpleNetworkAgentBExample {
    func run<T>(_ components: URLComponents, _ decoder: JSONDecoder, _ dumpResponse: Bool) -> AnyPublisher<T, APIError> where T: Decodable {
        return Self.Constants.agent.run(components, decoder, dumpResponse)
    }
}
