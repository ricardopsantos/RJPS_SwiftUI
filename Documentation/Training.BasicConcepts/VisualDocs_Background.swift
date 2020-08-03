//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

private var baseColor: UIColor = UIColor.green

private var background_I: some View {
    Color(baseColor).edgesIgnoringSafeArea(.all)
}
private var background_II: some View {
    Rectangle()                     // Shapes are resizable by default
    .foregroundColor(.clear)        // Making rectangle transparent
        .background(LinearGradient(gradient: Gradient(colors: [Color(baseColor), .white]), startPoint: .bottom, endPoint: .top)).edgesIgnoringSafeArea(.all)
}
private var background_III: some View {
    background_I
}

private var sampleBody: some View {
    ScrollView {
        VStack(alignment: .center, spacing: 10) {
            Text("Some text")
        }
    }
}

extension V {
    struct VisualDocs_Background_III: View {
        // https://stackoverflow.com/questions/57685679/how-to-change-background-color-of-the-navigationview-in-swiftui
        // For other NavigationBar changes, look here:(https://stackoverflow.com/a/57509555/5623035)
        init() { UINavigationBar.appearance().backgroundColor = baseColor }
        var body: some View {
            ZStack {
                background_III
                NavigationView {
                    ZStack {
                        background_III
                        sampleBody
                    }
                }
            }
        }
    }
}

extension V {
    struct VisualDocs_Background_II: View {
        var body: some View {
            ZStack {
                background_II
                sampleBody
            }
        }
    }
}

extension V {
    struct VisualDocs_Background_I: View {
        var body : some View {
            ZStack {
                background_I
                sampleBody
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Background_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Background_I()
    }
}

struct VisualDocs_Background_II: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Background_II()
    }
}

struct VisualDocs_Background_III: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Background_III()
    }
}
