//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-different-layouts-using-size-classes

extension V {
    struct VisualDocs_horizontalSizeClass: View {
        @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

        var body: some View {
            if horizontalSizeClass == .compact {
                return Text("Compact")
            } else {
                return Text("Regular")
            }
        }
    }
}

struct VisualDocs_horizontalSizeClass: PreviewProvider {
    static var previews: some View {
        return V.VisualDocs_horizontalSizeClass()
    }
}
