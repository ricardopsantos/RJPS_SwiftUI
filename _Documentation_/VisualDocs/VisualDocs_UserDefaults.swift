//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

/*

 // https://nshipster.com/propertywrapper/
 // https://medium.com/swlh/easy-dependency-injection-with-property-wrappers-in-swift-886a93c28ed4

 If you’re not familiar with Property Wrappers in Swift 5.1, it’s not a big deal:
 * We created a struct;
 * Added @propertyWrapper before its declaration;
 * Every Property Wrapper has to have wrappedValue. In our case, it has a generic type T;
 * init gets one parameter: keyPath to the variable in UserDefault;
 */
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

struct VisualDocs_UserDefaults_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_UserDefaults()
    }
}
