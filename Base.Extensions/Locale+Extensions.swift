//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension Locale {
    static var backendDefault: Locale {
        return Locale(identifier: "en")
    }

    var shortIdentifier: String {
        return String(identifier.prefix(2))
    }
}
