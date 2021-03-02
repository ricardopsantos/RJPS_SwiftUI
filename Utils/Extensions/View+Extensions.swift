//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
//
import RJSLibUFAppThemes

public struct ViewExtensions: View {
    @State var text = "some sample text"
    let color = Color(UIColor.blue)
    let uiColor = UIColor.blue
    let lineWidth: CGFloat = 4
    let radius: CGFloat = 8
    public init() { }

    public var body: some View {
        ScrollView {
            Text("View+Extensions").font(.title).SwiftUIDebugPrint("Hi", $text, "Goodbye")
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
