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

    func doIf <T: View>(_ condition: Bool, transform: (Self) -> T) -> some View {
        Group {
            if condition {
                transform(self)
            } else {
                self
            }
        }
    }

    func userInteractionEnabled(_ value: Bool) -> some View {
        self.disabled(value)
    }

    func rotate(degrees: Double) -> some View {
        self.rotationEffect(.degrees(degrees))
    }

    func alpha(_ some: Double) -> some View {
        self.opacity(some)
    }

    func textColor(_ color: Color) -> some View {
        self.foregroundColor(color)
    }

    func addCorner(color: Color, lineWidth: CGFloat, padding: Bool) -> some View {
        self
            .doIf(padding) {$0.padding(8) }
            .overlay(Capsule(style: .continuous).stroke(color, lineWidth: lineWidth).foregroundColor(Color.clear))
    }

    // Draw a corner, outside the View
    func addOuterCornerOverlaying(color: UIColor, radius: CGFloat = 3, width: CGFloat = 2, padding: Bool) -> some View {
        self
            .doIf(padding) {$0.padding(8) }
            .overlay(RoundedRectangle(cornerRadius: radius).addSimpleStroke(color: color, width: width))
    }

    func debugWithSimpleStroke(color: UIColor = .red, width: CGFloat=3) -> some View {
        self.overlay(RoundedRectangle(cornerRadius: 0).addSimpleStroke(color: color, width: width))
    }

    func debugWithDashedStroke(color: UIColor = .red, width: CGFloat=3, dashed: Bool=true) -> some View {
        self.overlay(RoundedRectangle(cornerRadius: 0).addDashedStroke(color: color, width: width))
    }

    func debugComposed(color: UIColor = .red, width: CGFloat=3) -> some View {
        self.debugWithDashedStroke(color: color, width: width).padding(width).debugWithSimpleStroke(color: color, width: width)
    }
}

public struct ExtensionsView: View {
    @State var text = "Maria"
    let color = Color(UIColor.blue)
    let uiColor = UIColor.blue
    let lineWidth: CGFloat = 4
    let radius: CGFloat = 8
    public init() {

    }
    public var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                VStack {
                    Text("addCorner(color:lineWidth:padding)").bold()
                    HStack {
                        Text("Text").addCorner(color: color, lineWidth: lineWidth, padding: false)
                        TextField("TextField", text: $text).addCorner(color: color, lineWidth: lineWidth, padding: false)
                        Button(action: {}) { Text("Button") }.addCorner(color: color, lineWidth: lineWidth, padding: false)
                    }
                    HStack {
                        Text("Text").addCorner(color: color, lineWidth: lineWidth, padding: true)
                        TextField("TextField", text: $text).addCorner(color: color, lineWidth: lineWidth, padding: true)
                        Button(action: {}) { Text("Button") }.addCorner(color: color, lineWidth: lineWidth, padding: true)
                    }
                }.padding()
                VStack {
                    Text("addOuterCornerOverlaying(color:radius:width:padding)").bold()
                    HStack {
                        Text("Text").addOuterCornerOverlaying(color: uiColor, radius: radius, width: lineWidth, padding: false)
                        TextField("TextField", text: $text).addOuterCornerOverlaying(color: uiColor, radius: radius, width: lineWidth, padding: false)
                        Button(action: {}) { Text("Button") }.addOuterCornerOverlaying(color: uiColor, radius: radius, width: lineWidth, padding: false)
                    }
                    HStack {
                        Text("Text").addOuterCornerOverlaying(color: uiColor, radius: radius, width: lineWidth, padding: true)
                        TextField("TextField", text: $text).addOuterCornerOverlaying(color: uiColor, radius: radius, width: lineWidth, padding: true)
                        Button(action: {}) { Text("Button") }.addOuterCornerOverlaying(color: uiColor, radius: radius, width: lineWidth, padding: true)
                    }
                }.padding()
                Spacer()
                VStack {
                    Text("debug...").bold()
                    HStack {
                        Text("Text").debugWithSimpleStroke()
                        TextField("TextField", text: $text).debugWithSimpleStroke()
                        Button(action: {}) { Text("Button") }.debugWithSimpleStroke()
                    }
                    HStack {
                        Text("Text").debugWithDashedStroke()
                        TextField("TextField", text: $text).debugWithDashedStroke()
                        Button(action: {}) { Text("Button") }.debugWithDashedStroke()
                    }
                    HStack {
                        Text("Text").debugComposed()
                        TextField("TextField", text: $text).debugComposed()
                        Button(action: {}) { Text("Button") }.debugComposed()
                    }
                }
            }.padding()
        }
    }
}

struct ExtensionsView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ExtensionsView()
    }
}
