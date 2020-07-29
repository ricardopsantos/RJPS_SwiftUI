//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

extension V {
    struct VisualDocs_LinearGradient: View {
        var body: some View {
            VStack {
                Rectangle()                     // Shapes are resizable by default
                .foregroundColor(.clear)        // Making rectangle transparent
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .bottom, endPoint: .top)).edgesIgnoringSafeArea(.all)
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_LinearGradient: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_LinearGradient()
    }
}
