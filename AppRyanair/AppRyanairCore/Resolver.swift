//
//  Resolver.swift
//  BaseDomain
//
//  Created by Ricardo Santos on 08/02/2021.
//

import Foundation
//
import RJSLibUFBase
//
import BaseDomain
import AppRyanairDomain
import AppRyanairWebAPI

public extension Resolver {
    static func AppRyanair(mock: Bool) {
        if mock {
            RJS_Resolver.shared.register(type: APIRyanairProtocol.self, { FetcherRyanairMock() })
            RJS_Resolver.shared.register(type: RepositoryRyanairProtocol.self, { RepositoryRyanair() })
        } else {
            RJS_Resolver.shared.register(type: RepositoryRyanairProtocol.self, { RepositoryRyanair() })
            RJS_Resolver.shared.register(type: APIRyanairProtocol.self, {
                let apiRyanair_A = APIRyanair_A()
                let apiRyanair_B = APIRyanair_B()
                return FetcherRyanair(webAPI_A: apiRyanair_A, webAPI_B: apiRyanair_B)
            })
        }
    }
}
