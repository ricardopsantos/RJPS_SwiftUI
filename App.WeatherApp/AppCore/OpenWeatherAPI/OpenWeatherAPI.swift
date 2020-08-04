//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

public struct OpenWeatherAPI {
    
    public struct Constants {
        static let scheme = "https"
        static let host   = "api.openweathermap.org"
        static let path   = "/data/2.5"
        static let key    = "af9bd3a20f27a2ecd36670f6504f653b"
    }

    public static func makeWeeklyForecastComponents(withCity city: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherAPI.Constants.scheme
        components.host   = OpenWeatherAPI.Constants.host
        components.path   = OpenWeatherAPI.Constants.path + "/forecast"
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: OpenWeatherAPI.Constants.key)
        ]
        return components
    }
    
    public static func makeCurrentDayForecastComponents(withCity city: String) -> URLComponents {
        var components    = URLComponents()
        components.scheme = OpenWeatherAPI.Constants.scheme
        components.host   = OpenWeatherAPI.Constants.host
        components.path   = OpenWeatherAPI.Constants.path + "/weather"
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: OpenWeatherAPI.Constants.key)
        ]
        return components
    }

}
