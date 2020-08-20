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
        public let termsOfUse: String
        public let currency: String
        public let currPrecision: Int
        public let routeGroup, tripType, upgradeType: String
        public let trips: [Trip]
        public let serverTimeUTC: String
    }

    // MARK: - Trip
    struct Trip: DtoProtocol {
        public let origin: String      // Airport Code
        public let originName: String
        public let destination: String // Airport Code
        public let destinationName, routeGroup, tripType, upgradeType: String
        public let dates: [DateElement]
    }

    // MARK: - DateElement
    struct DateElement: DtoProtocol {
        public let dateOut: String
        public let flights: [Flight]
    }

    // MARK: - Flight
    struct Flight: DtoProtocol {
        public let faresLeft: Int
        public let flightKey: String
        public let infantsLeft: Int
        public let regularFare: RegularFare
        public let operatedBy: String
        public let segments: [Segment]
        public let flightNumber: String
        public let time, timeUTC: [String]
        public let duration: String
    }

   /* enum Duration: String, DtoProtocol {
        case the0120 = "01:20"
        case the0125 = "01:25"
    }*/

    // MARK: - RegularFare
    struct RegularFare: DtoProtocol {
        let fareKey: String
        let fareClass: FareClass
        let fares: [Fare]
    }

    /*
     F and A: first class
     J, R, D and I: business class
     W and P: premium economy
     Y, H, K, M, L, G, V, S, N, Q and O: economy
     B: basic economy
     */
    enum FareClass: String, DtoProtocol {
        case f = "F"
        case a = "A"
        case j = "J"
        case e = "E"
        case r = "R"
        case w = "w"
        case p = "p"
        case b = "b"
        case y = "Y"
        case h = "H"
        case k = "K"
        case m = "M"
        case l = "L"
        case g = "G"
        case v = "V"
        case s = "S"
        case n = "N"
        case q = "Q"
        case o = "O"
        case c = "C"
    }

    // MARK: - Fare
    struct Fare: DtoProtocol {
        public let type: TypeEnum
        public let amount: Double
        public let count: Int
        public let hasDiscount: Bool
        public let publishedFare: Double
        public let mandatorySeatFee: MandatorySeatFee?
        public let discountInPercent: Int
        public let hasPromoDiscount: Bool
        public let discountAmount: Int
    }

    // MARK: - MandatorySeatFee
    struct MandatorySeatFee: DtoProtocol {
        public let vat, amt, total, totalDiscount: Int
        public let totalWithoutDiscount: Int
        public let discountType: DiscountType
        public let code: Code
        public let qty: Int

        public enum Code: String, DtoProtocol {
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
        public let segmentNr: Int
        public let origin: String      // Airport Code
        public let destination: String // Airport Code
        public let flightNumber: String
        public let time, timeUTC: [String]
        public let duration: String
    }

}
