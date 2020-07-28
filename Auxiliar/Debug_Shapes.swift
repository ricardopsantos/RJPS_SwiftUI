//
//  Created by Ricardo Santos on 28/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct DebugShapes: View {
        let size_w: CGFloat = 50
        let size_h: CGFloat = 50
        var body: some View {
            ScrollView {
                VStack {
                    Text("offset").font(.largeTitle)
                    Circle().frame(width: size_w, height: size_h).foregroundColor(Color(UIColor.systemBlue))
                    Circle().frame(width: size_w, height: size_h).foregroundColor(Color(UIColor.systemRed)).offset(y: size_h/2)
                    Circle().frame(width: size_w, height: size_h).foregroundColor(Color(UIColor.systemYellow)).offset(x: -size_h/2)
                }
                Divider()
                VStack {
                    Text("Shapes").font(.largeTitle)
                    Text("Circle").font(.footnote)
                    Circle().frame(width: size_w, height: size_h).foregroundColor(Color(UIColor.systemBlue))
                    Text("Capsule").font(.footnote)
                    HStack {
                        Capsule(style: .circular).frame(width: size_w, height: size_h * 2).foregroundColor(Color(UIColor.green))
                        Capsule(style: .circular).frame(width: size_w * 2, height: size_h).foregroundColor(Color(UIColor.green))
                        Capsule(style: .continuous).frame(width: size_w, height: size_h * 2).foregroundColor(Color(UIColor.green))
                        Capsule(style: .continuous).frame(width: size_w * 2, height: size_h).foregroundColor(Color(UIColor.green))
                    }
                    Text("Rectangle").font(.footnote)
                    HStack {
                        Rectangle().frame(width: size_w, height: size_h).foregroundColor(Color(UIColor.systemTeal))
                        Rectangle().frame(width: size_w, height: size_h).foregroundColor(Color(UIColor.systemTeal)).cornerRadius(15)
                    }
                }
                Divider()
                VStack {
                    Text("Regular Text")

                }
                .padding(.vertical, 10)
                .padding(.horizontal, 0)
            }
        }
    }
}

extension V {
    struct Costa: View {
        let size_w: CGFloat = 50
        let size_h: CGFloat = 50
        var body: some View {
            ScrollView {
                Divider()
                VStack {
                    Text("E os flicks?").font(.largeTitle)
                    HStack {
                        Circle().frame(width: size_w*2, height: size_h*2).foregroundColor(Color(UIColor.systemPink)).offset(y: 10)
                        Circle().frame(width: 10, height: 10).foregroundColor(Color(UIColor.darkGray)).offset(x: -40)
                        Circle().frame(width: 10, height: 10).foregroundColor(Color(UIColor.darkGray)).offset(x: -40)
                    }
                    HStack {
                        Capsule(style: .circular).frame(width: size_w * 2, height: size_h*0.5).foregroundColor(Color(UIColor.systemPink)).offset(x: size_h*0.3).offset(y: -20)
                        Capsule(style: .continuous).frame(width: size_w*1.5, height: size_h * 2).foregroundColor(Color(UIColor.lightGray))
                        Capsule(style: .continuous).frame(width: size_w * 2, height: size_h*0.5).foregroundColor(Color(UIColor.systemPink)).offset(x: -size_h*0.3).offset(y: -50).rotationEffect(.degrees(-20))
                    }
                    HStack {
                        Capsule(style: .continuous).frame(width: size_w*0.8, height: size_h * 2).foregroundColor(Color(UIColor.darkGray)).offset(y: -20).offset(x: -10).rotationEffect(.degrees(10))
                        Capsule(style: .continuous).frame(width: size_w*0.8, height: size_h *  2).foregroundColor(Color(UIColor.darkGray)).offset(y: -20).offset(x: 10).rotationEffect(.degrees(-10))
                    }
                }
            }
        }
    }
}

// MARK: - Preview

struct DebugShapes: PreviewProvider {
    static var previews: some View {
        V.DebugShapes()
        //V.Costa()
    }
}
