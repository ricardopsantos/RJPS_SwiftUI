//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import Utils
import Utils_Storage

public class RepositoryRyanair: ObservableObject, RepositoryRyanairProtocol {
    public init() { }

    public var something: String {
        get { return RepositoryRyanairLogic.shared.lastCity }
        set { RepositoryRyanairLogic.shared.lastCity = newValue }
    }
}

private final class RepositoryRyanairLogic: ObservableObject {
    private init() {}
    static let shared = RepositoryRyanairLogic()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String { return Bundle.main.bundleIdentifier! }

    @UserDefaultsPropertyWrapper("\(id).something", defaultValue: "")
    var lastCity: String { willSet { objectWillChange.send() } }
}
