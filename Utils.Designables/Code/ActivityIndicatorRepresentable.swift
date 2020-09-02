//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

public struct LoadingView<Content>: View where Content: View {
    @Binding public var isAnimating: Bool
    var content: (() -> Content)?
    public init(isAnimating: Binding<Bool>, content: @escaping () -> Content) {
        // https://stackoverflow.com/questions/56973959/swiftui-how-to-implement-a-custom-init-with-binding-variables
        self._isAnimating = isAnimating // beta 4
        self.content = content
    }
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content?().disabled(self.isAnimating).blur(radius: self.isAnimating ? 3 : 0)
                VStack {
                    Text("Loading...")
                    //ActivityIndicator_V1(isAnimating: true)
                    //ActivityIndicator_V2(isAnimating: .constant(true), style: .large)
                    ActivityIndicator_V3(isAnimating: .constant(true)).frame(width: 50, height: 50)
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

public struct ActivityIndicator_V3: View {
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

public struct ActivityIndicator_V2: UIViewRepresentable {
    @State public var isAnimating: Bool = false
    public init(isAnimating: Bool) {
        self.isAnimating = isAnimating
    }
    var style: UIActivityIndicatorView.Style = .large
    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicator_V2>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator_V2>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

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

// MARK: - Previews

struct ActivityIndicator_V1_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Designables_View()
            ActivityIndicator_V1(isAnimating: true)
        }
    }
}

struct ActivityIndicator_V2_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Designables_View()
            ActivityIndicator_V2(isAnimating: true)
        }
    }
}

struct ActivityIndicator_V3_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Designables_View()
            ActivityIndicator_V3(isAnimating: .constant(true)).frame(width: 75, height: 75)
        }
    }
}

struct ActivityIndicator_LoadingView_Preview: PreviewProvider {
    static var previews: some View {
        LoadingView(isAnimating: .constant(true), content: {
            Designables_View()
        })
    }
}
