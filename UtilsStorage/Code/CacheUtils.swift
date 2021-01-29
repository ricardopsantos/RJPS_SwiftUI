//
//  Created by Ricardo Santos on 13/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import RJSLibUFBase

struct CacheUtils {
    static func composedKey(_ key: String, _ keyParams: [String]) -> String {
        return "\(key)_\(parseKeyParams(keyParams))"
    }

    static func parseKeyParams(_ params: [String]) -> String {
        return "[" + params.joined(separator: ",") + "]"
    }
}
