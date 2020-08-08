//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
//
import API_Keys
import App_Weather
import App_HourlyChallenge

enum TargetApp {
    case sample
    case weather
    case hourly
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let targetApp: TargetApp = .hourly
        switch targetApp {
        case .sample:
            self.window?.rootViewController = UIHostingController(rootView: V.TabView_View())
//            self.window?.rootViewController = UIHostingController(rootView: V.VisualDocs_PasswordChecker())
        case .hourly:
            self.window?.rootViewController = UIHostingController(rootView: DashboardViewBuilder.buildView())
        case .weather:
            self.window?.rootViewController = UIHostingController(rootView: WeeklyWeatherBuilder.buildView())
        }
        return true
    }
}

// MARK: - Preview

struct AppDelegate_Previews: PreviewProvider {
    static var previews: some View {
        V.TabView_View()
    }
}
