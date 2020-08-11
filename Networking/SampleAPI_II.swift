//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

// MARK: - Protocol

public protocol SampleAPI_II_Protocol {
    func repos(username: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], APIErrorEntity>
    func issues(repo: String, owner: String) -> AnyPublisher<[GithubAPIResponseModel.Issue], APIErrorEntity>
    func repos(org: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], APIErrorEntity>
    func members(org: String) -> AnyPublisher<[GithubAPIResponseModel.User], APIErrorEntity>
}

// MARK: - Class & Constants

public class SampleAPI_II {
    public struct Constants {
        static let scheme = "https"
        static let host = "api.github.com"
        static let path = "" // API Version
    }
}

// MARK: - Protocol implementation

extension SimpleNetworkAgent_B: SampleAPI_II_Protocol {
    public func repos(username: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], APIErrorEntity> {
        return run(with: SampleAPI_II.repos(username: username), dumpResponse: true)
    }

    public func issues(repo: String, owner: String) -> AnyPublisher<[GithubAPIResponseModel.Issue], APIErrorEntity> {
        return run(with: SampleAPI_II.issues(repo: repo, owner: owner), dumpResponse: true)
    }

    public func repos(org: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], APIErrorEntity> {
        return run(with: SampleAPI_II.repos(org: org), dumpResponse: true)
    }

    public func members(org: String) -> AnyPublisher<[GithubAPIResponseModel.User], APIErrorEntity> {
        return run(with: SampleAPI_II.members(org: org), dumpResponse: true)
    }

}

// MARK: - Requestables

private extension SampleAPI_II {
     static func repos(username: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_II.Constants.scheme
        components.host   = SampleAPI_II.Constants.host
        components.path   = SampleAPI_II.Constants.path + "/users/\(username)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

     static func issues(repo: String, owner: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_II.Constants.scheme
        components.host   = SampleAPI_II.Constants.host
        components.path   = SampleAPI_II.Constants.path + "/repos/\(owner)/\(repo)/issues"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

     static func repos(org: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_II.Constants.scheme
        components.host   = SampleAPI_II.Constants.host
        components.path   = SampleAPI_II.Constants.path + "/orgs/\(org)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

     static func members(org: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_II.Constants.scheme
        components.host   = SampleAPI_II.Constants.host
        components.path   = SampleAPI_II.Constants.path + "/orgs/\(org)/members"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

}
