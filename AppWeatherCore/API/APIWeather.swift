//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import UtilsStorage
import UtilsNetworking
//
import BaseDomain

public class APIWeather {
    public init() { }
    public struct Constants {
        static let agent = SimpleNetworkAgentB()
        static let dumpResponse = false
        static let decoder = JSONDecoder()
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        static let path = "/data/2.5"
        static var key: String { APIKeys.get(key: "OpenWeather") ?? "" }
    }
    var agent: SimpleNetworkAgentB { return Self.Constants.agent }
    var decoder: JSONDecoder { return Self.Constants.decoder }
    var dumpResponse: Bool { return Self.Constants.dumpResponse }
    var subscriptions: Set<AnyCancellable> = []
}

// MARK: - Requestables

extension APIWeather {

    func forecast(request: WeatherRequestDto.WeeklyWeatherForecast) -> URLComponents {
        // https://api.openweathermap.org/data/2.5/forecast?q=Lisboa&mode=json&units=metric&APPID=XXXXXXXXX
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/forecast"
        components.queryItems = [
            URLQueryItem(name: "q", value: request.city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: Self.Constants.key)
        ]
        return components
    }

    func weather(request: WeatherRequestDto.CurrentWeatherForecast) -> URLComponents {
        // https://api.openweathermap.org/data/2.5/weather?q=Lisboa&mode=json&units=metric&APPID=XXXXXXXXX
        var components    = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/weather"
        components.queryItems = [
            URLQueryItem(name: "q", value: request.city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: Self.Constants.key)
        ]
        return components
    }
}
