//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit

public enum JSONDecoderErrors: Error {
    case decodeFail
}
public extension JSONDecoder {
    func decodeSafe<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
        // https://bugs.swift.org/browse/SR-6163 - Encode/Decode not possible < iOS 13 for top-level fragments (enum, int, string, etc.).
        if #available(iOS 13.0, *) {
            return try JSONDecoder().decode(type, from: data)
        } else {
            if let value = try? JSONDecoder().decode(WrapDecodable<T>.self, from: data) {
                return value.t
            }
            throw JSONDecoderErrors.decodeFail
        }
    }
}

public struct WrapEncodable<T: Encodable>: Encodable {
    public let t: T
    public init(t: T) {
        self.t = t
    }
}

public struct WrapDecodable<T: Decodable>: Decodable {
    public let t: T
    public init(t: T) {
        self.t = t
    }
}
