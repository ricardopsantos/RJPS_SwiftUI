//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import Utils_Storage
import Utils_Networking

public struct APIRyanair_A {
    public init() {}
    public struct Constants {
        static let agent = SimpleNetworkAgent_B()
        static let scheme = "https"
        static let host = "tripstest.ryanair.com"
        static let path = ""
        static let base = URL(string: "\(scheme)://\(host)")!
        static let dumpResponse = false
        static let decoder = JSONDecoder()
    }
    var agent: SimpleNetworkAgent_B { return Self.Constants.agent }
    var base: URL { return Self.Constants.base }
    var dumpResponse: Bool { return Self.Constants.dumpResponse }
    var decoder: JSONDecoder { return Self.Constants.decoder }

    public func stations() -> URLComponents {
        // https://tripstest.ryanair.com/static/stations.json
        // https://tripstest.ryanair.com/static/stations.json
        var components    = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/static/stations.json"
        return components
    }
}

// https://sit-nativeapps.ryanair.com/api/v4/Availability?origin=DUB&destination=STN&dateout=2021-08-09&datein=&flexdaysbeforeout=3&flexdaysout=3&flexdaysbeforein=3&flexdaysin=3&adt=1&teen=0&chd=0&roundtrip=false&ToUs=AGREED
public struct APIRyanair_B {
    public init() {}
    public struct Constants {
        static let agent = SimpleNetworkAgent_B()
        static let scheme = "https"
        static let host = "sit-nativeapps.ryanair.com"
        static let path = "/api/v4"
        static let base = URL(string: "\(scheme)://\(host)")!
        static let dumpResponse = false
        static let decoder = JSONDecoder()
    }
    var agent: SimpleNetworkAgent_B { return Self.Constants.agent }
    var base: URL { return Self.Constants.base }
    var dumpResponse: Bool { return Self.Constants.dumpResponse }
    var decoder: JSONDecoder { return Self.Constants.decoder }

    public func availability() -> URLComponents {
        var components    = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/Availability"
        components.queryItems = [
            URLQueryItem(name: "origin", value: "DUB"),
            URLQueryItem(name: "destination", value: "STN"),
            URLQueryItem(name: "dateout", value: "2021-08-09"),
            URLQueryItem(name: "datein", value: ""),
            URLQueryItem(name: "flexdaysbeforeout", value: "3"),
            URLQueryItem(name: "flexdaysout", value: "3"),
            URLQueryItem(name: "flexdaysbeforein", value: "3"),
            URLQueryItem(name: "flexdaysin", value: "3"),
            URLQueryItem(name: "adt", value: "1"),
            URLQueryItem(name: "teen", value: "1"),
            URLQueryItem(name: "chd", value: "1"),
            URLQueryItem(name: "roundtrip", value: "false"),
            URLQueryItem(name: "ToUs", value: "AGREED")
        ]
        return components
    }
}
