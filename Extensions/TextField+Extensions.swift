//
//  Created by Ricardo Santos on 09/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit

public extension TextField {
    func applyDefaultLayout(padding: Int=1) -> some View {
        self.padding().border(Color.green, width: 1).padding()
    }
}
