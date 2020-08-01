//
//  Created by Ricardo Santos on 31/07/2020.
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

extension V {
    struct ChangeView_VisualDocs_EnvironmentObject_I_Details_2: View {
        @EnvironmentObject var someEnvironmentObjectB: ObservableObjectClass
        var body: some View {
            VStack {
                Text("Score: \(someEnvironmentObjectB.somePublishedVar)")
                Button("Tap Increase") { self.someEnvironmentObjectB.somePublishedVar += 1 }
            }
        }
    }
}

extension V {
    struct ChangeView_VisualDocs_EnvironmentObject_I_Details_1: View {
        @EnvironmentObject var someEnvironmentObjectB: ObservableObjectClass
        var body: some View {
            VStack {
                Text("Score: \(someEnvironmentObjectB.somePublishedVar)")
                Button("Tap Increase") { self.someEnvironmentObjectB.somePublishedVar += 1 }
            }
        }
    }
}

extension V {
    struct VisualDocs_EnvironmentObject_I: View {
        @ObservedObject var someObservedObject = ObservableObjectClass()
        var body: some View {
            NavigationView {
                VStack(spacing: 30) {
                    Text("Score: \(someObservedObject.somePublishedVar)")
                    NavigationLink(destination: V.ChangeView_VisualDocs_EnvironmentObject_I_Details_1()) {
                        Text("Show Detail View 1")
                    }
                    NavigationLink(destination: V.ChangeView_VisualDocs_EnvironmentObject_I_Details_2()) {
                        Text("Show Detail View 2")
                    }
                }
            }
            .environmentObject(someObservedObject)
        }
    }
}

struct VisualDocs_EnvironmentObject_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_EnvironmentObject_I()
    }
}
