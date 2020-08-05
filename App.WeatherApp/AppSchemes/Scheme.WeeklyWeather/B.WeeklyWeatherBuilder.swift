//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI

struct WeeklyWeather_Builder {
    static func makeCurrentWeatherView(withCity city: String, weatherFetcher: WeatherAPIProtocol) -> some View {
        let viewModel = VM.CurrentWeather_ViewModel(city: city, weatherFetcher: weatherFetcher)
        return V.CurrentWeather_View(viewModel: viewModel)
    }
}
