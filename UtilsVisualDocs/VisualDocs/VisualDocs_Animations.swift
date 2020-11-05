//
//  Created by Ricardo Santos on 31/10/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// https://medium.com/better-programming/2-must-know-protocols-for-swiftui-animation-cd50bf38895e
//
// The 2 Must-Know Protocols for SwiftUI Animation
// (Animatable and AnimatableModifier are essentials to create SwiftUI animations)
//

//
// A: -------------------------------------------------------
//

struct VisualDocs_Animations_A: View {
    @State private var progress: CGFloat = 0.0

    var body: some View {
        ZStack {
            Circle() // Inactive
                .stroke(lineWidth: 6)
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemGray6))

            Rectangle()
                .frame(width: 24, height: 24)
                .foregroundColor(Color(.systemIndigo))
                .cornerRadius(2)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemIndigo))
                .rotationEffect(.degrees(-90))
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 0, z: 0))
                .animation(Animation.easeInOut.speed(0.25))
                .onAppear() {
                    self.progress = 1
                }
        }
    }
}

struct VisualDocs_Animations_A_PreviewProvider: PreviewProvider {
    static var previews: some View {
        return VisualDocs_Animations_A()
    }
}

//
// B: -------------------------------------------------------
//


struct AnimatableCircle_B: Shape {
    var progress: CGFloat

    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    func path(in rect: CGRect) -> Path {
        let centerX: CGFloat = rect.width / 2
        let centerY: CGFloat = rect.height / 2
        var path = Path()
        path.addArc(center: CGPoint(x: centerX, y: centerY),
                    radius: 45,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 360 * Double(progress)),
                    clockwise: false)
        return path
    }
}

struct VisualDocs_Animations_B: View {
    @State private var progress: CGFloat = 0.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 6)
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemGray6))

            Rectangle()
                .frame(width: 24, height: 24)
                .foregroundColor(Color(.systemIndigo))
                .cornerRadius(2)

            AnimatableCircle_B(progress: progress)
                .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemIndigo))
                .animation(Animation.easeInOut.speed(0.25))
                .onAppear() {
                    self.progress = 1
                }
        }
    }
}

struct VisualDocs_Animations_B_PreviewProvider: PreviewProvider {
    static var previews: some View {
        return VisualDocs_Animations_B()
    }
}


struct AnimatableCircle_C: Shape {
    var progress: CGFloat

    func path(in rect: CGRect) -> Path {
        let centerX: CGFloat = rect.width / 2
        let centerY: CGFloat = rect.height / 2
        var path = Path()
        path.addArc(center: CGPoint(x: centerX, y: centerY),
                    radius: rect.width / 2,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 360 * Double(progress)),
                    clockwise: false)
        return path.strokedPath(.init(lineWidth: 6, lineCap: .round, lineJoin: .round))
    }
}

//
// C: -------------------------------------------------------
//

struct Animations_C_TextView: View {
    var progress: CGFloat = 0

    var body: some View {
        Text("\(Int(progress * 100)) %")
            .font(.headline)
            .foregroundColor(Color(.systemIndigo))
            .transition(.opacity)
            .id(progress.description)
    }
}

struct VisualDocs_Animations_C_AnimatableModifier: AnimatableModifier {
    var progress: CGFloat = 0

    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBackground))
            .overlay(AnimatableCircle_C(progress: progress).foregroundColor(Color(.systemIndigo)))
            .overlay(Animations_C_TextView(progress: progress))
    }
}

struct VisualDocs_Animations_C: View {
    @State private var progress: CGFloat = 0.0

    var body: some View {
        ZStack {
            Circle() // Inactive
                .stroke(lineWidth: 6)
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemGray6))

            Circle()
                .frame(width: 90, height: 90)
                .modifier(VisualDocs_Animations_C_AnimatableModifier(progress: progress))
                .animation(Animation.linear.speed(0.25))
                .onAppear() {
                    self.progress = 1
                }
        }
    }
}

struct VisualDocs_Animations_C_PreviewProvider: PreviewProvider {
    static var previews: some View {
        return VisualDocs_Animations_C()
    }
}
