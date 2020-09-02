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
import DevTools

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //let testing = RyanairCoreTesting()
        //testing.test1()

        self.window?.rootViewController = UIHostingController(rootView: TabView_View())

        return true
    }
}

// MARK: - Preview

struct AppDelegate_Previews: PreviewProvider {
    static var previews: some View {
        TabView_View()
    }
}
