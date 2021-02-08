//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import AppWeatherCore
import AppWeatherDomain
import AppWeatherWebAPI
import BaseDomain
import Utils

//
// The Builder is responsible to build a View and setup the Fetcher and ViewModel
// The method [static func buildView()] is mandatory, but we can have more
//

public struct WeeklyWeatherBuilder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        // Resolving ViewModel dependencies
        Resolver.AppWeather()
        let viewModel = VM.WeeklyWeatherViewModel()
        return WeeklyWeatherView(viewModel: viewModel)
    }
}
