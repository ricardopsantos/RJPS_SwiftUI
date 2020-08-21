//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// @EnvironmentObject is a data model which, once initialised, can share data to all view’s of your app
//

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

struct VisualDocs_EnvironmentObject_I_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_EnvironmentObject_I()
    }
}
