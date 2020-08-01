//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

var bigWeirdText : some View {
     Text("Big Weird Text")
     .bold()
     .font(.system(.largeTitle))
     .fontWeight(.medium)
     .italic()
     .shadow(color: .black, radius: 1, x: 0, y: 2)
     .padding(.top, 20).padding(.leading, 20).padding(.trailing, 20).padding(.bottom, 20)
     .background(Color.red)
     .foregroundColor(Color.green)
}

extension V {
    struct VisualDocs_Text: View {
        var body: some View {
            ScrollView {
                VStack {
                    bigWeirdText
                }
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Text: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Text()
    }
}
