//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension AppView {
    struct Tab4_View: View {
        let users = (1...10).map { some in "User \(some)" }
        var body : some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                NavigationView {
                    VStack (alignment: .center, spacing: 20) {
                        List(users, id: \.self) { user in
                            NavigationLink(destination: Text("Detail for \(user)")) {
                                Tab4Details_View(user: user)
                            }
                            }.navigationBarTitle("Select a user")
                    }
                }
            }
            .onAppear { print("[\(self)] onAppear!") }
            .onDisappear { print("[\(self)] onDisappear!") }
        }
    }
}
