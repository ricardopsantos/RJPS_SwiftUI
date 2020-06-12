//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

// MARK: Tab1_View

extension V {
    struct Tab1_View: View {
        var body : some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 20) {
                    V.ActivityIndicator(isAnimating: true)
                    Text("Tab 1").font(.title).padding(50)
                }
            }
            .onAppear { print("[\(self)] onAppear!") }
            .onDisappear { print("[\(self)] onDisappear!") }
        }
    }
}

// MARK: - Preview

struct Tab1_View_Previews: PreviewProvider {
    static var previews: some View {
        V.Tab1_View()
    }
}
