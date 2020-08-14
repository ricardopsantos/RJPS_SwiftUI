//
//  Created by Ricardo Santos on 13/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public class GenericKeyValueStorableRecord: Codable {
    public var keyBase: String = ""
    public var key: String = ""         // Computed cache key (with parameters)
    public var keyParams: String = ""   // Only the parameters used on building the key
    private var object: String = ""      // Value to be stored
    public var valueType: String = ""
    public var recordDate: Date = GenericKeyValueStorableRecord.referenceDate
    public var expireDate: Date = GenericKeyValueStorableRecord.referenceDate
    public var encoding: Int = 1
    public var objectType: String = ""

    public convenience init(composedKey: String,
                            keyBase: String,
                            keyParams: String,
                            value: String,
                            timeToLive: Int, // minutes
                            valueType: String,
                            encoding: ValueEncoding,
                            objectType: String) {
        self.init()
        self.key       = composedKey
        self.keyBase   = keyBase
        self.keyParams = keyParams
        self.object    = value
        self.recordDate = GenericKeyValueStorableRecord.referenceDate
        self.expireDate = GenericKeyValueStorableRecord.referenceDate.addingTimeInterval(TimeInterval(timeToLive*60))
        self.encoding   = encoding.rawValue
        self.valueType  = valueType
        self.objectType = objectType
    }

    public enum ValueEncoding: Int {
        case plainJSON = 0
        case base64
        case data
    }

    static var referenceDate: Date {
        return Date()
    }

    public var objectResume: String {
        return ("\(key) | \(objectType) | \(expireDate)")
    }

    public var toData: Data? {
        if let data = try? JSONEncoder().encode(self) {
            return data
        }
        return nil
    }

    public var value: String? {
        print(objectResume)
        if Self.referenceDate < self.expireDate {
            return object
        }
        // Object expired
        return nil
    }
}

extension GenericKeyValueStorableRecord {

    public convenience init<T: Codable>(_ some: T, key: String, params: [String] = [], lifeSpam: Int = 5) {
        self.init()
        var valueType = ""
        var value = ""
        if let toStore = try? JSONEncoder().encode(some) {
            value = String(decoding: toStore, as: UTF8.self)
            valueType = "\(String(describing: type(of: some)))"
        }
        self.key       = CacheUtils.composedKey(key, params)
        self.keyBase   = key
        self.keyParams = CacheUtils.parseKeyParams(params)
        self.object     = value
        self.recordDate = GenericKeyValueStorableRecord.referenceDate
        self.expireDate = GenericKeyValueStorableRecord.referenceDate.addingTimeInterval(TimeInterval(lifeSpam*60))
        self.encoding   = ValueEncoding.data.rawValue
        self.valueType  = valueType
        self.objectType = "\(T.Type.self)"
    }

}
