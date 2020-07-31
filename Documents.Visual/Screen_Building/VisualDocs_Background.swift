//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Background_III: View {
        // https://stackoverflow.com/questions/57685679/how-to-change-background-color-of-the-navigationview-in-swiftui
        //For other NavigationBar changes, look here:(https://stackoverflow.com/a/57509555/5623035)
        init() { UINavigationBar.appearance().backgroundColor = .green }
        var body: some View {
            ZStack {
                Color.yellow
                NavigationView {
                    ZStack {
                        Color.blue
                        Text("Some text")
                    }
                }.background(Color.red)
            }
        }
    }
}

extension V {
    struct VisualDocs_Background_II: View {
        var body: some View {
            ZStack {
                Rectangle()                     // Shapes are resizable by default
                .foregroundColor(.clear)        // Making rectangle transparent
                    .background(LinearGradient(gradient: Gradient(colors: [.secondary, .white]), startPoint: .bottom, endPoint: .top)).edgesIgnoringSafeArea(.all)
            }
        }
    }
}

extension V {
    struct VisualDocs_Background_I: View {
        var body : some View {
            ZStack { Color.secondary.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .center, spacing: 10) {
                        Text("Some text")
                    }
                }
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
