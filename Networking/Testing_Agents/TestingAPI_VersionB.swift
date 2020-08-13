//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import DevTools

// MARK: - Class & Constants

public class TestingAPI_VersionB {
    public struct Constants {
        static let agent = SimpleNetworkAgent_B()
        static let scheme = "https"
        static let host = "api.github.com"
        static let path = "" // API Version
        static let dumpResponse = false
        static let decoder = JSONDecoder()
    }
    var decoder: JSONDecoder { return Self.Constants.decoder }
    var dumpResponse: Bool { return Self.Constants.dumpResponse }
    var subscriptions: Set<AnyCancellable> = []
}

// MARK: - Protocol implementation
class GenericKeyValueStorableRecord: Codable {
    public var keyBase: String = ""
    public var key: String = ""         // Computed cache key (with parameters)
    public var keyParams: String = ""   // Only the parameters used on building the key
    public var value: String = ""       // JSON response from server (no metadata included)
    public var valueType: String = ""
    public var recordDate: Date = GenericKeyValueStorableRecord.referenceDate
    public var expireDate: Date = GenericKeyValueStorableRecord.referenceDate
    public var encoding: Int = 1
    public var objectType: String = ""

    public convenience init(composedKey: String,
                            keyBase: String,
                            keyParams: String,
                            value: String,
                            timeToLive: Int,
                            valueType: String,
                            encoding: ValueEncoding,
                            objectType: String) {
        self.init()
        self.key       = composedKey
        self.keyBase   = keyBase
        self.keyParams = keyParams
        self.value     = value
        self.recordDate = GenericKeyValueStorableRecord.referenceDate
        self.expireDate = GenericKeyValueStorableRecord.referenceDate.addingTimeInterval(TimeInterval(timeToLive))
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
}

func buildKey(_ key: String, _ keyParams: [String]) -> String {
    return "\(key)_\(parseKeyParams(keyParams))"
}

func parseKeyParams(_ params: [String]) -> String {
    return "[" + params.joined(separator: ",") + "]"
}

func toGenericKeyValueStorableRecord<T: Codable>(_ some: T, withKey key: String, keyParams: [String], lifeSpam: Int = 5) -> GenericKeyValueStorableRecord? {
    let composedKey = buildKey(key, keyParams)
    let computedKeyParams = parseKeyParams(keyParams)
    var result: GenericKeyValueStorableRecord?
    if let cachedObject = try? JSONEncoder().encode(some) {
        let value = String(decoding: cachedObject, as: UTF8.self)
        let valueType = "\(String(describing: type(of: some)))"
        result = GenericKeyValueStorableRecord(composedKey: composedKey,
                                       keyBase: key,
                                       keyParams: computedKeyParams,
                                       value: value,
                                       timeToLive: lifeSpam,
                                       valueType: valueType,
                                       encoding: .data,
                                       objectType: "\(T.Type.self)")
    }
    return result
}

func getFromCache<T: Codable>(key: String, params: [String], type: T.Type) -> T? {
    let cacheKey = buildKey(key, params)
    if let cached = UserDefaults.standard.data(forKey: cacheKey) {
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

extension TestingAPI_VersionB: TestingAPIProtocol {
    public func repos(username: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        let key = "\(#function).\(username)"
        let params = [username]
        let cacheKey = buildKey(key, params)
        if let cached = UserDefaults.standard.data(forKey: cacheKey) {
                if let dRes = try? JSONDecoder().decode(GenericKeyValueStorableRecord.self, from: cached) {
                    if let data = dRes.value.data(using: .utf8) {
                        if let final = try? JSONDecoder().decode([APIResponseDto.Repository].self, from: data) {
                            print(final)
                        }
                    }
            }
        }

        if let x = getFromCache(key: key, params: params, type: [APIResponseDto.Repository].self) {
            print(x)
        }
        let response: AnyPublisher<[APIResponseDto.Repository], APIError> = run(repos(username: username), decoder, dumpResponse)

        response.sink(receiveCompletion: { (result) in
            switch result {
            case .finished: _ = ()
            case .failure(let error): _ = error
            }
        }, receiveValue: { (data) in
            if let saveModel = toGenericKeyValueStorableRecord(data, withKey: cacheKey, keyParams: [username]) {
                UserDefaults.standard.set(saveModel.toData, forKey: saveModel.key)
            }
        }).store(in: &subscriptions)
        return response
    }

    public func issues(repo: String, owner: String) -> AnyPublisher<[APIResponseDto.Issue], APIError> {
        let cacheKey = "\(#function).\(repo).\(owner)"
        NSCacheManager.shared.get(key: cacheKey)
        if let cached = NSCacheManager.shared.get(key: cacheKey) {

        }
        return run(issues(repo: repo, owner: owner), decoder, dumpResponse)
    }

    public func repos(org: String) -> AnyPublisher<[APIResponseDto.Repository], APIError> {
        let cacheKey = "\(#function).\(org)"
        NSCacheManager.shared.get(key: cacheKey)
        if let cached = NSCacheManager.shared.get(key: cacheKey) {

        }
        return run(repos(org: org), decoder, dumpResponse)
    }

    public func members(org: String) -> AnyPublisher<[APIResponseDto.User], APIError> {
        let cacheKey = "\(#function).\(org)"
        NSCacheManager.shared.get(key: cacheKey)
        if let cached = NSCacheManager.shared.get(key: cacheKey) {

        }
        return run(members(org: org), decoder, dumpResponse)
    }

}

// MARK: - Requestables

private extension TestingAPI_VersionB {
    func repos(username: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/users/\(username)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

    func issues(repo: String, owner: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/repos/\(owner)/\(repo)/issues"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

    func repos(org: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/orgs/\(org)/repos"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

    func members(org: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/orgs/\(org)/members"
        components.queryItems = [
        //    URLQueryItem(name: "users", value: "\(username)/repos")
        ]
        return components
    }

}

// MARK: - Private

private extension TestingAPI_VersionB {
    func run<T>(_ components: URLComponents, _ decoder: JSONDecoder, _ dumpResponse: Bool) -> AnyPublisher<T, APIError> where T: Decodable {
        return Self.Constants.agent.run(components, decoder, dumpResponse)
    }
}
