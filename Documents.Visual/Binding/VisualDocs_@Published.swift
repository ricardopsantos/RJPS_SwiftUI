//
//  Created by Ricardo Santos on 31/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// @Published is one of the most useful property wrappers in SwiftUI,
// allowing us to create observable objects that automatically announce when changes occur.
//

class UserX: ObservableObject {
    @Published var score = 0
}

extension V {
    struct ChangeView_VisualDocs_Published_I: View {
        @EnvironmentObject var user: UserX
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
    struct VisualDocs_Published_I: View {
        @ObservedObject var user = UserX()

        var body: some View {
            NavigationView {
                VStack(spacing: 30) {
                    Text("Score: \(user.score)")
                    NavigationLink(destination: V.ChangeView_VisualDocs_Published_I()) {
                        Text("Show Detail View")
                    }
                }
            }
            .environmentObject(user)
        }
    }
}

struct VisualDocs_Published_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Published_I()
    }
}
