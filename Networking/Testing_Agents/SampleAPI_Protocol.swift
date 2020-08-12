//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

public protocol SampleAPIProtocol {
    func repos(username: String) -> AnyPublisher<[APIResponseDto.Repository], APIError>
    func issues(repo: String, owner: String) -> AnyPublisher<[APIResponseDto.Issue], APIError>
    func repos(org: String) -> AnyPublisher<[APIResponseDto.Repository], APIError>
    func members(org: String) -> AnyPublisher<[APIResponseDto.User], APIError>
}
