//
//  File.swift
//  DevTools
//
//  Created by Ricardo Santos on 11/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public protocol NSCacheManagerProtocol {
    func add(object: AnyObject, withKey: String)
    func get(key: String) -> AnyObject?
    func delete(key: String)
    func clean()
}

public class NSCacheManager: NSCacheManagerProtocol {

    private init() {}
    public static let shared = NSCacheManager()

    private var _cache = NSCache<NSString, AnyObject>()

    public func add(object: AnyObject, withKey: String) {
        objc_sync_enter(_cache); defer { objc_sync_exit(_cache) }
        _cache.setObject(object as AnyObject, forKey: withKey as NSString)
    }

    public func get(key: String) -> AnyObject? {
        objc_sync_enter(_cache); defer { objc_sync_exit(_cache) }
        if let object = _cache.object(forKey: key as NSString) { return object }
        return nil
    }

    public func delete(key: String) {
        objc_sync_enter(_cache); defer { objc_sync_exit(_cache) }
        _cache.removeObject(forKey: key as NSString)
    }

    public func clean() {
        objc_sync_enter(_cache); defer { objc_sync_exit(_cache) }
        _cache.removeAllObjects()
    }

    public func check() {
        print(_cache)
    }
}
