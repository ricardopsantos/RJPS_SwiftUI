//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct VisualDocs_TabView_Tab1: View {
    var body : some View { VStack { Text("Tab 1") } }
}

struct VisualDocs_TabView_Tab2: View {
    var body : some View { VStack { Text("Tab 2") } }
}

struct VisualDocs_TabView_Tab3: View {
    var body : some View { VStack { Text("Tab 3") } }
}

struct VisualDocs_TabView_Tab4: View {
    var body : some View { VStack { Text("Tab 4") } }
}

struct VisualDocs_TabView: View {
    var tab1 : some View { VisualDocs_TabView_Tab1().tabItem({ Text("Tab_1") }).tag(1) }
    var tab2 : some View { VisualDocs_TabView_Tab2().tabItem({ Text("Tab_2") }).tag(2) }
    var tab3 : some View { VisualDocs_TabView_Tab3().tabItem({ Text("Tab_3") }).tag(3) }
    var tab4 : some View { VisualDocs_TabView_Tab4().tabItem({ Text("Tab_4") }).tag(4) }
    var body : some View {
        VStack {
            Text("SwiftUI TabBar App")
            TabView {
                tab1
                tab2
                tab3
                tab4
            }
        }
    }
}

// MARK: - Preview

struct TabView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_TabView()
    }
}
