//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public struct CurrentWeatherForecastEntity: Decodable {
    public let coord: Coord
    public let main: Main

    public struct Main: Codable {
        public let temperature: Double
        public let humidity: Int
        public let maxTemperature: Double
        public let minTemperature: Double

        enum CodingKeys: String, CodingKey {
            case temperature = "temp"
            case humidity
            case maxTemperature = "temp_max"
            case minTemperature = "temp_min"
        }
    }

    public struct Coord: Codable {
        public let lon: Double
        public let lat: Double
    }
}

