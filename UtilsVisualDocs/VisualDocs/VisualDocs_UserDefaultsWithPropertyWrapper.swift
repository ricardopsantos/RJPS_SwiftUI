//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import UtilsStorage

class TheViewModel: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    @UserDefaultsPropertyWrapper("ShowOnStart", defaultValue: true)
    var showOnStart: Bool { willSet { objectWillChange.send() } }
}

struct VisualDocs_UserDefaultsWithPropertyWrapper: View {
    @ObservedObject var vm = TheViewModel()
    var body: some View {
        VStack {
            Toggle(isOn: $vm.showOnStart) {
                Text("Show welcome text")
            }
            if vm.showOnStart {
                Text("Welcome")
            }
        }.padding()
    }
}

// MARK: - Preview

struct VisualDocs_UserDefaultsWithPropertyWrapper_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_UserDefaultsWithPropertyWrapper()
    }
}
