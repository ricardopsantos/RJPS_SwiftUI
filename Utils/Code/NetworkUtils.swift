//
//  Created by Ricardo Santos on 22/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Network

// https://www.vadimbulavin.com/network-connectivity-on-ios-with-swift/
public typealias ConnectivityUtils = NetworkUtils
public struct NetworkUtils {
    private init() {
        monitor = NWPathMonitor()
        monitor.start(queue: .global())
    }
    public static var shared = NetworkUtils()
    public var monitor: NWPathMonitor!
    
    static func eval() {
        /*monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("back to online")
                // Indicate network status, e.g., back to online
            } else {
                print("offline mode")
                // Indicate network status, e.g., offline mode
            }
        }*/
    }
}
