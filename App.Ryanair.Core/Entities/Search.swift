//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import Base_Domain

// https://sit-nativeapps.ryanair.com/api/v4/Availability?origin=DUB&destination=STN&dateout=2021-08-09&datein=&flexdaysbeforeout=3&flexdaysout=3&flexdaysbeforein=3&flexdaysin=3&adt=1&teen=0&chd=0&roundtrip=false&ToUs=AGREED

public extension RyanairDto {

    // MARK: - Availability
    struct Availability: Codable {
        let termsOfUse: String
        let currency: String
        let currPrecision: Int
        let routeGroup, tripType, upgradeType: String
        let trips: [Trip]
        let serverTimeUTC: String
    }

    // MARK: - Trip
    struct Trip: Codable {
        let origin: Origin
        let originName: String
        let destination: Destination
        let destinationName, routeGroup, tripType, upgradeType: String
        let dates: [DateElement]
    }

    // MARK: - DateElement
    struct DateElement: Codable {
        let dateOut: String
        let flights: [Flight]
    }

    // MARK: - Flight
    struct Flight: Codable {
        let faresLeft: Int
        let flightKey: String
        let infantsLeft: Int
        let regularFare: RegularFare
        let operatedBy: String
        let segments: [Segment]
        let flightNumber: String
        let time, timeUTC: [String]
        let duration: Duration
    }

    enum Duration: String, Codable {
        case the0120 = "01:20"
        case the0125 = "01:25"
    }

    // MARK: - RegularFare
    struct RegularFare: Codable {
        let fareKey: String
        let fareClass: FareClass
        let fares: [Fare]
    }

    enum FareClass: String, Codable {
        case s = "S"
    }

    // MARK: - Fare
    struct Fare: Codable {
        let type: TypeEnum
        let amount: Double
        let count: Int
        let hasDiscount: Bool
        let publishedFare: Double
        let mandatorySeatFee: MandatorySeatFee?
        let discountInPercent: Int
        let hasPromoDiscount: Bool
        let discountAmount: Int
    }

    // MARK: - MandatorySeatFee
    struct MandatorySeatFee: Codable {
        let vat, amt, total, totalDiscount: Int
        let totalWithoutDiscount: Int
        let discountType: DiscountType
        let code: Code
        let qty: Int

        enum Code: String, Codable {
            case seta = "SETA"
        }
    }

    enum DiscountType: String, Codable {
        case none = "None"
    }

    enum TypeEnum: String, Codable {
        case adt = "ADT"
        case chd = "CHD"
        case teen = "TEEN"
    }

    // MARK: - Segment
    struct Segment: Codable {
        let segmentNr: Int
        let origin: Origin
        let destination: Destination
        let flightNumber: String
        let time, timeUTC: [String]
        let duration: Duration
    }

    enum Destination: String, Codable {
        case stn = "STN"
    }

    enum Origin: String, Codable {
        case dub = "DUB"
    }
}
