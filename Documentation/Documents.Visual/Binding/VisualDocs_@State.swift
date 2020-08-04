//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Binding_State: View {
        var body: some View {
            ScrollView {
                TextField("type something...", text: Binding.constant("Hello!"))
            }.padding()
        }
    }
}

// MARK: - Preview VisualDocs_Binding_State

struct VisualDocs_Binding_State: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Binding_State()
    }
}

// ///////////////////////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////////////////////////

//
// Binding is a property wrapper type that can read and write a value owned by a
// source of truth. We have several possible types of sources of truth in SwiftUI.
//
// It can be EnvironmentObject, ObservedObject or State. All these property wrappers
// provide a projected value, which is binding.
//

//
// @State
// * is a Property Wrapper which we can use to describe View’s state.
// * SwiftUI will store it in special internal memory outside of View struct.
// Only the related View can access it. As soon as the value of @State property changes SwiftUI rebuilds View to respect state changes.
//

//
// Here we have a state that is a source of truth.
// We also have a TextField, which requires a binding for a text value. We use a
// dollar sign to access the projected value of the state property wrapper, which
// is a binding to the value of property wrapper.
//

extension V {
    struct VisualDocs_Binding_State_I: View {
        @State private var text = "Hello World."
        var body: some View {
            ScrollView {
                TextField("type something...", text: $text)
            }.padding()
        }
    }
}

// MARK: - Preview VisualDocs_Binding_I

struct VisualDocs_Binding_State_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Binding_State_I()
    }
}

// ///////////////////////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////////////////////////

struct Product: Identifiable {
    var id = UUID()
    let title: String
    let isFavorited: Bool
}

extension V {
    struct VisualDocs_Binding_State_II: View {
        let products: [Product]
        @State private var filterFavourites: Bool = false
        var body: some View {
            VStack {
                Button(action: { self.filterFavourites.toggle() }, label: { Text("Change filter") } )
                Toggle(isOn: $filterFavourites) {
                    if filterFavourites {
                        Text("Favourites Only")
                    } else {
                        Text("All records")
                    }
                }
                List {
                    ForEach(products) { some in
                        if !self.filterFavourites || some.isFavorited {
                            Text(some.title)
                        }
                    }
                }
            }.padding()
        }
    }
}

// MARK: - Preview VisualDocs_Binding_State_II

struct VisualDocs_Binding_State_II: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Binding_State_II(products: [Product(title: "1", isFavorited: false), Product(title: "2", isFavorited: true)])
    }
}

// ///////////////////////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////////////////////////

extension V {
    struct VisualDocs_Toggle_I: View {
        @State private var toggle: Bool = true // toggle state
        @State private var counter: Int = 0
        @State private var name: String = ""

        var toggleView: some View {
            return Toggle(isOn: $toggle) {
                if toggle {
                    Text("Toggle On")
                } else {
                    Text("Toggle Off")
                }
            }
        }
        var body : some View {
            ScrollView {
                VStack {
                    Stepper(value: $counter) { Text("Counter: \(counter)") }
                    Divider()
                    toggleView
                    Button(action: { self.toggle.toggle() }, label: { Text("Change Toggle_1") } )
                    Button("Change_Toggle_2") { self.toggle = !self.toggle }
                    Divider()
                    TextField("type something...", text: $name)
                    Text(name)
                    Divider()
                }.padding()
            }
        }
    }
}

// MARK: - Preview VisualDocs_Toggle_I

struct VisualDocs_Toggle_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Toggle_I()
    }
}
