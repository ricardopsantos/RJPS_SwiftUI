//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
//
import RJSLibUFAppThemes

public extension UIColor {
    struct View {
        public static let appDefaultBackground = Color(RJS_ColorPack3.background.color)
    }
    struct Stack {
        public static let debugColor = Color.clear
    }
    struct Button {
        public struct Default {
            public static let background      = Color(RJS_ColorPack3.primary.color)
            public static let foregroundColor = Color(RJS_ColorPack3.onPrimary.color)
        }
    }

}
