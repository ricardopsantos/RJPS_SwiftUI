//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
//
import Utils_Storage
//
import Base_Domain
import App_Weather_Core

public struct WeeklyWeatherBuilder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        let fetcher: APIWeatherProtocol = APIKeys.get(key: "OpenWeather") != nil ?  FetcherWeather() : FetcherWeatherMock()
        let repository: RepositoryWeatherProtocol = RepositoryWeather()
        let viewModel  = WeeklyWeatherViewModel(fetcher: fetcher, repository: repository)
        return WeeklyWeatherView(viewModel: viewModel)
    }
}
