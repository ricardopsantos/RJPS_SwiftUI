//
//  Created by Ricardo Santos on 09/05/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension DevTools {
    enum FeatureFlag: String, CaseIterable {

        case devTeam_useMockedData     = "Use Mock Data"
        case showDebugStatsViewOnView  = "Show Stats View"
        case appLogsEnabled            = "Logs: enabled"
        case debugRequests             = "If [true] log API requests"

        case showScene_carTrack    = "Scene Enabled: Exam.CarTrack"

        // Default value
        public var defaultValue: Bool {
            switch self {
            case .appLogsEnabled:           return DevTools.devModeIsEnabled
            case .showDebugStatsViewOnView: return DevTools.devModeIsEnabled
            case .devTeam_useMockedData:    return false
            case .debugRequests:            return false

            case .showScene_carTrack:    return true
            }
        }

        // If FF is visible is visible on DebugScreen to be changed
        public var isVisible: Bool {
             switch self {
             case .devTeam_useMockedData:    return true
             case .appLogsEnabled:           return true
             case .showDebugStatsViewOnView: return true
             case .debugRequests:            return true

             case .showScene_carTrack:       return true
            }
        }

        public var isTrue: Bool {
            return FeatureFlag.getFlag(self)
        }

        public static func getFlag(_ flagName: FeatureFlag) -> Bool {
            let defaultValue = flagName.defaultValue
            guard !DevTools.isProductionReleaseApp else {
                // If production then we need to get the default value
                return defaultValue
            }

            if let value = UserDefaults.standard.string(forKey: flagName.rawValue), value.count > 0 {
                return value == "\(true)"
            }
            return false

        }

        public static func setFlag(_ flagName: FeatureFlag, value: Bool) {
            UserDefaults.standard.set("\(value)", forKey: flagName.rawValue)
        }
    }
}
