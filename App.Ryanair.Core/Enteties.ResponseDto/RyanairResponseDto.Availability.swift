//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import Base_Domain

public extension RyanairResponseDto {

    // MARK: - Availability
    struct Availability: DtoProtocol {
        let termsOfUse: String
        let currency: String
        let currPrecision: Int
        let routeGroup, tripType, upgradeType: String
        let trips: [Trip]
        let serverTimeUTC: String
    }

    // MARK: - Trip
    struct Trip: DtoProtocol {
        let origin: Origin
        let originName: String
        let destination: Destination
        let destinationName, routeGroup, tripType, upgradeType: String
        let dates: [DateElement]
    }

    // MARK: - DateElement
    struct DateElement: DtoProtocol {
        let dateOut: String
        let flights: [Flight]
    }

    // MARK: - Flight
    struct Flight: DtoProtocol {
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

    enum Duration: String, DtoProtocol {
        case the0120 = "01:20"
        case the0125 = "01:25"
    }

    // MARK: - RegularFare
    struct RegularFare: DtoProtocol {
        let fareKey: String
        let fareClass: FareClass
        let fares: [Fare]
    }

    enum FareClass: String, DtoProtocol {
        case s = "S"
    }

    // MARK: - Fare
    struct Fare: DtoProtocol {
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
    struct MandatorySeatFee: DtoProtocol {
        let vat, amt, total, totalDiscount: Int
        let totalWithoutDiscount: Int
        let discountType: DiscountType
        let code: Code
        let qty: Int

        enum Code: String, DtoProtocol {
            case seta = "SETA"
        }
    }

    enum DiscountType: String, DtoProtocol {
        case none = "None"
    }

    enum TypeEnum: String, DtoProtocol {
        case adt = "ADT"
        case chd = "CHD"
        case teen = "TEEN"
    }

    // MARK: - Segment
    struct Segment: DtoProtocol {
        let segmentNr: Int
        let origin: Origin
        let destination: Destination
        let flightNumber: String
        let time, timeUTC: [String]
        let duration: Duration
    }

    enum Destination: String, DtoProtocol {
        case stn = "STN"
    }

    enum Origin: String, DtoProtocol {
        case dub = "DUB"
    }
}
