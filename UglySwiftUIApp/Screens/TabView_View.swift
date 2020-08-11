//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

struct TabView_View: View {

    var tab1 : some View { Tab1_View().tabItem({ Text("Tab_1") }).tag(1) }
    var body : some View {
        VStack(alignment: .center, spacing: 20) {
            Text("TabBar App").bold()
            Divider()
            TabView {
                tab1
                tab1
                tab1
            }
        }
    }
}

// MARK: - Preview

struct TabView_View_Previews_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TabView_View()
    }
}
