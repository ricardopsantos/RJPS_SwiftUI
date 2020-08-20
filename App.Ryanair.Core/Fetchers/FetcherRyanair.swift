//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import Base_Domain
//
import Utils_Networking
import Utils_Storage
import Utils

// The Fetcher will aggregate all deferent WEB APIs
// The Fetcher will aggregate all deferent WEB APIs
// The Fetcher will aggregate all deferent WEB APIs

public class FetcherRyanair {
    private let webAPI_A: APIRyanair_A
    private let webAPI_B: APIRyanair_B
    let cancelBag = CancelBag()
    public init(webAPI_A: APIRyanair_A, webAPI_B: APIRyanair_B) {
        self.webAPI_A = webAPI_A
        self.webAPI_B = webAPI_B
    }
}

// MARK: - APIRyanairProtocol

extension FetcherRyanair: APIRyanairProtocol {

    // https://tripstest.ryanair.com/static/stations.json
    public func stations(cache: CachePolicy) -> AnyPublisher<RyanairDto.Stations, APIError> {
        let cacheKey = "\(#function)"
        let targetAPI = webAPI_A
        let apiSubscriber           = targetAPI.agent.run(targetAPI.stations(), targetAPI.decoder, false) as AnyPublisher<RyanairDto.Stations, APIError>
        let cacheSubscriberFailable = APICacheManager.shared.getAsyncFallible(key: cacheKey, params: [], type: RyanairDto.Stations.self)
        let cacheSubscriberFailSafe = APICacheManager.shared.getAsyncFailSafe(key: cacheKey, params: [], type: RyanairDto.Stations.self, onFail: apiSubscriber)

        apiSubscriber.sink(receiveCompletion: { _ in }, receiveValue: { (data) in
            APICacheManager.shared.save(data, key: cacheKey, params: [], lifeSpam: 5)
        }).store(in: cancelBag)

        switch cache {
        case .ignoringCache: return apiSubscriber
        case .cacheElseLoad: return cacheSubscriberFailSafe
        case .cacheAndLoad : return Publishers.Merge(cacheSubscriberFailable, apiSubscriber).eraseToAnyPublisher()
        case .cacheDontLoad: return cacheSubscriberFailable.eraseToAnyPublisher()
        }
    }

    // https://sit-nativeapps.ryanair.com/api/v4/Availability?origin=DUB&destination=STN&dateout=2021-08-09&datein=&flexdaysbeforeout=3&flexdaysout=3&flexdaysbeforein=3&flexdaysin=3&adt=1&teen=0&chd=0&roundtrip=false&ToUs=AGREED
    public func availability(/*origin: String = "",
                       destination: String = "",
                       dateout: String = "",
                       datein: String = "",
                       flexdaysbeforeout: Int = 0,
                       flexdaysout: Int = 0,
                       flexdaysin: Int = 0,
                       adt: Int = 0,
                       teen: Int = 0,
                       chd: Int = 0,
                       roundtrip: Bool = true,
                       ToUs: String = ""*/
                    cache: CachePolicy) -> AnyPublisher<RyanairDto.Availability, APIError> {
        let cacheKey = "\(#function)"
        let targetAPI = webAPI_B
        let apiSubscriber           = targetAPI.agent.run(targetAPI.availability(), targetAPI.decoder, true) as AnyPublisher<RyanairDto.Availability, APIError>
        let cacheSubscriberFailable = APICacheManager.shared.getAsyncFallible(key: cacheKey, params: [], type: RyanairDto.Availability.self)
        let cacheSubscriberFailSafe = APICacheManager.shared.getAsyncFailSafe(key: cacheKey, params: [], type: RyanairDto.Availability.self, onFail: apiSubscriber)

        apiSubscriber.sink(receiveCompletion: { _ in }, receiveValue: { (data) in
            APICacheManager.shared.save(data, key: cacheKey, params: [], lifeSpam: 5)
        }).store(in: cancelBag)

        switch cache {
        case .ignoringCache: return apiSubscriber
        case .cacheElseLoad: return cacheSubscriberFailSafe
        case .cacheAndLoad : return Publishers.Merge(cacheSubscriberFailable, apiSubscriber).eraseToAnyPublisher()
        case .cacheDontLoad: return cacheSubscriberFailable.eraseToAnyPublisher()
        }
    }
}

/*private extension FetcherRyanair {
    func run<T>(_ components: URLComponents, _ decoder: JSONDecoder, _ dumpResponse: Bool) -> AnyPublisher<T, APIError> where T: Decodable {
        return webAPI.agent.run(components, decoder, dumpResponse)
    }
}*/
