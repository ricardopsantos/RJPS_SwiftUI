//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

// https://swiftwithmajid.com/2020/04/08/binding-in-swiftui/
//
// APP
//
// Let’s take a look at the more complicated example. We will build an app that shows
// the list of users and allows us to edit user data.
//
//
// Please keep in mind that the value of binding must be a value type. It means it has to be
// an enum or a struct. I see that people sometimes use classes to describe a state or entry
// inside EnvironmentObject or ObservedObject and notice that binding is not working.
// Apple’s documentation on binding says: if Value is not value semantic, the updating behavior
// for any views that make use of the resulting Binding is unspecified.

struct Person: Identifiable {
    let id: UUID
    var name: String
    var age: Int
}

extension Sequence {
    func indexed() -> Array<(offset: Int, element: Element)> {
        return Array(enumerated())
    }
}

extension V {
    struct BasicApp_ListOfUsers: View {

        @ObservedObject var store: PersonStore

        var body: some View {
            NavigationView {
                List {
                    ForEach(store.persons.indexed(), id: \.1.id) { index, person in
                        NavigationLink(destination: V.EditingView(person: self.$store.persons[index])) {
                            VStack(alignment: .leading) {
                                Text(person.name).font(.headline)
                                Text("Age: \(person.age)").font(.subheadline).foregroundColor(.secondary)
                            }
                        }
                    }
                }.navigationBarTitle(Text("Persons"))
            }
        }
    }

    struct EditingView: View {
        @Environment(\.presentationMode) var presentation
        @Binding var person: Person

        var body: some View {
            Form {
                Section(header: Text("Personal information")) {
                    TextField("type something...", text: $person.name)
                    Stepper(value: $person.age) {
                        Text("Age: \(person.age)")
                    }
                }

                Section {
                    Button("Save") {
                        self.presentation.wrappedValue.dismiss()
                    }
                }
            }.navigationBarTitle(Text(person.name))
        }
    }
}

// MARK: - Preview VisualDocs_BasicApp_ListOfUsers

final class PersonStore: ObservableObject {
    @Published var persons: [Person] = [
        .init(id: .init(), name: "Majid", age: 28),
        .init(id: .init(), name: "John", age: 31),
        .init(id: .init(), name: "Fred", age: 25)
    ]
}

struct BasicApp_ListOfUsers: PreviewProvider {
    static var previews: some View {
        V.BasicApp_ListOfUsers(store: PersonStore.init())
    }
}
