//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import MessageUI
//
import Utils_Designables
import DevTools

public class RepositoryWeather: ObservableObject, RepositoryWeatherProtocol {
    public init() { }

    public var lastCity: String {
        get { return RepositoryWeatherDefaults.shared.lastCity }
        set { RepositoryWeatherDefaults.shared.lastCity = newValue }
    }
}

private final class RepositoryWeatherDefaults: ObservableObject {
    private init() {}
    static let shared = RepositoryWeatherDefaults()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String { return Bundle.main.bundleIdentifier! }

    @AppUserDefaults("\(id).lastCity", defaultValue: "")
    var lastCity: String { willSet { objectWillChange.send() } }
}
