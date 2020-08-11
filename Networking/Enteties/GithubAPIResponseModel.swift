//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public struct GithubAPIResponseModel {
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
