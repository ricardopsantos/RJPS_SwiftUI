//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Utils_Designables
import Utils

public class RepositoryWeather: ObservableObject, RepositoryWeatherProtocol {
    public init() { }

    public var lastCity: String {
        get { return RepositoryAppUserDefaults.shared.lastCity }
        set { RepositoryAppUserDefaults.shared.lastCity = newValue }
    }
}

private final class RepositoryAppUserDefaults: ObservableObject {
    private init() {}
    static let shared = RepositoryAppUserDefaults()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String { return Bundle.main.bundleIdentifier! }

    @AppUserDefaults("\(id).lastCity", defaultValue: "")
    var lastCity: String { willSet { objectWillChange.send() } }
}
