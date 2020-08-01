//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension V {
    struct Tab4_View: View {
        let users = (1...10).map { some in "User \(some)" }
        var body : some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                NavigationView {
                    VStack(alignment: .center, spacing: 40) {
                        List(users, id: \.self) { user in
                            NavigationLink(destination: Text("Detail for \(user)")) {
                                V.Tab4Details_View(user: user)
                            }
                            }.navigationBarTitle("Select a user")
                    }
                }
            }
        }
    }
}

// MARK: - Preview

struct Tab4_View_Previews: PreviewProvider {
    static var previews: some View {
        V.Tab4_View()
    }
}
