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
        let fetcher: APIProtocol = APIKeys.get(key: "OpenWeather") != nil ?  Fetcher() : FetcherMock()
        let repository: RepositoryProtocol = Repository()
        let viewModel  = WeeklyWeatherViewModel(fetcher: fetcher, repository: repository)
        return WeeklyWeatherView(viewModel: viewModel)
    }
}
