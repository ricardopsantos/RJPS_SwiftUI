//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

// https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/

// MARK: - Protocol

public protocol SampleAPI_I_Protocol {
    func repos(username: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], Error>
    func issues(repo: String, owner: String) -> AnyPublisher<[GithubAPIResponseModel.Issue], Error> 
    func repos(org: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], Error>
    func members(org: String) -> AnyPublisher<[GithubAPIResponseModel.User], Error>
}

// MARK: - Class & Constants

class SampleAPI_I {
    public struct Constants {
        static let agent = SimpleNetworkAgent_A()
        static let base = URL(string: "https://api.github.com")!
    }
}

// MARK: - Protocol implementation

extension SampleAPI_I: SampleAPI_I_Protocol {

    func repos(username: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], Error> {
        return run(with: reposRequest(org: username))
    }

    func issues(repo: String, owner: String) -> AnyPublisher<[GithubAPIResponseModel.Issue], Error> {
        return run(with: issuesRequest(repo: repo, owner: owner))
    }
    
    func repos(org: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], Error> {
        return run(with: reposRequest(org: org))
    }
    
    func members(org: String) -> AnyPublisher<[GithubAPIResponseModel.User], Error> {
        return run(with: membersRequest(org: org))
    }
}

// MARK: - Requestables

fileprivate extension SampleAPI_I {
    func reposRequest(username: String) -> URLRequest {
        URLRequest(url: SampleAPI_I.Constants.base.appendingPathComponent("users/\(username)/repos"))
    }
    func issuesRequest(repo: String, owner: String) -> URLRequest {
        URLRequest(url: SampleAPI_I.Constants.base.appendingPathComponent("repos/\(owner)/\(repo)/issues"))
    }
    func reposRequest(org: String) -> URLRequest {
        URLRequest(url: SampleAPI_I.Constants.base.appendingPathComponent("orgs/\(org)/repos"))
    }
    func membersRequest(org: String) -> URLRequest {
        URLRequest(url: SampleAPI_I.Constants.base.appendingPathComponent("orgs/\(org)/members"))
    }
}

// MARK: - Private

private extension SampleAPI_I {
    func run<T: Decodable>(with request: URLRequest) -> AnyPublisher<T, Error> {
        return Self.Constants.agent.run(request).map(\.value).eraseToAnyPublisher()
    }
}
