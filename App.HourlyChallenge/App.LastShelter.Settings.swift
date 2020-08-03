//
//  Created by Ricardo Santos on 03/08/2020.
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

@propertyWrapper
struct LastShelterUserDefault<T> {
    let key: String
    let defaultValue: T
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    var wrappedValue: T {
        get {
            let result = UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
            //print("result: \(result)")
            return result
        }
        set {
            //print("new: \(newValue)")
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

final class LastShelterUserSettings: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    @LastShelterUserDefault("appDefaults.TimeZone", defaultValue: 0)
    var timeZone: Int {
        willSet {
            objectWillChange.send()
        }
    }
}
