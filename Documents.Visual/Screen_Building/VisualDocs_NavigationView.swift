//
//  Created by Ricardo Santos on 31/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// https://www.hackingwithswift.com/articles/216/complete-guide-to-navigationview-in-swiftui
//

extension V {
    struct ResultView: View {
        var choice: String
        var body: some View {
            Text("You chose \(choice)")
        }
    }
}

extension V {
    struct VisualDocs_NavigationView_A: View {
        var body: some View {
            NavigationView {
                VStack(spacing: 30) {
                    Text("You're going to flip a coin – do you want to choose heads or tails?")
                    NavigationLink(destination: V.ResultView(choice: "Heads")) {
                        Text("Choose Heads")
                    }
                    NavigationLink(destination: V.ResultView(choice: "Tails")) {
                        Text("Choose Tails")
                    }
                }
                .navigationBarTitle("Navigation")
                .navigationBarItems(leading: Button("leading") { }, trailing: Button("trailing") { })
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_NavigationView_A: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_NavigationView_A()
    }
}

extension V {
    struct VisualDocs_NavigationView_B: View {
        var body: some View {
            NavigationView {
                VStack(spacing: 30) {
                    Text("You're going to flip a coin – do you want to choose heads or tails?")
                    NavigationLink(destination: V.ResultView(choice: "Heads")) {
                        Text("Choose Heads")
                    }
                    NavigationLink(destination: V.ResultView(choice: "Tails")) {
                        Text("Choose Tails")
                    }
                }
                .navigationBarTitle("Navigation")
            }
        }
    }
}

struct VisualDocs_NavigationView_B: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_NavigationView_B()
    }
}
