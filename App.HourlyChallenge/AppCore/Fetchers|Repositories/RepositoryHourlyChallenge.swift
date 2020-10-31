//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Utils
import Utils_Storage
import DevTools

final class RepositoryHourlyChallenge: ObservableObject, RepositoryHourlyChallengeProtocol {
    private init() { }
    public static let shared = RepositoryHourlyChallenge()

    public var timeZone: Int {
        get { return RepositoryHourlyChallengeLogic.shared.timeZone }
        set { RepositoryHourlyChallengeLogic.shared.timeZone = newValue }
    }
}

private final class RepositoryHourlyChallengeLogic: ObservableObject {
    private init() {}
    static let shared = RepositoryHourlyChallengeLogic()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String { return Bundle.main.bundleIdentifier! }

    @UserDefaultsPropertyWrapper("\(id).timeZone", defaultValue: 0)
    var timeZone: Int { willSet { objectWillChange.send() } }
}
