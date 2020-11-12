//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import BaseDomain
import AppWeatherWebAPI
import AppWeatherDomain
//
import UtilsNetworking
import UtilsStorage
import Utils

// The Fetcher will aggregate all deferent WEB APIs
// The Fetcher will aggregate all deferent WEB APIs
// The Fetcher will aggregate all deferent WEB APIs

public class FetcherWeather {
    private let webAPI: APIWeather
    private var cacheLiveSpam = 60 // minutes
    let cancelBag = CancelBag()
    public init(webAPI: APIWeather) {
        self.webAPI = webAPI
    }
}

// MARK: - APIWeatherProtocol

extension FetcherWeather: APIWeatherProtocol {
    public func weeklyWeatherForecast(request: WeatherRequestDto.WeeklyWeatherForecast, cache: CachePolicy) -> AnyPublisher<WeatherResponseDto.WeeklyForecastEntity, APIError> {
        let cacheKey = "\(#function)_\(request)".replacingOccurrences(of: "\"", with: "")
        let targetAPI = webAPI
        let apiSubscriber           = targetAPI.agent.run(targetAPI.forecast(request: request), targetAPI.decoder, false) as AnyPublisher<WeatherResponseDto.WeeklyForecastEntity, APIError>
        let cacheSubscriberFailable = APICacheManager.shared.getAsyncFallible(key: cacheKey, params: [], type: WeatherResponseDto.WeeklyForecastEntity.self)
        let cacheSubscriberFailSafe = APICacheManager.shared.getAsyncFailSafe(key: cacheKey, params: [], type: WeatherResponseDto.WeeklyForecastEntity.self, onFail: apiSubscriber)

        apiSubscriber.sink(receiveCompletion: { _ in }, receiveValue: { [weak self] (data) in
            guard let self = self else { return }
            APICacheManager.shared.save(data, key: cacheKey, params: [], lifeSpam: self.cacheLiveSpam)
        }).store(in: cancelBag)

        switch cache {
        case .ignoringCache: return apiSubscriber
        case .cacheElseLoad: return cacheSubscriberFailSafe
        case .cacheAndLoad : return Publishers.Merge(cacheSubscriberFailable, apiSubscriber).eraseToAnyPublisher()
        case .cacheDontLoad: return cacheSubscriberFailable.eraseToAnyPublisher()
        }
    }

    public func currentWeatherForecast(request: WeatherRequestDto.CurrentWeatherForecast, cache: CachePolicy) -> AnyPublisher<WeatherResponseDto.CurrentWeatherForecastEntity, APIError> {
        let cacheKey = "\(#function)_\(request)".replacingOccurrences(of: "\"", with: "")
        let targetAPI = webAPI
        let apiSubscriber           = targetAPI.agent.run(targetAPI.weather(request: request), targetAPI.decoder, true) as AnyPublisher<WeatherResponseDto.CurrentWeatherForecastEntity, APIError>
        let cacheSubscriberFailable = APICacheManager.shared.getAsyncFallible(key: cacheKey, params: [], type: WeatherResponseDto.CurrentWeatherForecastEntity.self)
        let cacheSubscriberFailSafe = APICacheManager.shared.getAsyncFailSafe(key: cacheKey, params: [], type: WeatherResponseDto.CurrentWeatherForecastEntity.self, onFail: apiSubscriber)

        apiSubscriber.sink(receiveCompletion: { _ in }, receiveValue: { [weak self] (data) in
            guard let self = self else { return }
            APICacheManager.shared.save(data, key: cacheKey, params: [], lifeSpam: self.cacheLiveSpam)
        }).store(in: cancelBag)

        switch cache {
        case .ignoringCache: return apiSubscriber
        case .cacheElseLoad: return cacheSubscriberFailSafe
        case .cacheAndLoad : return Publishers.Merge(cacheSubscriberFailable, apiSubscriber).eraseToAnyPublisher()
        case .cacheDontLoad: return cacheSubscriberFailable.eraseToAnyPublisher()
    }
    }
}
