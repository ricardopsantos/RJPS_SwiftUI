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
        let webAPI = APIWeather()
        let fetcher: APIWeatherProtocol = APIKeys.get(key: "OpenWeather") != nil ?  FetcherWeather(webAPI: webAPI) : FetcherWeatherMock()
        let repository: RepositoryWeatherProtocol = RepositoryWeather()
        let viewModel  = VM.WeeklyWeatherViewModel(fetcher: fetcher, repository: repository)
        return WeeklyWeatherView(viewModel: viewModel)
    }
}
