//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct VisualDocs_Shapes: View {
    let size_w: CGFloat = 50
    let size_h: CGFloat = 50
    var body: some View {
        ScrollView {
            Text("Shapes").font(.title)
            Divider()
            VStack {
                Text("offset").font(.headline)
                Circle().frame(width: size_w, height: size_h).foregroundColor(Color(UIColor.systemBlue))
                Circle().frame(width: size_w, height: size_h).foregroundColor(Color(UIColor.systemRed)).offset(y: size_h/2)
                Circle().frame(width: size_w, height: size_h).foregroundColor(Color(UIColor.systemYellow)).offset(x: -size_h/2)
            }
            Divider()
            VStack {
                Text("Shapes").font(.headline)
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
            .padding(.vertical, 10)
            .padding(.horizontal, 0)
        }
    }
}

// MARK: - Preview

public struct VisualDocs_Shapes_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        VisualDocs_Shapes()
        //Costa()
    }
}
