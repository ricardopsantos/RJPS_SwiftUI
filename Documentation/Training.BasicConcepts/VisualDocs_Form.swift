//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Form: View {
        @State private var name: String = "Joe"
        @State private var age: Int = 30
        var body : some View {
            Form {
                Section(header: Text("Personal information")) {
                    TextField("type something...", text: $name).padding().border(Color.green, width: 1)
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
}

// MARK: - Preview

struct VisualDocs_Form: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Form()
    }
}
