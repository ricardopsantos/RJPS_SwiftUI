//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

var visualDocs_Published_Intro: String = """
@Published is one of the most useful property wrappers in SwiftUI, allowing us to create observable objects that automatically announce when changes occur.
"""

struct VisualDocs_Published_Intro: View {
    var body: some View {
        ScrollView {
            Text(visualDocs_Published_Intro)
        }.padding()
    }
}

class UserX: ObservableObject {
    @Published var score = 0
}

struct ChangeView_VisualDocs_Published_I: View {
    @EnvironmentObject var user: UserX
    var body: some View {
        VStack {
            Text("Score: \(user.score)")
            Button("Increase") {
                self.user.score += 1
            }
        }
    }
}

struct VisualDocs_Published_I: View {
    @ObservedObject var user = UserX()

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Score: \(user.score)")
                NavigationLink(destination: ChangeView_VisualDocs_Published_I()) {
                    Text("Show Detail View")
                }
            }
        }
        .environmentObject(user)
    }
}
/*
struct Published_I_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_Published_I()
    }
}*/

struct VisualDocs_Published_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        TabView {
            VisualDocs_Published_Intro().tabItem({ Text("Into") })
            VisualDocs_Published_I().tabItem({ Text("1") })
        }
    }
}
