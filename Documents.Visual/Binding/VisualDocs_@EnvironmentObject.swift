//
//  Created by Ricardo Santos on 31/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// @EnvironmentObject is a data model which, once initialised, can share data to all view’s of your app
//

class UserY: ObservableObject {
    @Published var score = 0
}

extension V {
    struct ChangeView_VisualDocs_EnvironmentObject_I: View {
        @EnvironmentObject var user: UserY
        var body: some View {
            VStack {
                Text("Score: \(user.score)")
                Button("Increase") {
                    self.user.score += 1
                }
            }
        }
    }
}

extension V {
    struct VisualDocs_EnvironmentObject_I: View {
        @ObservedObject var user = UserY()

        var body: some View {
            NavigationView {
                VStack(spacing: 30) {
                    Text("Score: \(user.score)")
                    NavigationLink(destination: V.ChangeView_VisualDocs_EnvironmentObject_I()) {
                        Text("Show Detail View")
                    }
                }
            }
            .environmentObject(user)
        }
    }
}

struct VisualDocs_EnvironmentObject_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_EnvironmentObject_I()
    }
}
