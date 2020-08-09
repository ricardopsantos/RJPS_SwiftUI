//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// https://github.com/swiftui-lab
// https://swiftui-lab.com
//

struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

enum Direction: Double {
    case down = 0
    case left = 90
    case up = 180
    case right = 270
}

struct VisualDocs_SwiftUI_Lab_Triangle: View {
    let direction: Direction
    let color: Color
    init(_ direction: Direction = .down, _ color: Color = .black) {
        self.direction = direction
        self.color = color
    }

    var body: some View {
        TriangleShape().fill(color).border(Color.black).rotationEffect(Angle.degrees(direction.rawValue))
    }
}

// MARK: - Preview VisualDocs_ReactingEvents

struct VisualDocs_SwiftUI_Lab_Triangle_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_SwiftUI_Lab_Triangle()
    }
}
