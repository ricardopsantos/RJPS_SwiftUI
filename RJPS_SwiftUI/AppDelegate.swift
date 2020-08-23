//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
//
import App_Weather
import App_HourlyChallenge
import App_Ryanair
//
import Utils_Networking
import Utils_Extensions

enum TargetApp {
    case sample
    case weather
    case hourly
    case ryanair
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //SampleAPI_Testing.test()
        //CombineTesting.shared.test_AnyPublisher()
        //CombineTesting.shared.testing_CurrentValueSubject()
        //CombineTesting.shared.observe_UserDefaults()
        //CombineTesting.shared.testing_handleEvents()

        //let testing = RyanairCoreTesting()
        //testing.test1()

        let targetApp: TargetApp = .ryanair
        switch targetApp {
        case .sample:
            self.window?.rootViewController = UIHostingController(rootView: TabView_View())
        case .hourly:
            self.window?.rootViewController = UIHostingController(rootView: DashboardViewBuilder.buildView())
        case .weather:
            self.window?.rootViewController = UIHostingController(rootView: WeeklyWeatherBuilder.buildView())
        case .ryanair:
            self.window?.rootViewController = UIHostingController(rootView: RyanairView1Builder.buildView())
            //self.window?.rootViewController = UIHostingController(rootView: RyanairView1Builder.buildMockView())
        }
        return true
    }
}

// MARK: - Preview

struct AppDelegate_Previews: PreviewProvider {
    static var previews: some View {
        TabView_View()
    }
}
