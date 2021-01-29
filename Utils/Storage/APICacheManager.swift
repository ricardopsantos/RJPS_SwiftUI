//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import RJSLibUFBase
//
import BaseDomain

public class APICacheManager {
    private init() {}
    public static let shared = APICacheManager()

    public func save<T: Codable>(_ some: T, key: String, params: [String], lifeSpam: Int = 5) {
        let toCache = GenericStorableKeyValueModel(some, key: key, params: params, lifeSpam: lifeSpam)
        UserDefaults.standard.save(kvStorableRecord: toCache)
    }

    // Get Sync
    public func getSync<T: Codable>(key: String, params: [String], type: T.Type) -> T? {
        let composedKey = CacheUtils.composedKey(key, params)
        return get(composedKey: composedKey, type: type)
    }

    public func getAsyncFallible<T: Codable>(key: String, params: [String], type: T.Type) -> AnyPublisher<T, APIError> {
        if let result = getSync(key: key, params: params, type: type) {
            return Just(result).mapError { _ in .ok }.eraseToAnyPublisher()
        } else {
            return Fail(error: APIError.cacheNotFound).eraseToAnyPublisher()
        }
    }

    public func getAsyncFailSafe<T: Codable>(key: String, params: [String], type: T.Type, onFail: AnyPublisher<T, APIError>) -> AnyPublisher<T, APIError> {
        if let result = getSync(key: key, params: params, type: type) {
            return Just(result).mapError { _ in .ok }.eraseToAnyPublisher()
        } else {
            return onFail
        }
    }

}

private extension APICacheManager {
    func get<T: Codable>(composedKey: String, type: T.Type) -> T? {
        if let cached = GenericStorableKeyValueModel.get(composedKey: composedKey),
            let value = cached.value,
            let data = value.data(using: .utf8),
            let result = try? JSONDecoder().decodeFriendly(type, from: data) {
                return result
        }
        return nil
    }
}
