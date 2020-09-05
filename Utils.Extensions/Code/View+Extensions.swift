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

    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

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

public struct ViewExtensions: View {
    @State var text = "some sample text"
    let color = Color(UIColor.blue)
    let uiColor = UIColor.blue
    let lineWidth: CGFloat = 4
    let radius: CGFloat = 8
    public init() { }

    public var body: some View {
        ScrollView {
            Text("View+Extensions").font(.title)
            Divider()
            VStack(alignment: .center) {
                VStack {
                    Text("addCorner(color:lineWidth:padding)").font(.footnote)
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
                    Text("addOuterCornerOverlaying(color:radius:width:padding)").font(.footnote)
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
                Divider()
                VStack {
                    VStack {
                        Text("debugWithSimpleStroke").font(.footnote)
                        Spacer()
                        Text("Text").debugWithSimpleStroke()
                        Spacer()
                        TextField("TextField", text: $text).debugWithSimpleStroke()
                        Spacer()
                        Button(action: {}) { Text("Button") }.debugWithSimpleStroke()
                    }
                    Spacer()
                    VStack {
                        Text("debugWithDashedStroke").font(.footnote)
                        Spacer()
                        Text("Text").debugWithDashedStroke()
                        Spacer()
                        TextField("TextField", text: $text).debugWithDashedStroke()
                        Spacer()
                        Button(action: {}) { Text("Button") }.debugWithDashedStroke()
                    }
                    Spacer()
                    VStack {
                        Text("debugComposed").font(.footnote)
                        Spacer()
                        Text("Text").debugComposed()
                        Spacer()
                        TextField("TextField", text: $text).debugComposed()
                        Spacer()
                        Button(action: {}) { Text("Button") }.debugComposed()
                    }
                    Spacer()
                    VStack {
                        Text("debugComposed(color: .blue, width: 3)").font(.footnote)
                        Spacer()
                        Text("Text").debugComposed(color: .blue, width: 3)
                        Spacer()
                        TextField("TextField", text: $text).debugComposed(color: .blue, width: 3)
                        Spacer()
                        Button(action: {}) { Text("Button") }.debugComposed(color: .blue, width: 3)
                    }
                }
            }.padding()
        }
    }
}

public struct VisualDocs_ViewExtensions_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        ViewExtensions()
    }
}
