//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

var visualDocs_EnvironmentObject_Intro: String = """
Binding is a property wrapper type that can read and write a value owned by a source of truth. We have several possible types of sources of truth in SwiftUI.

It can be EnvironmentObject, ObservedObject or State. All these property wrappers provide a projected value, which is binding.

@EnvironmentObject is a data model which, once initialised, can share data to all view’s of your app
"""

// MARK: - VisualDocs_Binding_State_I

struct VisualDocs_EnvironmentObject_Intro: View {
    var body: some View {
        ScrollView {
            Text(visualDocs_EnvironmentObject_Intro)
        }.padding()
    }
}

// MARK: -

class ObservableObjectClass: ObservableObject {
    @Published var somePublishedVar = 0
}

struct ChangeView_VisualDocs_EnvironmentObject_I_Details_2: View {
    @EnvironmentObject var someEnvironmentObjectB: ObservableObjectClass
    var body: some View {
        VStack {
            Text("Score: \(someEnvironmentObjectB.somePublishedVar)")
            Button("Tap Increase") { self.someEnvironmentObjectB.somePublishedVar += 1 }
        }
    }
}

struct ChangeView_VisualDocs_EnvironmentObject_I_Details_1: View {
    @EnvironmentObject var someEnvironmentObjectB: ObservableObjectClass
    var body: some View {
        VStack {
            Text("Score: \(someEnvironmentObjectB.somePublishedVar)")
            Button("Tap Increase") { self.someEnvironmentObjectB.somePublishedVar += 1 }
        }
    }
}

struct VisualDocs_EnvironmentObject_I: View {
    @ObservedObject var someObservedObject = ObservableObjectClass()
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Score: \(someObservedObject.somePublishedVar)")
                NavigationLink(destination: ChangeView_VisualDocs_EnvironmentObject_I_Details_1()) {
                    Text("Show Detail View 1")
                }
                NavigationLink(destination: ChangeView_VisualDocs_EnvironmentObject_I_Details_2()) {
                    Text("Show Detail View 2")
                }
            }
        }
        .environmentObject(someObservedObject)
    }
}
/*
struct EnvironmentObject_I_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_EnvironmentObject_I()
    }
}*/

struct VisualDocs_EnvironmentObject_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        TabView {
            VisualDocs_EnvironmentObject_Intro().tabItem({ Text("Into") })
            VisualDocs_EnvironmentObject_I().tabItem({ Text("1") })
        }
    }
}
