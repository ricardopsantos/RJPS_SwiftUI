//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Dismiss_Pop: View {
        var body: some View {
            NavigationView {
                NavigationLink(destination: V.WithDismissButton()) {
                    VStack {
                        Text("Tap to details").font(.headline)
                    }
                }
            }
        }
    }
}

extension V {
    struct WithDismissButton: View {
        @Environment(\.presentationMode) var presentation
        var body: some View {
            Button("Tap to Pop") { self.presentation.wrappedValue.dismiss() }
        }
    }
}

struct VisualDocs_Dismiss: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Dismiss_Pop()
    }
}
