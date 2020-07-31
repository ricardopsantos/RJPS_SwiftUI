//
//  File.swift
//  UglySwiftUIApp
//
//  Created by Ricardo Santos on 31/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// Three ways to react to @State event changes in SwiftUI
// https://dev.to/calin_crist/three-ways-to-react-to-state-event-changes-in-swiftui-5bh5
//
// 1 - UI Controls specific callbacks: onEditingChanged
// 2 - Binding variables
// 3 - Making use of Combine framework
//

// ///////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////////

//
// 1 - onEditingChanged
// 1 - onEditingChanged
// 1 - onEditingChanged
//
// According to Apple's Developer Documentation, this callback is available on the inits
// of 3 controls: TextField, Slider and Stepper.
//

extension V {
    struct VisualDocs_WaysToReactToState_onEditingChanged: View {

        //  ADD THIS
        func checkIfTextsMatch(changed: Bool) {
            self.textsMatch = self.textValue == self.enteredTextValue
        }

        @State var textValue: String = "Hello"
        @State var enteredTextValue: String = ""
        @State var textsMatch: Bool = false
        var body: some View {
              VStack {
                  HStack {
                      Text("Write this word: ")
                      Text(textValue)
                  }
                  TextField("Write here:", text: $enteredTextValue, onEditingChanged: self.checkIfTextsMatch).padding().border(Color.green, width: 1)
                  Toggle(isOn: $textsMatch) { Text("Matching?") }.disabled(true).padding()
            }.padding()
        }
    }
}

struct VisualDocs_WaysToReactToState_onEditingChanged: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_WaysToReactToState_onEditingChanged()
    }
}

//
// 2 - Binding
// 2 - Binding
// 2 - Binding
//
// Binding is a property wrapper type that can read and write a value owned by a source of truth.
// This reference enables the view to edit the state of any view that depends on this data.
// We can use this to mimic the property observers from UIKit approach (getters/setters).
//

extension V {
    struct VisualDocs_WaysToReactToState_Binding: View {

        func checkIfTextsMatch() {
            self.textsMatch = self.textValue == self.enteredTextValue
        }

        @State var textValue: String = "Hello"
        @State var enteredTextValue: String = ""
        @State var textsMatch: Bool = false
        var body: some View {
            let textValueBinding = Binding<String>(get: { self.enteredTextValue }, set: { self.enteredTextValue = $0; self.checkIfTextsMatch() })
            let theBody = VStack {
                HStack {
                    Text("Write this word: ")
                    Text(String(textValue))
                }
                TextField("Write here:", text: textValueBinding).padding(10).border(Color.green, width: 1)
                Text(enteredTextValue)
                Toggle(isOn: $textsMatch) { Text("Matching?") }.disabled(true).padding()
            }.padding()
            return theBody
        }
    }
}

struct VisualDocs_WaysToReactToState_Binding: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_WaysToReactToState_Binding()
    }
}

//
// 3 - Combine framework
// 3 - Combine framework
// 3 - Combine framework
//
// The Combine framework is used to customise handling of asynchronous events by combining
// event-processing operators - in our case to listen to state changes events.
//
// In Combine's vocabulary we have:
//
//  - ObservableObject - A type of object with a publisher that emits before the object has changed.
//
//  - ObservedObject - declares dependency on a reference type that conforms to the ObservableObject protocol.
//    It's a property wrapper type that subscribes to an observable object and invalidates a view
//    whenever the observable object changes.
//    It is external to the view, it is a reference value (e.g., a class) and its storage is managed by you,
//    giving you more flexibility to implement your own logic.
//
//  - Published - A type that publishes a property marked with an attribute.

class ContentViewModel: ObservableObject {
    @Published var textsMatch: Bool = false
    @Published var textValue: String = "Hello"
    @Published var enteredTextValue: String = "" { didSet { checkIfTextsMatch() } }
    func checkIfTextsMatch() { self.textsMatch = textValue == enteredTextValue }
}

extension V {
    struct VisualDocs_WaysToReactToState_Combine: View {
      @ObservedObject var viewModel = ContentViewModel()
      var body: some View {
          VStack {
              HStack {
                  Text("Write this word: ")
                  Text(String(viewModel.textValue))
              }
              TextField("Write here:", text: $viewModel.enteredTextValue).padding(10).border(Color.green, width: 1)
              Text(viewModel.enteredTextValue)
              Toggle(isOn: $viewModel.textsMatch) { Text("Matching?")}
              .disabled(true)
              .padding()
          }.padding()
      }
    }
}

struct VisualDocs_WaysToReactToState_Combine: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_WaysToReactToState_Combine()
    }
}
