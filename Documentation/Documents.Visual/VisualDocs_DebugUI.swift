//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Extensions

var baseView: some View {
    Text("Hello").bold().font(.largeTitle).frame(width: 100, height: 100, alignment: .center).background(Color(UIColor.lightGray))
}

extension V {
    struct VisualDocs_DebugUI: View {
        var body: some View {
            ScrollView {
                VStack {
                    baseView
                    Spacer()
                    baseView.debug1()
                    Spacer()
                    baseView.debug2()
                    Spacer()
                    baseView.debug3()
                }.padding().debug3(color: .blue, width: 3)
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_DebugUI: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_DebugUI()
    }
}
