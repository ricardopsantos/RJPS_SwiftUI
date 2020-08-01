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
        @State var isAnimating: Bool = true
        var body : some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 20) {
                    V.ActivityIndicator(isAnimating: isAnimating)
                    Text("Tab 1").font(.title).padding(50)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isAnimating = false
                }
            }
        }
    }
}

// MARK: - Preview

struct Tab1_View_Previews: PreviewProvider {
    static var previews: some View {
        V.Tab1_View()
    }
}
