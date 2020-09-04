//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

// https://nshipster.com/propertywrapper/
@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    var wrappedValue: T {
        get { return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}

final class SampleUserSettings: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    @UserDefault("ShowOnStart", defaultValue: true)
    var showOnStart: Bool {
        willSet {
            objectWillChange.send()
        }
    }
}

struct VisualDocs_UserDefaults: View {
    @ObservedObject var settings = SampleUserSettings()
    var body: some View {
        VStack {
            Toggle(isOn: $settings.showOnStart) {
                Text("Show welcome text")
            }
            if settings.showOnStart {
                Text("Welcome")
            }
        }.padding()
    }
}

// MARK: - Preview

struct UserDefaults_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_UserDefaults()
    }
}
