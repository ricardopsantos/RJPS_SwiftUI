//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import BaseDomain

//MARK:- Stations : https://tripstest.ryanair.com/static/stations.json

public extension ResponseDto {
    struct Stations: DtoProtocol {
        public let stations: [Station]
    }

    // MARK: - Station
    struct Station: DtoProtocol {
        public let code, name: String
        public let alternateName: String?
        public let alias: [String]
        public let countryCode, countryName: String
        public let countryAlias: String?
        public let countryGroupCode: String
        public let countryGroupName: CountryGroupName
        public let timeZoneCode, latitude, longitude: String
        public let mobileBoardingPass: Bool
        public let markets: [Market]
        public let notices: String?
        public let tripCardImageURL: String?
        public let ecoFriendly, airportShopping: Bool?

        enum CodingKeys: String, CodingKey {
            case code, name, alternateName, alias, countryCode, countryName, countryAlias, countryGroupCode, countryGroupName, timeZoneCode, latitude, longitude, mobileBoardingPass, markets, notices
            case tripCardImageURL = "tripCardImageUrl"
            case ecoFriendly, airportShopping
        }
    }

    enum CountryGroupName: String, DtoProtocol {
        case euEea = "EU/EEA"
        case nonEUEEA = "non EU/EEA"
    }

    // MARK: - Market
    struct Market: DtoProtocol {
        public let code: String
        public let group: Group?
        public let stops: [Stop]?
        public let onlyConnecting, pendingApproval, onlyPrintedBoardingPass: Bool?
    }

    enum Group: String, DtoProtocol {
        case canary = "CANARY"
        case canaryGold = "CANARY_GOLD"
        case city = "CITY"
        case cityGold = "CITY_GOLD"
        case domestic = "DOMESTIC"
        case domesticGold = "DOMESTIC_GOLD"
        case ethnic = "ETHNIC"
        case leisure = "LEISURE"
        case leisureGold = "LEISURE_GOLD"
        case ukp = "UKP"
        case ukpGold = "UKP_GOLD"
    }

    // MARK: - Stop
    struct Stop: DtoProtocol {
        public let code: Code
    }

    enum Code: String, DtoProtocol {
        case bgy = "BGY"
        case dus = "DUS"
        case fco = "FCO"
        case opo = "OPO"
    }
}
