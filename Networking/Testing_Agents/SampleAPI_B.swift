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
}

// MARK: - Protocol implementation

extension SampleAPI_B: SampleAPIProtocol {
    public func repos(username: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        return Self.Constants.agent.run(SampleAPI_B.repos(username: username), SampleAPI_B.Constants.decoder, SampleAPI_B.Constants.dumpResponse)
    }

    public func issues(repo: String, owner: String) -> AnyPublisher<[APIResponseDto.Issue], APIError> {
        return Self.Constants.agent.run(SampleAPI_B.issues(repo: repo, owner: owner), SampleAPI_B.Constants.decoder, SampleAPI_B.Constants.dumpResponse)
    }

    public func repos(org: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        return Self.Constants.agent.run(SampleAPI_B.repos(org: org), SampleAPI_B.Constants.decoder, SampleAPI_B.Constants.dumpResponse)
    }

    public func members(org: String) -> AnyPublisher<[APIResponseDto.User], APIError> {
        return Self.Constants.agent.run(SampleAPI_B.members(org: org), SampleAPI_B.Constants.decoder, SampleAPI_B.Constants.dumpResponse)
    }

}

// MARK: - Requestables

private extension SampleAPI_B {
     static func repos(username: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_B.Constants.scheme
        components.host   = SampleAPI_B.Constants.host
        components.path   = SampleAPI_B.Constants.path + "/users/\(username)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

     static func issues(repo: String, owner: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_B.Constants.scheme
        components.host   = SampleAPI_B.Constants.host
        components.path   = SampleAPI_B.Constants.path + "/repos/\(owner)/\(repo)/issues"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

     static func repos(org: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_B.Constants.scheme
        components.host   = SampleAPI_B.Constants.host
        components.path   = SampleAPI_B.Constants.path + "/orgs/\(org)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

     static func members(org: String) -> URLComponents {
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
