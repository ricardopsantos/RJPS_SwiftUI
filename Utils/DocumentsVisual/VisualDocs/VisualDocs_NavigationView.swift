//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// https://www.hackingwithswift.com/articles/216/complete-guide-to-navigationview-in-swiftui
//

struct ResultView: View {
    var choice: String
    var body: some View {
        Text("You chose \(choice)")
    }
}

struct VisualDocs_NavigationView_A: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("You're going to flip a coin – do you want to choose heads or tails?")
                NavigationLink(destination: ResultView(choice: "Heads")) {
                    Text("Choose Heads")
                }
                NavigationLink(destination: ResultView(choice: "Tails")) {
                    Text("Choose Tails")
                }
            }
            .navigationBarTitle("NavigationView with BarItems")
            .navigationBarItems(leading: Button("<") { print("leading tap") }, trailing: Button(">") { print("leading tap") })
        }
    }
}

// MARK: - Preview

public struct VisualDocs_VisualDocs_NavigationView_A_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        VisualDocs_NavigationView_A()
    }
}
