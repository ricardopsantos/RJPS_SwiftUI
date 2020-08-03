//
//  Created by Ricardo Santos on 01/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

@propertyWrapper
fileprivate struct UserDefault<T> {
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

fileprivate final class SampleUserSettings: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    @UserDefault("ShowOnStart", defaultValue: true)
    var showOnStart: Bool {
        willSet {
            objectWillChange.send()
        }
    }
}

fileprivate extension V {
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
}

// MARK: - Preview

struct VisualDocs_UserDefaults: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_UserDefaults()
    }
}
