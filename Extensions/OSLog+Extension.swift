//
//  Created by Ricardo Santos on 05/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import os.log

// Avoiding [import os.log] everywere
public enum LogType {
    case `default`
    case info
    case debug
    case error
    case fault
}

public func os_log(_ message: String, type: LogType = .default) {
    switch type {
    case .default: os_log("%{public}@", log: OSLog.myApp, type: .default, message)
    case .info: os_log("%{public}@", log: OSLog.myApp, type: .info, message)
    case .debug: os_log("%{public}@", log: OSLog.myApp, type: .debug, message)
    case .error: os_log("%{public}@", log: OSLog.myApp, type: .error, message)
    case .fault: os_log("%{public}@", log: OSLog.myApp, type: .fault, message)
    }
}

public extension OSLog {
    fileprivate static var subsystem = Bundle.main.bundleIdentifier!
    fileprivate static let myApp = OSLog(subsystem: subsystem, category: "com.rjps.swiftui")
}
