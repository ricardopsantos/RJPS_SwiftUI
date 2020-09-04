//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct VisualDocs_Form: View {
    @State private var name: String = "Joe"
    @State private var age: Int = 30
    var body : some View {
        Form {
            Section(header: Text("Personal information")) {
                TextField("type something...", text: $name).applyDefaultLayout()
                Stepper(value: $age) {
                    Text("Age: \(age)")
                }.padding().border(Color.green, width: 1)
            }

            Section {
                Button("Save") {
                    //self.presentation.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle(Text("person.name"))
    }
}

// MARK: - Preview

struct Form_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_Form()
    }
}
