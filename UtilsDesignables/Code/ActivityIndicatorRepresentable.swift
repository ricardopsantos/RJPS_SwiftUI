//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

//
// More samples @ https://medium.com/better-programming/activity-indicators-in-swiftui-17b66e6c0137
//

public struct ActivityIndicator_V1: UIViewRepresentable {
    public var isAnimating: Bool
    public init(isAnimating: Bool) {
        self.isAnimating = isAnimating
    }
    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    public func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

public struct ActivityIndicator_V2: View {
    @State var isDoingAnimation: Bool = false
    @Binding var isAnimating: Bool
    public init(isAnimating: Binding<Bool>) {
        // https://stackoverflow.com/questions/56973959/swiftui-how-to-implement-a-custom-init-with-binding-variables
        self._isAnimating = isAnimating // beta 4
    }
    public var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                Group {
                    Circle()
                    .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
                    .scaleEffect(!self.isDoingAnimation ? 1 - CGFloat(index) / 5 : 0.2 + CGFloat(index) / 5)
                    .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .rotationEffect(!self.isDoingAnimation ? .degrees(0) : .degrees(360))
                .animation(Animation
                .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                .repeatForever(autoreverses: false))
            }
        }
        .frame(width: 75, height: 75)
        .foregroundColor(Color.secondary)
        .aspectRatio(1, contentMode: .fit)
        .onAppear { self.isDoingAnimation = true }
        .opacity(isAnimating ? 1 : 0)
    }
}

public struct ActivityIndicator_V3<Content>: View where Content: View {
    @Binding public var isAnimating: Bool
    @Binding public var message: String
    var content: (() -> Content)?
    public init(isAnimating: Binding<Bool>, message: Binding<String>, content: @escaping () -> Content) {
        // https://stackoverflow.com/questions/56973959/swiftui-how-to-implement-a-custom-init-with-binding-variables
        self._isAnimating = isAnimating // beta 4
        self._message = message
        self.content = content
    }
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content?().disabled(self.isAnimating).blur(radius: self.isAnimating ? 3 : 0)
                VStack {
                    Text(self.message)
                    ActivityIndicator_V2(isAnimating: .constant(true)).frame(width: 50, height: 50)
                }
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isAnimating ? 1 : 0)
            }
        }
    }
}

// MARK: - Previews

public struct ActivityIndicator_V1_Preview: PreviewProvider {
    public static var previews: some View {
        ZStack {
            Designables_View().disabled(true).blur(radius: true ? 3 : 0)
            ActivityIndicator_V1(isAnimating: true)
        }
    }
}

public struct ActivityIndicator_V2_Preview: PreviewProvider {
    public static var previews: some View {
        ZStack {
            Designables_View().disabled(true).blur(radius: true ? 3 : 0)
            ActivityIndicator_V2(isAnimating: .constant(true)).frame(width: 75, height: 75)
        }
    }
}

public struct ActivityIndicator_V3_Preview: PreviewProvider {
    public static var previews: some View {
        ActivityIndicator_V3(isAnimating: .constant(true), message: .constant("Loading"), content: {
            Designables_View()
        })
    }
}

public struct VisualDocs_ActivityIndicatorX_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        TabView {
            ActivityIndicator_V1_Preview.previews.tabItem({ Text("1") })
            ActivityIndicator_V2_Preview.previews.tabItem({ Text("2") })
            ActivityIndicator_V3_Preview.previews.tabItem({ Text("3") })
        }
    }
}
