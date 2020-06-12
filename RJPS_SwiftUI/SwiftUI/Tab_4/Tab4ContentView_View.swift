//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension V {
    struct Tab4Details_View: View {
        let user: String
        var body: some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                Text(user)
            }
            .onAppear { print("[\(self)] onAppear!") }
            .onDisappear { print("[\(self)] onDisappear!") }
        }
    }
}

// MARK: - Preview

struct Tab4ContentView_View_Previews: PreviewProvider {
    static var previews: some View {
        V.Tab4Details_View(user: "some user")
    }
}
