//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
//
import App_Ryanair

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window?.rootViewController = UIHostingController(rootView: RyanairView1Builder.buildView())
        //self.window?.rootViewController = UIHostingController(rootView: RyanairView1Builder.buildMockView())

        return true
    }
}

// MARK: - Preview

struct AppDelegate_Previews: PreviewProvider {
    static var previews: some View {
        RyanairView1Builder.buildView()
    }
}
