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

struct GeometryEffectTransitionsDemo: View {
    @State private var show = false
    var body: some View {
        return ZStack {
            Button("Open Booking") {
                withAnimation(.easeInOut(duration: 0.8)) {
                    self.show = true
                }
            }

            if show {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.pink).overlay(MyForm(show: $show))
                    .frame(width: 400, height: 500)
                    .shadow(color: .black, radius: 3)
                    .transition(.fly)
                    .zIndex(1)
            }
        }
    }
}

struct MyForm: View {
    @Binding var show: Bool
    @State private var departure = Date()
    @State private var checkin = Date()
    @State private var pets = true
    @State private var nonsmoking = true
    @State private var airport: Double = 7.3

    var body: some View {
        VStack {
            Text("Booking").font(.title).foregroundColor(.white)
            Form {
                DatePicker(selection: $departure, label: {
                    HStack {
                        Image(systemName: "airplane")
                        Text("Departure")
                    }
                })
                DatePicker(selection: $checkin, label: {
                    HStack {
                        Image(systemName: "house.fill")
                        Text("Check-In")
                    }
                })
                Toggle(isOn: $pets, label: { HStack { Image(systemName: "hare.fill"); Text("Have Pets") } })
                Toggle(isOn: $nonsmoking, label: { HStack { Image(systemName: "nosign"); Text("Non-Smoking") } })
                Text("Max Distance to Airport \(String(format: "%.2f", self.airport as Double)) km")
                Slider(value: $airport, in: 0...10) { EmptyView() }
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.show = false
                    }
                }) {
                    HStack { Spacer(); Text("Save"); Spacer() }
                }

            }
        }.padding(20)
    }
}

extension AnyTransition {
    static var fly: AnyTransition { get {
        AnyTransition.modifier(active: FlyTransition(pct: 0), identity: FlyTransition(pct: 1))
        }
    }
}

struct FlyTransition: GeometryEffect {
    var pct: Double
    var animatableData: Double {
        get { pct }
        set { pct = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let rotationPercent = pct
        let a = CGFloat(Angle(degrees: 90 * (1-rotationPercent)).radians)
        var transform3d = CATransform3DIdentity;
        transform3d.m34 = -1/max(size.width, size.height)
        transform3d = CATransform3DRotate(transform3d, a, 1, 0, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)
        let affineTransform1 = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))
        let affineTransform2 = ProjectionTransform(CGAffineTransform(scaleX: CGFloat(pct * 2), y: CGFloat(pct * 2)))
        if pct <= 0.5 {
            return ProjectionTransform(transform3d).concatenating(affineTransform2).concatenating(affineTransform1)
        } else {
            return ProjectionTransform(transform3d).concatenating(affineTransform1)
        }
    }
}

struct VisualDocs_SwiftUI_Lab_GeometryEffectTransitionsDemo: PreviewProvider {
    static var previews: some View {
        GeometryEffectTransitionsDemo()
    }
}
