//
//  Created by Ricardo Santos on 05/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import RJSLibUFBase

public struct APIKeys {
    public static func get(key: String) -> String? {
        var keys: NSDictionary?
        if let path = Bundle(identifier: "com.rjps.swiftui.utils.storage")?.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let dict = keys, let value = dict[key] as? String {
            return value.replacingOccurrences(of: " ", with: "")
        }
        if let value = ProcessInfo.processInfo.environment[key] {
            return value
        }
        RJS_Logs.error("Key [\(key)] not found")
        return nil
    }
}
