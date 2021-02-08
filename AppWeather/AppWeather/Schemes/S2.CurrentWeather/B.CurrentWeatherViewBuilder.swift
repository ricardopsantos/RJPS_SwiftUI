//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import BaseDomain

//
// The Builder is responsible to build a View and setup the Fetcher and ViewModel
// The method [static func buildView()] is mandatory, but we can have more
//

public struct CurrentWeatherViewBuilder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        //let fetcher: APIProtocol = APIKeys.get(key: "OPEN_WEATHER_KEY") != nil ?  Fetcher() : FetcherMock()
        //let repository: RepositoryProtocol = Repository()
        //let viewModel  = CurrentWeatherView(weatherFetcher: fetcher, weatherRepository: repository)
        return EmptyView()
    }
}
