//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
//
import Base_Domain

public struct CurrentWeatherViewBuilder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        //let fetcher: APIProtocol = APIKeys.get(key: "OpenWeather") != nil ?  Fetcher() : FetcherMock()
        //let repository: RepositoryProtocol = Repository()
        //let viewModel  = CurrentWeatherView(weatherFetcher: fetcher, weatherRepository: repository)
        return Text(verbatim: "")
    }
}
