//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

struct SomeIdentifiableStruct: Identifiable {
    var id: String { return someParam }
    let someParam: String
}
