//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import BaseDomain

public protocol APIWeatherProtocol {
    func weeklyWeatherForecast(request: RequestDto.WeeklyWeatherForecast, cache: CachePolicy) -> AnyPublisher<ResponseDto.WeeklyForecastEntity, APIError>
    func currentWeatherForecast(request: RequestDto.CurrentWeatherForecast, cache: CachePolicy) -> AnyPublisher<ResponseDto.CurrentWeatherForecastEntity, APIError>
}
