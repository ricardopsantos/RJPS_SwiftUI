//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine
//
import Base_Domain
import App_Weather
import App_HourlyChallenge
import App_Ryanair
import Utils_Extensions
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

    var body : some View {
        TabView {
            tab1
            tab2
            tab3
            DevScreen_View()
        }
    }
}

// MARK: - Preview

struct AppRoot_View_Previews_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            AppRoot_View().previewDisplayName("Default")
            AppRoot_View().environment(\.colorScheme, .dark).previewDisplayName("Dark")
            AppRoot_View().previewDevice("iPhone 8").previewDisplayName("Default - iPhone8")
            AppRoot_View().previewDevice("iPhone 11 Pro").previewDisplayName("Default - iPhone11")
        }
    }
}
