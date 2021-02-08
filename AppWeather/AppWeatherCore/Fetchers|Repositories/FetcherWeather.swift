//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import RJSLibUFBase
//
import BaseDomain
import AppWeatherWebAPI
import AppWeatherDomain
import UtilsNetworking
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
    public func weeklyWeatherForecast(request: RequestDto.WeeklyWeatherForecast, cache: CachePolicy) -> AnyPublisher<ResponseDto.WeeklyForecastEntity, APIError> {
        let cacheKey = "\(#function)_\(request)".replacingOccurrences(of: "\"", with: "")
        let targetAPI = webAPI
        let apiSubscriber           = targetAPI.agent.run(targetAPI.forecast(request: request), targetAPI.decoder, false) as AnyPublisher<ResponseDto.WeeklyForecastEntity, APIError>
        let cacheSubscriberFailable = APICacheManager.shared.getAsyncFallible(key: cacheKey, params: [], type: ResponseDto.WeeklyForecastEntity.self)
        let cacheSubscriberFailSafe = APICacheManager.shared.getAsyncFailSafe(key: cacheKey, params: [], type: ResponseDto.WeeklyForecastEntity.self, onFail: apiSubscriber)

        apiSubscriber.sink(receiveCompletion: { _ in }, receiveValue: { [weak self] (data) in
            guard let self = self else { return }
            APICacheManager.shared.save(data, key: cacheKey, params: [], lifeSpam: self.cacheLiveSpam)
        }).store(in: cancelBag)

        switch cache {
        case .noCacheLoad:   return apiSubscriber
        case .cacheElseLoad: return cacheSubscriberFailSafe
        case .cacheAndLoad : return Publishers.Merge(cacheSubscriberFailable, apiSubscriber).eraseToAnyPublisher()
        case .cacheNoLoad: return cacheSubscriberFailable.eraseToAnyPublisher()
        }
    }

    public func currentWeatherForecast(request: RequestDto.CurrentWeatherForecast, cache: CachePolicy) -> AnyPublisher<ResponseDto.CurrentWeatherForecastEntity, APIError> {
        let cacheKey = "\(#function)_\(request)".replacingOccurrences(of: "\"", with: "")
        let targetAPI = webAPI
        let apiSubscriber           = targetAPI.agent.run(targetAPI.weather(request: request), targetAPI.decoder, true) as AnyPublisher<ResponseDto.CurrentWeatherForecastEntity, APIError>
        let cacheSubscriberFailable = APICacheManager.shared.getAsyncFallible(key: cacheKey, params: [], type: ResponseDto.CurrentWeatherForecastEntity.self)
        let cacheSubscriberFailSafe = APICacheManager.shared.getAsyncFailSafe(key: cacheKey, params: [], type: ResponseDto.CurrentWeatherForecastEntity.self, onFail: apiSubscriber)

        apiSubscriber.sink(receiveCompletion: { _ in }, receiveValue: { [weak self] (data) in
            guard let self = self else { return }
            APICacheManager.shared.save(data, key: cacheKey, params: [], lifeSpam: self.cacheLiveSpam)
        }).store(in: cancelBag)

        switch cache {
        case .noCacheLoad:   return apiSubscriber
        case .cacheElseLoad: return cacheSubscriberFailSafe
        case .cacheAndLoad : return Publishers.Merge(cacheSubscriberFailable, apiSubscriber).eraseToAnyPublisher()
        case .cacheNoLoad: return cacheSubscriberFailable.eraseToAnyPublisher()
        }
    }
}
