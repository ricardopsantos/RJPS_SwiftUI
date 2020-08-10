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
import ControllerRepresentables
import DevTools

final class AppDefaultsRepository: ObservableObject {
    private init() {}
    static let shared = AppDefaultsRepository()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String? { return Bundle().object(forInfoDictionaryKey: "CFBundleName") as? String }

    @AppUserDefaults("\(id!).lastCity", defaultValue: "")
    var lastCity: String { willSet { objectWillChange.send() } }
}
