//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public struct Response<T: Decodable> {
    public let value: T
    public let response: Any
    public init(value: T, response: Any) {
        self.value = value
        self.response = response
    }
}
