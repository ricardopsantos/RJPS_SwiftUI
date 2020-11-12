//
//  Created by Ricardo Santos on 22/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Network

public extension URLSession {

    // https://www.vadimbulavin.com/network-connectivity-on-ios-with-swift/
    static var defaultForConnectivity: URLSession {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.timeoutIntervalForResource = 300
        return URLSession(configuration: config)
    }
}
