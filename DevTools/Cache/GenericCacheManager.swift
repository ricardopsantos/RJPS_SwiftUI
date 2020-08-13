//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public class GenericCacheManager {

    private init() {}
    public static let shared = GenericCacheManager()

    public func save(data: Data, key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }

    public func save(kvStorableRecord: GenericKeyValueStorableRecord) {
        UserDefaults.standard.set(kvStorableRecord.toData, forKey: kvStorableRecord.key)
    }

    public func get<T: Codable>(key: String, params: [String], type: T.Type) -> T? {
        return get(composedKey: CacheUtils.composedKey(key, params), type: type)
    }

    public func get<T: Codable>(composedKey: String, type: T.Type) -> T? {
        if let cached = UserDefaults.standard.data(forKey: composedKey) {
            if let dRes = try? JSONDecoder().decode(GenericKeyValueStorableRecord.self, from: cached) {
                if let data = dRes.value.data(using: .utf8) {
                    if let final = try? JSONDecoder().decode(type, from: data) {
                        return final
                    }
                }
            }
        }
        return nil
    }
}

