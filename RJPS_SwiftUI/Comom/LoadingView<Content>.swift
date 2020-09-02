//
//  Created by Ricardo Santos on 02/09/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine
//
import Utils_Designables

 struct LoadingView2_Preview: PreviewProvider {
    static var previews: some View {
        return LoadingView(isAnimating: .constant(true), content: {
            AppRoot_View()
        })
    }
}
