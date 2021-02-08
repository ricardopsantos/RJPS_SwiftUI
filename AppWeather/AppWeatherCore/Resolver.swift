//
//  Resolver.swift
//  BaseDomain
//
//  Created by Ricardo Santos on 08/02/2021.
//

import Foundation
//
import RJSLibUFBase
//
import AppWeatherDomain
import AppWeatherWebAPI
import Utils
import BaseDomain

public extension Resolver {
    
    static func AppWeather() {
        
        RJS_Resolver.shared.register(type: APIWeatherProtocol.self, {
            if APIKeys.get(key: "OPEN_WEATHER_KEY") != nil {
                return FetcherWeather(webAPI: APIWeather())
            } else {
                return FetcherWeatherMock()
            }
        })

        
        RJS_Resolver.shared.register(type: RepositoryWeatherProtocol.self, { RepositoryWeather() })
        
    }
}
