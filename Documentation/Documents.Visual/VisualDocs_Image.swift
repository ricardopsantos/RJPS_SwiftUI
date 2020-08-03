//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Extensions
import Factory

extension V {
    struct VisualDocs_Image: View {
        var body : some View {
            ScrollView {
                VStack {
                    Text("Pure")
                    ImageNames.cloud.image
                    Divider()

                    Text("resizable().frame(width: 100, height: 100, alignment: .center)")
                    ImageNames.cloud.image.resizable().frame(width: 100, height: 100, alignment: .center)
                    Divider()

                    Text("resizable()")
                    ImageNames.cloud.image.resizable()
                    Divider()
                }
                VStack {
                    Text("resizable().scaledToFit()")
                    ImageNames.cloud.image.resizable().scaledToFit()

                    Divider()
                    Text("Extensions")
                    ImageNames.cloud.image.contentMode(.fit)
                    ImageNames.cloud.image.contentMode(.fill)
                    ImageNames.cloud.image.resize(width: 100, height: 100, alignment: .center)
                }
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Image: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Image()
    }
}
