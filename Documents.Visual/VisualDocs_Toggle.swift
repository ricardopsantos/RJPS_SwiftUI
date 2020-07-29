//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Toggle: View {
        @State private var isShowing: Bool = true // toggle state
        var toggleView: some View {
            return Toggle(isOn: $isShowing) {
                if isShowing {
                    Text("Toggle On")
                } else {
                    Text("Toggle Off")
                }
            }
        }
        var body : some View {
            ScrollView {
                VStack {
                    toggleView
                }.padding()
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Toggle: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Toggle()
    }
}
