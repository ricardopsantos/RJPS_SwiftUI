//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

public protocol TestingAPIProtocol {
    func repos(username: String) -> AnyPublisher<[APIResponseDto.Repository], APIError>
    func issues(repo: String, owner: String) -> AnyPublisher<[APIResponseDto.Issue], APIError>
    func repos(org: String) -> AnyPublisher<[APIResponseDto.Repository], APIError>
    func members(org: String) -> AnyPublisher<[APIResponseDto.User], APIError>
}

public struct APIResponseDto {
    private init() { }
    public struct User: Codable {
        let id: Int
    }

    public struct Repository: Codable {
        let id: Int
        let name: String
        let description: String?
    }

    public struct Issue: Codable {
        let id: Int
    }
}
