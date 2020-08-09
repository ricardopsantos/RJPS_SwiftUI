//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Domain

public struct DashboardViewBuilder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        let fetcher: APIProtocol = Fetcher()
        let viewModel = DashBoardViewModel(fetcher: fetcher)
        return DashboardView(viewModel: viewModel)
    }
}
