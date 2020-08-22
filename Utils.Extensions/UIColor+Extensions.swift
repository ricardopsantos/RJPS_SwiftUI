//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

public extension UIColor {
    struct View {
        public static let appDefaultBackground = Color(UIColor.lightGray)
    }
    struct Stack {
        public static let debugColor = Color.clear
    }
    struct Button {
        public struct Default {
            public static let background      = Color.blue
            public static let foregroundColor = Color.white
        }
    }

    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        let safeHex = hex.hasPrefix("#") ? hex.uppercased() : "#\(hex.uppercased())"
        let start = safeHex.index(safeHex.startIndex, offsetBy: 1)
        let hexColor = String(safeHex[start...])
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            if hexColor.count == 8 {
                a = CGFloat(hexNumber & 0x000000ff) / 255
                self.init(red: r, green: g, blue: b, alpha: a)
            } else {
                self.init(red: r, green: g, blue: b, alpha: 1)
            }
            return
        }
        return nil
    }
}
