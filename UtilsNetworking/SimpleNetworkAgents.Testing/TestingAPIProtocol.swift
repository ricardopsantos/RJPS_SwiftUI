//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import BaseDomain

public protocol TestingAPIProtocol {
    func repos(username: String, cache: CachePolicy) -> AnyPublisher<[APIResponseDto.Repository], APIError>
    func issues(repo: String, owner: String, cache: CachePolicy) -> AnyPublisher<[APIResponseDto.Issue], APIError>
    func repos(org: String, cache: CachePolicy) -> AnyPublisher<[APIResponseDto.Repository], APIError>
    func members(org: String, cache: CachePolicy) -> AnyPublisher<[APIResponseDto.User], APIError>
}
