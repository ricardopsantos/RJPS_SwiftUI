//
//  Created by Ricardo Santos
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

    func userInteractionEnabled(_ value: Bool) -> some View {
        self.disabled(value)
    }

    func rotate(degrees: Double) -> some View {
        self.rotationEffect(.degrees(degrees))
    }

    func alpha(_ some: Double) -> some View {
        self.opacity(some)
    }

    @inlinable func textColor(_ color: Color?) -> some View {
        self.foregroundColor(color)
    }

    // Draw a corner, outside the View
    func addOuterCornerOverlaying(color: UIColor, radius: CGFloat = 3, width: CGFloat = 2) -> some View {
        self.padding().overlay(RoundedRectangle(cornerRadius: radius).addSimpleStroke(color: color, width: width))
    }

    func debugWithSimpleStroke(color: UIColor = .red, width: CGFloat=3) -> some View {
        self.overlay(RoundedRectangle(cornerRadius: 0).addSimpleStroke(color: color, width: width))
    }

    func debugWithDashedStroke(color: UIColor = .red, width: CGFloat=3, dashed: Bool=true) -> some View {
        self.overlay(RoundedRectangle(cornerRadius: 0).addDashedStroke(color: color, width: width))
    }

    func debug3(color: UIColor = .red, width: CGFloat=3) -> some View {
        self.debugWithDashedStroke(color: color, width: width).padding(width).debugWithSimpleStroke(color: color, width: width)
    }
}
