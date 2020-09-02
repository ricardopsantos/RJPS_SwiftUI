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
//
import Utils_Extensions
struct TabView_View: View {

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
        }
    }
}

// MARK: - Preview

struct TabView_View_Previews_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TabView_View()
    }
}
