//
//  Created by Ricardo Santos on 12/06/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

public extension Shape {
    func addSimpleStroke(color: UIColor, width: CGFloat) -> some View {
        self.stroke(Color(color), lineWidth: width)
    }
}

public extension RoundedRectangle {
    func addDashedStroke(color: UIColor, width: CGFloat) -> some View {
        self.strokeBorder(style: StrokeStyle(lineWidth: width, dash: [15])).foregroundColor(Color(color))
    }
}

public extension View {
    @inlinable func textColor(_ color: Color?) -> some View {
        self.foregroundColor(color)
    }

    func addCorner(color: UIColor, radius: CGFloat, width: CGFloat = 2) -> some View {
        self.padding().overlay(RoundedRectangle(cornerRadius: radius).addSimpleStroke(color: color, width: width))
    }

    func debug1(color: UIColor = .red, width: CGFloat=3) -> some View {
        self.overlay(RoundedRectangle(cornerRadius: 0).addSimpleStroke(color: color, width: width))
    }

    func debug2(color: UIColor = .red, width: CGFloat=3, dashed: Bool=true) -> some View {
        self.overlay(RoundedRectangle(cornerRadius: 0).addDashedStroke(color: color, width: width))
    }

    func debug3(color: UIColor = .red, width: CGFloat=3) -> some View {
        self.debug2(color: color, width: width).padding(width).debug1(color: color, width: width)
    }
}
