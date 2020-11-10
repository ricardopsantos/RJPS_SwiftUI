//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let printer: (String) -> Void = { print($0) }
        printer("teste")

        // Apple provides a very basic UIViewController subclass for hosting SwiftUI, UIHostingController
        self.window?.rootViewController = UIHostingController(rootView: AppRoot_View())
        return true
    }
}

// MARK: - Preview

struct AppDelegate_Previews: PreviewProvider {
    static var previews: some View {
        AppRoot_View()
    }
}
