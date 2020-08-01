//
//  UIColor+Extensions.swift
//  RJPS_SwiftUI
//
//  Created by Ricardo Santos on 12/06/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension UIColor {
    struct View {
        static let appDefaultBackground = Color(UIColor.lightGray)
    }
    struct Stack {
        static let debugColor = Color.clear
    }
    struct Button {
        struct Default {
            static let background      = Color.blue
            static let foregroundColor = Color.white
        }
    }
}
