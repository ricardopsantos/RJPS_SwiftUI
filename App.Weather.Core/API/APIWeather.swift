//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import Utils_Storage

public struct APIWeather {
    
    public struct Constants {
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        static let path = "/data/2.5"
        static var key: String { APIKeys.get(key: "OpenWeather") ?? "" }
    }

    public static func makeWeeklyForecastComponents(withCity city: String) -> URLComponents {
        // https://api.openweathermap.org/data/2.5/forecast?q=Lisboa&mode=json&units=metric&APPID=XXXXXXXXX
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/forecast"
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: Self.Constants.key)
        ]
        return components
    }
    
    public static func makeCurrentDayForecastComponents(withCity city: String) -> URLComponents {
        // https://api.openweathermap.org/data/2.5/weather?q=Lisboa&mode=json&units=metric&APPID=XXXXXXXXX
        var components    = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/weather"
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: Self.Constants.key)
        ]
        return components
    }

}