//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

// MARK: - Class & Constants

public class SampleAPI_B {
    public struct Constants {
        static let agent = SimpleNetworkAgent_B()
        static let scheme = "https"
        static let host = "api.github.com"
        static let path = "" // API Version
        static let dumpResponse = false
        static let decoder = JSONDecoder()
    }
    var decoder: JSONDecoder { return SampleAPI_B.Constants.decoder }
    var dumpResponse: Bool { return SampleAPI_B.Constants.dumpResponse }
}

// MARK: - Protocol implementation

extension SampleAPI_B: SampleAPIProtocol {
    public func repos(username: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        run(repos(username: username), decoder, dumpResponse)
    }

    public func issues(repo: String, owner: String) -> AnyPublisher<[APIResponseDto.Issue], APIError> {
        run(issues(repo: repo, owner: owner), decoder, dumpResponse)
    }

    public func repos(org: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        run(repos(org: org), decoder, dumpResponse)
    }

    public func members(org: String) -> AnyPublisher<[APIResponseDto.User], APIError> {
        run(members(org: org), decoder, dumpResponse)
    }

}

// MARK: - Requestables

private extension SampleAPI_B {
    func repos(username: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_B.Constants.scheme
        components.host   = SampleAPI_B.Constants.host
        components.path   = SampleAPI_B.Constants.path + "/users/\(username)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

    func issues(repo: String, owner: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_B.Constants.scheme
        components.host   = SampleAPI_B.Constants.host
        components.path   = SampleAPI_B.Constants.path + "/repos/\(owner)/\(repo)/issues"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

    func repos(org: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_B.Constants.scheme
        components.host   = SampleAPI_B.Constants.host
        components.path   = SampleAPI_B.Constants.path + "/orgs/\(org)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

    func members(org: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_B.Constants.scheme
        components.host   = SampleAPI_B.Constants.host
        components.path   = SampleAPI_B.Constants.path + "/orgs/\(org)/members"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

}

// MARK: - Private

private extension SampleAPI_B {
    func run<T>(_ components: URLComponents, _ decoder: JSONDecoder, _ dumpResponse: Bool) -> AnyPublisher<T, APIError> where T: Decodable {
        return Self.Constants.agent.run(components, decoder, dumpResponse)
    }
}
