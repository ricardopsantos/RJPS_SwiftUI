//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

public protocol WeatherAPI_Protocol {
    func weeklyWeatherForecast( forCity city: String) -> AnyPublisher<E.WeeklyForecastResponse, E.WeatherError>
    func currentWeatherForecast(forCity city: String) -> AnyPublisher<E.CurrentWeatherForecastResponse, E.WeatherError>
}
