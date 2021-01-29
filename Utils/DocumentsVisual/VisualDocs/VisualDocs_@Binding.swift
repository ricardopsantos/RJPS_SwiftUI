//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// https://developer.apple.com/documentation/swiftui/binding
//

var visualDocs_Binding_Intro: String = """
Use a binding to create a two-way connection between a property that stores data, and a view that displays and changes the data.

A binding connects a property to a source of truth stored elsewhere, instead of storing data directly.

For example, a button that toggles between play and pause can create a binding to a property of its parent view using the Binding property wrapper.
"""

// MARK: - VisualDocs_Binding_State_I

struct VisualDocs_Binding_Intro: View {
    var body: some View {
        ScrollView {
            Text(visualDocs_Binding_Intro)
        }.padding()
    }
}

struct PlayButton: View {
    @Binding var bindingVar2: Bool
    var body: some View {
        Button(action: { self.bindingVar2.toggle() }) {
            Image(systemName: bindingVar2 ? "pause.circle" : "play.circle")
                .resizable().frame(width: 50, height: 50, alignment: .center)
        }
    }
}

struct VisualDocs_Binding_I: View {
    @State private var bindingVar1: Bool = false
    var body: some View {
        VStack {
            PlayButton(bindingVar2: $bindingVar1)
            if bindingVar1 {
                Text("isPlaying...")
            }
        }
    }
}

struct VisualDocs_Binding_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        TabView {
            VisualDocs_Binding_Intro().tabItem({ Text("Intro") })
            VisualDocs_Binding_I().tabItem({ Text("1") })
        }
    }
}
