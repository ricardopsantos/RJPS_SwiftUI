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
import Designables
import UIKitRepresentables
import DevTools

private final class AppDefaultsRepository: ObservableObject {
    private init() {}
    static let shared = AppDefaultsRepository()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String {
        return Bundle.main.bundleIdentifier!
    }

    @AppUserDefaults("\(id).lastCity", defaultValue: "")
    var lastCity: String { willSet { objectWillChange.send() } }
}

class Repository: ObservableObject, RepositoryProtocol {
    public init() { }

    var lastCity: String {
        get { return AppDefaultsRepository.shared.lastCity }
        set { AppDefaultsRepository.shared.lastCity = newValue }
    }
}
