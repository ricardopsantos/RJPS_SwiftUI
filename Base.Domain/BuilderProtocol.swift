//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

public protocol BuilderProtocol {
    associatedtype T
    static func buildView() -> T
}
