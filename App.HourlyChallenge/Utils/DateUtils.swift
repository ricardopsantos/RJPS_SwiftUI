//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import MessageUI

extension Date {
    static var dayOfWeek: Int? {
        // Friday -> 6
        return Calendar.current.dateComponents([.weekday], from: Date()).weekday
    }

    static func serverTime(timeZone: Int) -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 60 * 60 * timeZone)
        formatter.dateFormat = "MMMM-dd-yyyy HH:mm:ss"
        let datetime = formatter.string(from: now)
        return "\(datetime)"
    }

    var formated: String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM-dd-yyyy HH:mm:ss"
        let datetime = formatter.string(from: now)
        return "\(datetime)"
    }

    static func getUserHour(diff: Int) -> String {
        let calendar = Calendar.current
        let date1 = Date()
        let date2 = calendar.date(byAdding: .hour, value: diff, to: date1)
        let hour = calendar.component(.hour, from: date2!)
        if hour < 10 {
            return "0\(hour)"
        } else {
            return "\(hour)"
        }
    }

}
