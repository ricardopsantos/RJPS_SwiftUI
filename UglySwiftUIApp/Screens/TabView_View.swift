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
    var tab2 : some View { Tab2_View().tabItem({ Text("Tab_2") }).tag(2) }
    var tab3 : some View { Tab3_View().tabItem({ Text("Tab_3") }).tag(3) }
    var tab4 : some View { Tab4_View().tabItem({ Text("Tab_4") }).tag(4) }
    var titleView : some View { Text("SwiftUI TabBar App").bold() }
    var body : some View {
        VStack(alignment: .center, spacing: 20) {
            //ActivityIndicator()
            titleView
            Divider()
            TabView {
                tab1
                tab2
                tab3
                tab4
            }
        }
        .background(UIColor.Stack.debugColor)
        .onAppear { print("[\(self)] onAppear!") }
        .onDisappear { print("[\(self)] onDisappear!") }
    }
}

// MARK: - Preview

struct TabView_View_Previews_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TabView_View()
    }
}
