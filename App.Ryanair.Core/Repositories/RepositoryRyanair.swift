//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import Utils

public class RepositoryRyanair: ObservableObject, RepositoryRyanairProtocol {
    public init() { }

    public var something: String {
        get { return RepositoryRyanairUserDefaults.shared.lastCity }
        set { RepositoryRyanairUserDefaults.shared.lastCity = newValue }
    }
}

private final class RepositoryRyanairUserDefaults: ObservableObject {
    private init() {}
    static let shared = RepositoryRyanairUserDefaults()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String { return Bundle.main.bundleIdentifier! }

    @AppUserDefaults("\(id).something", defaultValue: "")
    var lastCity: String { willSet { objectWillChange.send() } }
}
