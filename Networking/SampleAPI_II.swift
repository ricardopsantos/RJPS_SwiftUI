//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

// MARK: - Protocol

public protocol SampleAPI_II_Protocol {
    func repos(username: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], APIErrorEntity>
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
        return run(with: SampleAPI_II.repos(username: username))
    }
}

// MARK: - Requestables

private extension SampleAPI_II {
     static func repos(username: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SampleAPI_II.Constants.scheme
        components.host   = SampleAPI_II.Constants.host
        components.path   = SampleAPI_II.Constants.path
        components.queryItems = [
            URLQueryItem(name: "users", value: username),
            URLQueryItem(name: "repos", value: "")
        ]
        return components
    }
}
