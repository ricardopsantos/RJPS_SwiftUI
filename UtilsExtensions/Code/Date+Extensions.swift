//
//  Created by Ricardo Santos on 22/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension Date {
    static func with(string: String, dateFormat: String="yyyy-MM-dd'T'HH:mm.ss.000Z") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = dateFormat
        if let date = dateFormatter.date(from: string) {
            return date
        } else {
            print("Fail converting [\(string)]")
            return Date()
        }
    }
}
