//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import API_Keys
import Domain

public struct WeeklyWeatherBuilder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        let fetcher: APIProtocol = APIKeys.get(key: "OpenWeather") != nil ?  Fetcher() : FetcherMock()
        let viewModel  = WeeklyWeather_ViewModel(weatherFetcher: fetcher)
        return WeeklyWeather_View(viewModel: viewModel)
    }
}
