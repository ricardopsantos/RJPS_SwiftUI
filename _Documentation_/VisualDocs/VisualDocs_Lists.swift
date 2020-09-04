//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct VisualDocs_Lists: View {
    @State var list = ["List2.Item_1", "List2.Item_1", "List2.Item_1"]
    var body : some View {

        VStack {

            Section(header: Text("Section.Header"),
                footer: Text("Section.Footer")) {
                    Text("Section.Footer.Item_1")
                    Text("Section.Footer.Item_2")
                }

            Divider()

            List {
                HStack {
                    Image(systemName: "clock")
                    Text("List1.Item_1")
                }
                HStack {
                    Image(systemName: "clock")
                    Text("List1.Item_2")
                }
                HStack {
                    Image(systemName: "clock")
                    Text("List1.Item_3")
                }
            }

            Divider()

            List {
                ForEach(list, id: \.self) { some in
                    HStack {
                        Image(systemName: "clock")
                        Text(some)
                    }
                }
            }
        }.padding()
    }
}

// MARK: - Preview

struct Lists_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        VisualDocs_Lists()
    }
}
