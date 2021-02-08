//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import BaseDomain

// Encapsulate all WeatherRequestDto

public extension RequestDto {
    struct CurrentWeatherForecast {
        public let city: String

        public init(city: String) {
            self.city = city
        }
    }
}
