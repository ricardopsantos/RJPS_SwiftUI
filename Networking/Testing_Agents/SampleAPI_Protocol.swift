//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

public protocol SampleAPI_Protocol {
    func repos(username: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], APIError>
    func issues(repo: String, owner: String) -> AnyPublisher<[GithubAPIResponseModel.Issue], APIError>
    func repos(org: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], APIError>
    func members(org: String) -> AnyPublisher<[GithubAPIResponseModel.User], APIError>
}
