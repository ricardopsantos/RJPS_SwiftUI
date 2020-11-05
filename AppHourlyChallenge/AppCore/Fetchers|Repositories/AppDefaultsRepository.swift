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
import UtilsStorage
import DevTools

final class RepositoryHourlyChallange: ObservableObject {
    private init() { }
    public static let shared = RepositoryHourlyChallange()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String {
        return Bundle.main.bundleIdentifier!
    }
    
    @UserDefaultsPropertyWrapper("\(id).timeZone", defaultValue: 0)
    var timeZone: Int { willSet { objectWillChange.send() } }
}
