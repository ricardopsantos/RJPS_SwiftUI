//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import RJSLibUFBase
//
import AppRyanairWebAPI
import AppRyanairDomain
import BaseDomain
import Utils

// The Fetcher will aggregate all deferent WEB APIs
// The Fetcher will aggregate all deferent WEB APIs
// The Fetcher will aggregate all deferent WEB APIs

public class FetcherRyanair {
    private let webAPI_A: APIRyanair_A
    private let webAPI_B: APIRyanair_B
    private var cacheLiveSpam = 60 // minutes
    let cancelBag = CancelBag()
    public init(webAPI_A: APIRyanair_A, webAPI_B: APIRyanair_B) {
        self.webAPI_A = webAPI_A
        self.webAPI_B = webAPI_B
    }
}

// MARK: - APIRyanairProtocol

extension FetcherRyanair: APIRyanairProtocol {

    // https://tripstest.ryanair.com/static/stations.json
    public func stations(request: RequestDto.Stations, cache: CachePolicy) -> AnyPublisher<ResponseDto.Stations, APIError> {
        let cacheKey = "\(#function)_\(request)".replacingOccurrences(of: "\"", with: "")
        let targetAPI = webAPI_A
        let apiSubscriber           = targetAPI.agent.run(targetAPI.stations(request), targetAPI.decoder, false) as AnyPublisher<ResponseDto.Stations, APIError>
        let cacheSubscriberFailable = APICacheManager.shared.getAsyncFallible(key: cacheKey, params: [], type: ResponseDto.Stations.self)
        let cacheSubscriberFailSafe = APICacheManager.shared.getAsyncFailSafe(key: cacheKey, params: [], type: ResponseDto.Stations.self, onFail: apiSubscriber)

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

    public func availability(request: RequestDto.Availability, cache: CachePolicy) -> AnyPublisher<ResponseDto.Availability, APIError> {
        let cacheKey = "\(#function)_\(request)".replacingOccurrences(of: "\"", with: "")
        let targetAPI = webAPI_B
        let apiSubscriber           = targetAPI.agent.run(targetAPI.availability(request), targetAPI.decoder, true) as AnyPublisher<ResponseDto.Availability, APIError>
        let cacheSubscriberFailable = APICacheManager.shared.getAsyncFallible(key: cacheKey, params: [], type: ResponseDto.Availability.self)
        let cacheSubscriberFailSafe = APICacheManager.shared.getAsyncFailSafe(key: cacheKey, params: [], type: ResponseDto.Availability.self, onFail: apiSubscriber)

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
