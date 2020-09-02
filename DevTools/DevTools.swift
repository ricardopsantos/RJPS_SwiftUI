//
//  Created by Ricardo Santos on 24/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public struct DevTools {
    
}

public extension DevTools {
    static var onRelease: Bool {
        return !onDebug
    }

    static var onDebug: Bool {
        #if DEBUG
        // For Simulator, and apps created with Xcode
        return true
        #else
        // For AppStore and Archive
        return false
        #endif
    }

    static var onSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }

    static var appMode: String? {
        #warning("finish")
        return (Bundle.main.infoDictionary?["BuildConfig_AppMode"] as? String)?.replacingOccurrences(of: "\\", with: "")
    }

    static var isProductionApp = appMode == "Debug.Prod"
    static var isQualityApp    = appMode == "Debug.QA"
    static var isStagingApp    = appMode == "Debug.Dev"
    static var isMockApp       = appMode == "Debug.Mock"

    static var isProductionReleaseApp: Bool {
        // Should return true, if is a Production app
        return isProductionApp && onRelease
    }

    static var devModeIsEnabled: Bool {
        if isProductionReleaseApp {
            return false
        }
        return onDebug || onSimulator
     }
}
