//
//  Created by Ricardo Santos on 12/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct ScrollEffect3D: View {
    var colors: [Color]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 230) {
                ForEach(colors, id: \.self) { color in
                    GeometryReader { geometry in
                        Rectangle()
                            .foregroundColor(color)
                            .frame(width: 200, height: 300, alignment: .center)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                    }
                }
            }.padding(.horizontal, 210)
        }
    }
}

struct ScrollEffect3D_PreviewProvider: PreviewProvider {
    static var previews: some View {
        let colors = [Color.pink, Color.red, Color.blue, Color.orange]
        return ScrollEffect3D(colors: colors)
    }
}
