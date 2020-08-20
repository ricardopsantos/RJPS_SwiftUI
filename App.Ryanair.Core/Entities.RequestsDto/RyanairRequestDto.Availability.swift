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

        static var sample: Availability {
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
