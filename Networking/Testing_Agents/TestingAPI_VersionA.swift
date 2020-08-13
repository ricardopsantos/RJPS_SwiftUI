//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

// https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/

// MARK: - Class & Constants

class TestingAPI_VersionA {
    public struct Constants {
        static let agent = SimpleNetworkAgent_A()
        static let scheme = "https"
        static let host = "api.github.com"
        static let base = URL(string: "\(scheme)://\(host)")!
        static let dumpResponse = false
        static let decoder = JSONDecoder()
    }
    var base: URL { return Self.Constants.base }
    var dumpResponse: Bool { return Self.Constants.dumpResponse }
    var decoder: JSONDecoder { return Self.Constants.decoder }
}

// MARK: - Protocol implementation

extension TestingAPI_VersionA: TestingAPIProtocol {

    func repos(username: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        run(reposRequest(username: username), decoder, dumpResponse)
    }

    func issues(repo: String, owner: String) -> AnyPublisher<[APIResponseDto.Issue], APIError> {
        run(issuesRequest(repo: repo, owner: owner), decoder, dumpResponse)
    }
    
    func repos(org: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        run(reposRequest(org: org), decoder, dumpResponse)
    }
    
    func members(org: String) -> AnyPublisher<[APIResponseDto.User], APIError> {
        run(membersRequest(org: org), decoder, dumpResponse)
    }
}

// MARK: - Requestables

private extension TestingAPI_VersionA {
    func reposRequest(username: String) -> URLRequest {
        URLRequest(url: base.appendingPathComponent("users/\(username)/repos"))
    }
    func issuesRequest(repo: String, owner: String) -> URLRequest {
        URLRequest(url: base.appendingPathComponent("repos/\(owner)/\(repo)/issues"))
    }
    func reposRequest(org: String) -> URLRequest {
        URLRequest(url: base.appendingPathComponent("orgs/\(org)/repos"))
    }
    func membersRequest(org: String) -> URLRequest {
        URLRequest(url: base.appendingPathComponent("orgs/\(org)/members"))
    }
}

// MARK: - Private

private extension TestingAPI_VersionA {
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder(), _ dumpResponse: Bool) -> AnyPublisher<T, APIError> {
        return Self.Constants.agent.run(request, decoder, dumpResponse).map(\.value).eraseToAnyPublisher()
    }
}
