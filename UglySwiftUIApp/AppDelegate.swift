//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
//
import API_Keys
import App_WeatherApp

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if false {
            self.window?.rootViewController = UIHostingController(rootView: V.TabView_View())
        } else {
            let fetcher: WeatherAPIProtocol = APIKeys.get(key: "OpenWeather") != nil ?  WeatherFetcherAPI() : WeatherFetcherMock()
            let viewModel  = WeeklyWeather_ViewModel(weatherFetcher: fetcher)
            let weeklyView = WeeklyWeather_View(viewModel: viewModel)
            self.window?.rootViewController = UIHostingController(rootView: weeklyView)
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
