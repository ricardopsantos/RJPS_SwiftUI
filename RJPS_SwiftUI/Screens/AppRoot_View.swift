//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine
//
import App_Weather
import App_HourlyChallenge
import App_Ryanair
import Utils_Extensions
import Utils_Designables
//

struct AppRoot_View: View {

    var tab1 : some View { WeeklyWeatherBuilder.buildView().tabItem({
        VStack { ImageNames.cloud.image; Text("Weather") }
    })}

    var tab2 : some View { RyanairView1Builder.buildView().tabItem({
        VStack { ImageNames.paperplane.image; Text("Ryanair") }
    })}

    var tab3 : some View { DashboardViewBuilder.buildView().tabItem({
        VStack { ImageNames.clock.image; Text("Hourly") }
    })}

    var devView : some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: VisualDocs_Colors()) { Text("Color WIKI") }
                    NavigationLink(destination: VisualDocs_Fonts()) { Text("Fonts WIKI") }
                    NavigationLink(destination: VisualDocs_ImageName()) { Text("Images WIKI") }
                    NavigationLink(destination: VisualDocs_Shapes()) { Text("Shapes WIKI") }
                }
                Section {
                    NavigationLink(destination: VisualDocs_DebugUI()) { Text("DebugUI") }
                    NavigationLink(destination: VisualDocs_Buttons()) { Text("Buttons") }
                    NavigationLink(destination: Designables_View()) { Text("Designables") }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Dev utils")
        }
        .tabItem({ VStack { ImageNames.heart.image; Text("Dev") } })}

    var body : some View {
        TabView {
            tab1
            tab2
            tab3
            devView
        }
    }
}

// MARK: - Preview

struct AppRoot_View_Previews_PreviewProvider: PreviewProvider {
    static var previews: some View {
        AppRoot_View()
    }
}
