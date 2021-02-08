//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import RJSLibUFStorage
import RJSLibUFBase
//
import Utils
import AppWeatherDomain

public class RepositoryWeather: ObservableObject, RepositoryWeatherProtocol {
    public init() { }

    public var lastCity: String {
        get { return RepositoryWeatherLogic.shared.lastCity }
        set { RepositoryWeatherLogic.shared.lastCity = newValue }
    }
}

private final class RepositoryWeatherLogic: ObservableObject {
    private init() {}
    static let shared = RepositoryWeatherLogic()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String { return Bundle.main.bundleIdentifier! }

    @RJS_Defaults("\(id).lastCity", defaultValue: "")
    var lastCity: String { willSet { objectWillChange.send() } }
}
