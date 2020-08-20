//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension RyanairRequestDto {
    struct Availability {
        let origin: String
        let destination: String
        let dateout: String
        let datein: String
        let flexdaysbeforeout: String
        let flexdaysout: String
        let flexdaysbeforein: String
        let flexdaysin: String
        let adt: Int
        let teen: Int
        let chd: Int
        let roundtrip: Bool
        let ToUs: String

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
