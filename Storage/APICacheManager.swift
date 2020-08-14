//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public class APICacheManager {
    private init() {}
    public static let shared = APICacheManager()

    public func save<T: Codable>(_ some: T, key: String, params: [String], lifeSpam: Int = 5) {
        let toCache = GenericKeyValueStorableRecord(some, key: key, params: params, lifeSpam: lifeSpam)
        print(toCache.objectResume)
        UserDefaults.standard.save(kvStorableRecord: toCache)
    }
    
    public func get<T: Codable>(key: String, params: [String], type: T.Type) -> T? {
        return get(composedKey: CacheUtils.composedKey(key, params), type: type)
    }

}

private extension APICacheManager {
    func get<T: Codable>(composedKey: String, type: T.Type) -> T? {
        if let cached = UserDefaults.standard.data(forKey: composedKey) {
            if let dRes = try? JSONDecoder().decode(GenericKeyValueStorableRecord.self, from: cached), let value = dRes.value {
                if let data = value.data(using: .utf8) {
                    if let final = try? JSONDecoder().decode(type, from: data) {
                        return final
                    }
                }
            }
        }
        return nil
    }
}
