//
//  Created by Ricardo Santos on 10/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

// https://nshipster.com/propertywrapper/
@propertyWrapper
public struct AppUserDefaults<T> {
    public let key: String
    public let defaultValue: T
    public init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    public var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
