//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

var sample1 : some View {
     Text("sample1")
     .bold()
     .font(.system(.largeTitle))
     .fontWeight(.medium)
     .italic()
     .shadow(color: .black, radius: 1, x: 0, y: 2)
     .padding(.top, 20).padding(.leading, 20).padding(.trailing, 20).padding(.bottom, 20)
     .background(Color.red)
     .foregroundColor(Color.green)
}

var sample2: some View {
    Text("sample2")
    .padding()
    .overlay(
        RoundedRectangle(cornerRadius: 8)
            .stroke(Color.blue, lineWidth: 4)
    )
}

var sample3: some View {
    Text("sample3").padding().addCornerOverlay(color: UIColor.blue, radius: 8, width: 4)
}

struct VisualDocs_Text: View {
    var body: some View {
        ScrollView {
            VStack {
                sample1
                Spacer()
                sample2
                Spacer()
                sample2
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Text_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_Text()
    }
}
