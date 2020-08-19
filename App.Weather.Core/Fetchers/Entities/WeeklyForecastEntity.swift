//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension WeatherDto {

    struct WeeklyForecastEntity: Codable {
        public let list: [Item]

        public struct Item: Codable {
            public let date: Date
            public let main: MainClass
            public let weather: [Weather]

            enum CodingKeys: String, CodingKey {
                case date = "dt"
                case main
                case weather
            }
        }

        public struct MainClass: Codable {
            public let temp: Double
        }

        public struct Weather: Codable {
            public let main: MainEnum
            public let weatherDescription: String

            enum CodingKeys: String, CodingKey {
                case main
                case weatherDescription = "description"
            }
        }

        public enum MainEnum: String, Codable {
            case clear = "Clear"
            case clouds = "Clouds"
            case rain = "Rain"
        }
    }

}
