//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import UtilsStorage
import UtilsNetworking

public struct APIRyanair_A {
    public init() {}
    public struct Constants {
        static let agent = SimpleNetworkAgentB()
        static let scheme = "https"
        static let host = "tripstest.ryanair.com"
        static let path = ""
        static let base = URL(string: "\(scheme)://\(host)")!
        static let dumpResponse = false
        static let decoder = JSONDecoder()
    }
    var agent: SimpleNetworkAgentB { return Self.Constants.agent }
    var base: URL { return Self.Constants.base }
    var dumpResponse: Bool { return Self.Constants.dumpResponse }
    var decoder: JSONDecoder { return Self.Constants.decoder }

    public func stations(_ request: RyanairRequestDto.Stations) -> URLComponents {
        var components    = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/static/stations.json"
        return components
    }
}

public struct APIRyanair_B {
    public init() {}
    public struct Constants {
        static let agent = SimpleNetworkAgentB()
        static let scheme = "https"
        static let host = "sit-nativeapps.ryanair.com"
        static let path = "/api/v4"
        static let base = URL(string: "\(scheme)://\(host)")!
        static let dumpResponse = false
        static let decoder = JSONDecoder()
    }
    var agent: SimpleNetworkAgentB { return Self.Constants.agent }
    var base: URL { return Self.Constants.base }
    var dumpResponse: Bool { return Self.Constants.dumpResponse }
    var decoder: JSONDecoder { return Self.Constants.decoder }

    public func availability(_ request: RyanairRequestDto.Availability) -> URLComponents {
        var components    = URLComponents()
        components.scheme = Self.Constants.scheme
        components.host   = Self.Constants.host
        components.path   = Self.Constants.path + "/Availability"
        components.queryItems = [
            URLQueryItem(name: "origin", value: request.origin),
            URLQueryItem(name: "destination", value: request.destination),
            URLQueryItem(name: "dateout", value: request.dateout),
            URLQueryItem(name: "datein", value: request.datein),
            URLQueryItem(name: "flexdaysbeforeout", value: request.flexdaysbeforeout),
            URLQueryItem(name: "flexdaysout", value: request.flexdaysout),
            URLQueryItem(name: "flexdaysbeforein", value: request.flexdaysbeforein),
            URLQueryItem(name: "flexdaysin", value: request.flexdaysin),
            URLQueryItem(name: "adt", value: "\(request.adt)"),
            URLQueryItem(name: "teen", value: "\(request.teen)"),
            URLQueryItem(name: "chd", value: "\(request.chd)"),
            URLQueryItem(name: "roundtrip", value: request.roundtrip ? "true" : "false"),
            URLQueryItem(name: "ToUs", value: request.ToUs)
        ]
        return components
    }
}
