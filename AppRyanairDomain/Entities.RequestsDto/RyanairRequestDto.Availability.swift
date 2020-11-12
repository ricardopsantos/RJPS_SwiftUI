//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension RyanairRequestDto {
    struct Availability {
        public let origin: String
        public let destination: String
        public let dateout: String
        public let datein: String
        public let flexdaysbeforeout: String
        public let flexdaysout: String
        public let flexdaysbeforein: String
        public let flexdaysin: String
        public let adt: Int
        public let teen: Int
        public let chd: Int
        public let roundtrip: Bool
        public let ToUs: String

        public init(origin: String,
                    destination: String,
                    dateout: String,
                    datein: String,
                    flexdaysbeforeout: String,
                    flexdaysout: String,
                    flexdaysbeforein: String,
                    flexdaysin: String,
                    adt: Int,
                    teen: Int,
                    chd: Int,
                    roundtrip: Bool,
                    ToUs: String) {
            self.origin = origin
            self.destination = destination
            self.dateout = dateout
            self.datein = datein
            self.flexdaysbeforeout = flexdaysbeforeout
            self.flexdaysout = flexdaysout
            self.flexdaysbeforein = flexdaysbeforein
            self.flexdaysin = flexdaysin
            self.adt = adt
            self.teen = teen
            self.chd = chd
            self.roundtrip = roundtrip
            self.ToUs = ToUs
        }

        public static var sample: Availability {
            return Availability(origin: "DUB",
                                destination: "STN",
                                dateout: "2021-08-09",
                                datein: "",
                                flexdaysbeforeout: "3",
                                flexdaysout: "3",
                                flexdaysbeforein: "3",
                                flexdaysin: "3",
                                adt: 1,
                                teen: 1,
                                chd: 1,
                                roundtrip: true,
                                ToUs: "AGREED")
        }
    }
}
