//
//  Created by Ricardo Santos on 24/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import os.log

public extension OSLog {
    fileprivate static let myApp = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "com.rjps.devtools")
}

// Avoiding [import os.log] everywhere
public enum LogType {
    case `default`
    case info
    case debug
    case error
    case fault
}

public extension DevTools {

    static func log(debug: String) { DevTools.log(debug, type: .debug) }
    static func log(info: String) { DevTools.log(info, type: .info) }
    static func log(error: String) { DevTools.log(error, type: .error) }

    static func log(_ message: String, type: LogType = .default, function: String = #function) {
        let whereWasIt = function
        let finalMessage = "[\(whereWasIt)] : [\(message)]"
        switch type {
        case .default: os_log("%{public}@", log: OSLog.myApp, type: .default, finalMessage)
        case .info: os_log("%{public}@", log: OSLog.myApp, type: .info, finalMessage)
        case .debug: os_log("%{public}@", log: OSLog.myApp, type: .debug, finalMessage)
        case .error: os_log("%{public}@", log: OSLog.myApp, type: .error, finalMessage)
        case .fault: os_log("%{public}@", log: OSLog.myApp, type: .fault, finalMessage)
        }
    }

}
