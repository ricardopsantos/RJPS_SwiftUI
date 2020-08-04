//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

extension E {
    public struct CurrentWeatherForecastResponse: Decodable {
        let coord: Coord
        let main: Main

        public struct Main: Codable {
            let temperature: Double
            let humidity: Int
            let maxTemperature: Double
            let minTemperature: Double

            enum CodingKeys: String, CodingKey {
                case temperature = "temp"
                case humidity
                case maxTemperature = "temp_max"
                case minTemperature = "temp_min"
            }
        }

        public struct Coord: Codable {
            let lon: Double
            let lat: Double
        }
    }
}
