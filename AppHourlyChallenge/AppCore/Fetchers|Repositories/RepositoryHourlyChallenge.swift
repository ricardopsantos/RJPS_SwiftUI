//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import RJSLibUFBase

final class RepositoryHourlyChallenge: ObservableObject {
    private init() { }
    public static let shared = RepositoryHourlyChallenge()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String {
        return Bundle.main.bundleIdentifier!
    }
    
    @RJS_Defaults("\(id).timeZone", defaultValue: 0)
    var timeZone: Int { willSet { objectWillChange.send() } }
}
