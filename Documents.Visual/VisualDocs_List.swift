//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

var someList1: some View {
    List {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "clock")
            Text("List.Item_1")
        }
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "clock")
            Text("List.Item_2")
        }
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "clock")
            Text("List.Item_3")
        }
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "clock")
            Text("List.Item_4")
        }
    }
}

var someSection1: some View {
    Section(header: Text("Section.Header"),
            footer: Text("Section.Footer")) {
                Text("Section.Footer.Item_1")
                Text("Section.Footer.Item_2")
            }
}

extension V {
    struct VisualDocs_Lists: View {
        var body : some View {
            VStack(alignment: .center, spacing: 10) {
            someSection1
            someList1
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Lists: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Lists()
    }
}
