//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

extension AppView {
    struct ActivityIndicator: UIViewRepresentable {
        /*@Binding*/ var isAnimating: Bool
        func makeUIView(context: Context) -> UIActivityIndicatorView {
            return UIActivityIndicatorView(style:.large)
        }

        func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
            if isAnimating {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }
}
#if DEBUG
struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
#endif
