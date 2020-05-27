//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

typealias V = AppView
struct AppView { private init() {} }

typealias M = Model
struct Model { private init() {} }

extension UIColor {
    struct View {
        static let appDefaultBackground = Color.gray
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

extension Image {
    static let cloud = Image(systemName: "cloud.heavyrain.fill")
}

struct SomeIdentifiableStruct: Identifiable {
    var id: String { return someParam }
    let someParam: String
}
