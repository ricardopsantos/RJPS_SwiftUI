//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct Result_1 {
    var id = UUID()
    var score: Int
}

struct Result_2 {
    var score: Int
}

extension Result_2: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(score)
    }
}

struct Result_3: Identifiable {
    var id = UUID()
    var score: Int
}

extension V {
    struct VisualDocs_ForEach: View {
        let colors: [Color] = [.red, .green, .blue]
        let results_1 = [Result_1(score: 1), Result_1(score: 2), Result_1(score: 3)]
        let results_2 = [Result_2(score: 4), Result_2(score: 5), Result_2(score: 6)]
        let results_3 = [Result_3(score: 7), Result_3(score: 8), Result_3(score: 9)]
        var body : some View {
            ScrollView {
                VStack {

                    //
                    // The .id(: \.self) part is required so that SwiftUI can identify each element in
                    //the array uniquely – it means that if you add or remove an item, SwiftUI knows exactly which one.
                    //

                    VStack(alignment: .leading) {
                        ForEach((1...10).reversed(), id: \.self) {
                            Text("\($0)…")
                        }
                        Text("Ready or not, here I come!")
                    }

                    Divider()

                    // Using \.self tells Swift each item is uniquely identified using its own value.
                    // So, if you have the array [1, 2, 3] and identify each value by \.self it means
                    // the first item has the identifier 1, the second 2, and the third 3.

                    VStack {
                        ForEach(colors, id: \.self) { some in
                            Text(some.description.capitalized).padding().background(some)
                        }
                    }

                    Divider()

                    // If you have custom types in your array, you should use id: with whatever property inside
                    // your type identifies it uniquely. For example, here’s a struct to store test results like this:

                    VStack {
                         ForEach(results_1, id: \.id) { some in
                             Text("Result: \(some.score)")
                         }
                     }

                    Divider()

                    // As an alternative 1, if you make Result conform to Hashable

                    VStack {
                         ForEach(results_2, id: \.self) { some in
                             Text("Result: \(some.score)")
                         }
                     }

                    Divider()

                    // As an alternative 2, if you make Result conform to Identifiable protocol you can just
                    // write ForEach(results). Conforming to this protocol means adding an id property that
                    // uniquely identifies each object, which in our case we already have

                    VStack {
                        ForEach(results_3) { some in
                            Text("Result: \(some.score)")
                        }
                     }
                }
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_ForEach: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_ForEach()
    }
}
