//
//  Created by Ricardo Santos on 07/11/2019.
//  Copyright © 2019 Crédito Agrícola. All rights reserved.
//

// swiftlint:disable no_print

import Foundation
import UIKit

extension String {
    init(_ staticString: StaticString) {
        self = staticString.withUTF8Buffer {
            String(decoding: $0, as: UTF8.self)
        }
    }
}

public func synced<T>(_ lock: Any, closure: () -> T) -> T {
    objc_sync_enter(lock)
    let r = closure()
    objc_sync_exit(lock)
    return r
}

public func randomBool() -> Bool {
    return randomInt(min: 0, max: 1) == 0
}

public func randomInt(min: Int, max: Int) -> Int {
    return Int.random(in: min ..< max)
}

public func randomStringWith(length: Int) -> String {
    let letters = "\n abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map { _ in letters.randomElement()! })
}

public func randomStringWith(prefix: String) -> String {
    return "# \(prefix) | \(randomStringWith(length: randomInt(min: 5, max: 10)))"
}

public func randomDate(d: Int?=nil, m: Int?=nil, y: Int?=nil) -> Date {
    let day = d != nil ? d! : randomInt(min: 1, max: 30)
    let mouth = m != nil ? m! : randomInt(min: 1, max: 12)
    let year = y != nil ? y! : randomInt(min: 2000, max: 2050)
    let calendar = Calendar.current
    var dateComponents: DateComponents? = calendar.dateComponents([.hour, .minute, .second], from: Date())
    dateComponents?.day = day
    dateComponents?.month = mouth
    dateComponents?.year = year
    if let dateComponentsUnwrapped = dateComponents,
        let date = calendar.date(from: dateComponentsUnwrapped) {
        return date
    }
    return Date()
}

// Screen width.
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

public func whereAmIDynamic(function: String,
                            file: String,
                            line: UInt,
                            short: Bool = false,
                            prefix: String = "") -> String {
    guard let fileName = "\(file)".components(separatedBy: "/").last else {
        return ""
    }
    if short {
        return "\(fileName) | \(function)"
    } else {
        if !prefix.isEmpty {
            return "\(prefix) | func [\(function)] in file [\(fileName)]"
        } else {
            return "L\(line), \(function) @ \(fileName)"
        }
    }
}

public func whereAmI(function: StaticString = #function,
                     file: StaticString = #file,
                     line: UInt = #line,
                     short: Bool = false,
                     prefix: String = "") -> String {
    return whereAmIDynamic(function: String(function), file: String(file), line: line, short: short, prefix: prefix)
}

public func perfectMapperThrows<A: Encodable, B: Decodable>(inValue: A, outValue: B.Type) throws -> B {
    do {
        let encoded = try JSONEncoder().encode(inValue)
        let decoded = try JSONDecoder().decode(((B).self), from: encoded)
        return decoded
    } catch {
        #if DEBUG
            print("⛔⛔⛔⛔⛔ perfectMapperThrows ⛔⛔⛔⛔⛔")
            print("⛔⛔⛔⛔⛔ perfectMapperThrows ⛔⛔⛔⛔⛔")
            print("# Conversion fail from [\(A.self)] to [\(B.self)]")
            let inValueParsed = "\(inValue)".replacingOccurrences(of: ", ", with: ",\n\t")
            print("\(inValueParsed)")
            print("\n")
            print("# Error [\(error)]")
            print("⛔⛔⛔⛔⛔ perfectMapperThrows ⛔⛔⛔⛔⛔")
            print("⛔⛔⛔⛔⛔ perfectMapperThrows ⛔⛔⛔⛔⛔")
        #endif
        throw error
    }
}

public func perfectMapper<A: Encodable, B: Decodable>(inValue: A, outValue: B.Type) -> B? {
    do {
        return try perfectMapperThrows(inValue: inValue, outValue: outValue)
    } catch {
        #if DEBUG
            print("⛔⛔⛔⛔⛔ perfectMapper ⛔⛔⛔⛔⛔")
            print("⛔⛔⛔⛔⛔ perfectMapper ⛔⛔⛔⛔⛔")
            print("# Conversion fail from [\(A.self)] to [\(B.self)]")
            print("\n")
            let inValueParsed = "\(inValue)".replacingOccurrences(of: ", ", with: ",\n ")
            print("\(inValueParsed)")
            print("\n")
            print("# Error [\(error)]")
            print("⛔⛔⛔⛔⛔ perfectMapper ⛔⛔⛔⛔⛔")
            print("⛔⛔⛔⛔⛔ perfectMapper ⛔⛔⛔⛔⛔")
        #endif
        return nil
    }
}
