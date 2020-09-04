//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct VisualDocs_onEditingChanged: View {
    @State var output: String = ""
    @State var input: String = ""
    @State var typing = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type", text: $input, onEditingChanged: { self.typing = $0 },
                          onCommit: { self.output = self.input }).applyDefaultLayout()
                if !typing {
                    if !output.isEmpty { Text("You typed: \(output)") }
                } else if !input.isEmpty {
                    Text("You are typing: \(input)")
                }
            }
        }
    }
}

// MARK: - Preview VisualDocs_ReactingEvents

struct OnEditingChanged_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_onEditingChanged()
    }
}
