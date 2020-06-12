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

extension V {
    
    struct TabView_View: View {
      
        var tab1 : some View { V.Tab1_View().tabItem({ Text("Tab_1") }).tag(1) }
        var tab2 : some View { V.Tab2_View().tabItem({ Text("Tab_2") }).tag(2) }
        var tab3 : some View { V.Tab3_View().tabItem({ Text("Tab_3") }).tag(3) }
        var tab4 : some View { V.Tab4_View().tabItem({ Text("Tab_4") }).tag(4) }
        var tab5 : some View { V.Tab5_View(viewRouter: Tab5_ViewRouter()).tabItem({ Text("Tab_5") }).tag(5) }

        var titleView : some View {
             Text("SwiftUI TabBar App")
             .bold()
             .font(.system(.largeTitle))
             .fontWeight(.medium)
             .italic()
             .shadow(color: .black, radius: 1, x: 0, y: 2)
             .padding(.top, 20).padding(.leading, 20).padding(.trailing, 20).padding(.bottom, 20)
             .background(Color.red)
             .foregroundColor(Color.green)
        }
        
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
                    tab5
                }
            }
            .background(UIColor.Stack.debugColor)
            .onAppear { print("[\(self)] onAppear!") }
            .onDisappear { print("[\(self)] onDisappear!") }
        }
    }
}

struct TabView_View_Previews: PreviewProvider {
    static var previews: some View {
        V.TabView_View()
    }
}
