//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Background_II: View {
        var body: some View {
            ZStack {
                Rectangle()                     // Shapes are resizable by default
                .foregroundColor(.clear)        // Making rectangle transparent
                    .background(LinearGradient(gradient: Gradient(colors: [.secondary, .white]), startPoint: .bottom, endPoint: .top)).edgesIgnoringSafeArea(.all)
            }
        }
    }
}

extension V {
    struct VisualDocs_Background_I: View {
        var body : some View {
            ZStack { Color.secondary.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .center, spacing: 10) {
                        Text("Hi")
                    }
                }
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Background_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Background_I()
    }
}

struct VisualDocs_Background_II: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Background_II()
    }
}
