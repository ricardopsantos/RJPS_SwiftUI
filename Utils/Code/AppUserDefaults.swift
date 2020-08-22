//
//  Created by Ricardo Santos on 10/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

/** Usage

```
protocol RepositorySampleProtocol {
    var something: String { get set }
}

public class RepositorySample: ObservableObject, RepositorySampleProtocol {
    public init() { }

    public var something: String {
        get { return RepositorySampleUserDefaults.shared.lastCity }
        set { RepositorySampleUserDefaults.shared.lastCity = newValue }
    }
}

private final class RepositorySampleUserDefaults: ObservableObject {
    private init() {}
    static let shared = RepositorySampleUserDefaults()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String { return Bundle.main.bundleIdentifier! }

    @AppUserDefaults("\(id).something", defaultValue: "")
    var lastCity: String { willSet { objectWillChange.send() } }
}
```
*/

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
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}
