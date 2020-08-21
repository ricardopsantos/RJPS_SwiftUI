//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
//
import Utils_Designables
//
import App_Ryanair_Core

struct RyanairView2: View {

    @ObservedObject private var viewModel: RyanairView2ViewModel

    public init(viewModel: RyanairView2ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        return Text("asd")
    }
}

struct RyanairView2_PreviewProvider: PreviewProvider {
    static var previews: some View {
        RyanairView2Builder.buildView()
    }
}
