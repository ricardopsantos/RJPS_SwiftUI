//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import BaseDomain
import UtilsStorage
import BaseDomain
import AppWeatherCore

//
// The Builder is responsible to build a View and setup the Fetcher and ViewModel
// The method [static func buildView()] is mandatory, but we can have more
//

public struct WeeklyWeatherBuilder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        let fetcher: APIWeatherProtocol = APIKeys.get(key: "OpenWeather") != nil ?  FetcherWeather() : FetcherWeatherMock()
        let repository: RepositoryWeatherProtocol = RepositoryWeather()
        let viewModel  = VM.WeeklyWeatherViewModel(fetcher: fetcher, repository: repository)
        return WeeklyWeatherView(viewModel: viewModel)
    }
}

