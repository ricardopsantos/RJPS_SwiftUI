//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension E {
    struct WeeklyForecastEntity: Codable {
        let list: [Item]
        
        public struct Item: Codable {
            let date: Date
            let main: MainClass
            let weather: [Weather]
            
            enum CodingKeys: String, CodingKey {
                case date = "dt"
                case main
                case weather
            }
        }
        
        public struct MainClass: Codable {
            let temp: Double
        }
        
        public struct Weather: Codable {
            let main: MainEnum
            let weatherDescription: String
            
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
