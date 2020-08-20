//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import Base_Domain

public struct S1Builder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        //let fetcher: APIWeatherProtocol = APIKeys.get(key: "OpenWeather") != nil ?  FetcherWeather() : FetcherWeatherMock()
        //let repository: RepositoryWeatherProtocol = RepositoryWeather()
        //let viewModel  = WeeklyWeatherViewModel(fetcher: fetcher, repository: repository)
        //return WeeklyWeatherView(viewModel: viewModel)
        return Text("")
    }
}
