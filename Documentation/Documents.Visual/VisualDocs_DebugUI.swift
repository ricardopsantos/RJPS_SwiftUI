//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Utils_Extensions

var baseView: some View {
    Text("Hello").bold().font(.largeTitle).frame(width: 100, height: 100, alignment: .center).background(Color(UIColor.lightGray))
}

struct VisualDocs_DebugUI: View {
    var body: some View {
        ScrollView {
            Text("Debug UI").font(.title)
            Divider()
            VStack {
                HStack {
                    baseView
                    Text("Base").font(.footnote)
                }
                Spacer()
                HStack {
                    baseView.debugWithSimpleStroke()
                    Text(".debugWithSimpleStroke").font(.footnote)
                }
                Spacer()
                HStack {
                    baseView.debugWithDashedStroke()
                    Text(".debugWithDashedStroke").font(.footnote)
                }
                Spacer()
                HStack {
                    baseView.debugComposed()
                    Text(".debugComposed").font(.footnote)
                }
                Spacer()
                HStack {
                    baseView.debugComposed(color: .blue, width: 3)
                    Text(".debugComposed(color: .blue, width: 3)").font(.footnote)
                }
            }.padding()
        }
    }
}

// MARK: - Preview

struct VisualDocs_DebugUI_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_DebugUI()
    }
}
