//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

public protocol WeatherAPIProtocol {
    func weeklyWeatherForecast(forCity city: String) -> AnyPublisher<E.WeeklyForecastEntity, E.WeatherErrorEntity>
    func currentWeatherForecast(forCity city: String) -> AnyPublisher<E.CurrentWeatherForecastEntity, E.WeatherErrorEntity>
}
