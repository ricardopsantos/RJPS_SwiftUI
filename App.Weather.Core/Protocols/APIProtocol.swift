//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Base_Domain

public protocol APIProtocol {
    func weeklyWeatherForecast(forCity city: String) -> AnyPublisher<WeeklyForecastEntity, APIError>
    func currentWeatherForecast(forCity city: String) -> AnyPublisher<CurrentWeatherForecastEntity, APIError>
}
