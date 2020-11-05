//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

public extension Subscribers.Completion {
    var error: Failure? {
        switch self {
        case let .failure(error): return error
        default: return nil
        }
    }
}
