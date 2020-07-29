//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Image: View {
        var body : some View {
            ScrollView {
                VStack {
                    ImageNames.cloud.image
                    ImageNames.cloud.image.resizable().frame(width: 150, height: 150, alignment: .center)
                    ImageNames.cloud.image.resizable()
                    ImageNames.cloud.image.resizable().scaledToFit()
                }.padding()
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
