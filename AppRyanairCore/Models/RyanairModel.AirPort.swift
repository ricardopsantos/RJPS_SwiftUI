//
//  Created by Ricardo Santos on 22/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension RyanairModel {
    struct AirPort: Identifiable {
        public var id: String { return code }
        public let name: String
        public let code: String

        public init(name: String, code: String) {
            self.name = name
            self.code = code
        }
    }
}

extension RyanairModel.AirPort: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(code)
        hasher.combine(name)
    }
}
