//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import UtilsNetworking
import Utils
//
import BaseDomain
import AppWeatherDomain

public class APIWeather {
    public init() { }
    public struct Constants {
        public static let agent = SimpleNetworkAgentB()
        public static let dumpResponse = false
        public static let decoder = JSONDecoder()
        public static let scheme = "https"
        public static let host = "api.openweathermap.org"
        public static let path = "/data/2.5"
        public static var key: String { APIKeys.get(key: "OpenWeather") ?? "" }
    }
    public var agent: SimpleNetworkAgentB { return Self.Constants.agent }
    public var decoder: JSONDecoder { return Self.Constants.decoder }
    public var dumpResponse: Bool { return Self.Constants.dumpResponse }
    public var subscriptions: Set<AnyCancellable> = []
}

// MARK: - Requestables

public extension APIWeather {

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
