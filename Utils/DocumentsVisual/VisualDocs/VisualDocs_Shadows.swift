//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Utils

struct VisualDocs_Shadows: View {
    var radius: CGFloat = 4.0
    var color: Color { Color.black }
    var baseView: some View { Circle().frame(width: 70, height: 70).foregroundColor(Color(UIColor.systemBlue)) }
    var body: some View {
        ScrollView {
            Text("Shadows").font(.title)
            Divider()
            baseView
            Text("No shadow").font(.footnote)
            Divider()
            baseView.shadow(color: color, radius: radius, x: 0, y: 2)
            Text(".shadow(color: color, radius: radius, x: 0, y: 2)").font(.footnote)
            Divider()
            baseView.shadow(color: color.opacity(0.3), radius: radius, x: 3, y: 3)
            Text(".shadow(color: color.opacity(0.3), radius: radius, x: 3, y: 3)").font(.footnote)
        }
    }
}

// MARK: - Preview

public struct VisualDocs_Shadows_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        VisualDocs_Shadows()
    }
}
