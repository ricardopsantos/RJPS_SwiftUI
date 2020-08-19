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
import Base_Designables
import Utils_UIKitRepresentables
import DevTools

final class AppDefaultsRepository: ObservableObject {
    private init() { }
    public static let shared = AppDefaultsRepository()
    let objectWillChange = PassthroughSubject<Void, Never>()
    static var id: String {
        return Bundle.main.bundleIdentifier!
    }
    
    @AppUserDefaults("\(id).timeZone", defaultValue: 0)
    var timeZone: Int { willSet { objectWillChange.send() } }
}

final class Repository: ObservableObject {

}
