//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import BaseDomain

public protocol APIWeatherProtocol {
    func weeklyWeatherForecast(request: WeatherRequestDto.WeeklyWeatherForecast, cache: CachePolicy) -> AnyPublisher<WeatherResponseDto.WeeklyForecastEntity, APIError>
    func currentWeatherForecast(request: WeatherRequestDto.CurrentWeatherForecast, cache: CachePolicy) -> AnyPublisher<WeatherResponseDto.CurrentWeatherForecastEntity, APIError>
}
