//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

// https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/

// MARK: - Class & Constants

class SampleAPI_I {
    public struct Constants {
        static let agent = SimpleNetworkAgent_A()
        static let scheme = "https"
        static let host = "api.github.com"
        static let base = URL(string: "\(scheme)://\(host)")!
        static let dumpResponse = false
    }
}

// MARK: - Protocol implementation

extension SampleAPI_I: SampleAPIProtocol {

    func repos(username: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        return run(with: reposRequest(username: username), dumpResponse: Constants.dumpResponse)
    }

    func issues(repo: String, owner: String) -> AnyPublisher<[APIResponseDto.Issue], APIError> {
        return run(with: issuesRequest(repo: repo, owner: owner), dumpResponse: Constants.dumpResponse)
    }
    
    func repos(org: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        return run(with: reposRequest(org: org), dumpResponse: Constants.dumpResponse)
    }
    
    func members(org: String) -> AnyPublisher<[APIResponseDto.User], APIError> {
        return run(with: membersRequest(org: org), dumpResponse: Constants.dumpResponse)
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
    func run<T: Decodable>(with request: URLRequest, decoder: JSONDecoder = JSONDecoder(), dumpResponse: Bool) -> AnyPublisher<T, APIError> {
        return Self.Constants.agent.run(request, decoder, dumpResponse).map(\.value).eraseToAnyPublisher()
    }
}
