//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import BaseDomain

public protocol APIWeatherProtocol {
    func weeklyWeatherForecast(forCity city: String) -> AnyPublisher<WeatherResponseDto.WeeklyForecastEntity, APIError>
    func currentWeatherForecast(forCity city: String) -> AnyPublisher<WeatherResponseDto.CurrentWeatherForecastEntity, APIError>
}
