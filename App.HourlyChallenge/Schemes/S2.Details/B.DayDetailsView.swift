//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct DayDetailsViewBuilder {
    private init() { }

    static func buildView(_ weekDay: Int, _ timeZone: Int) -> some View {
        let fetcher: APIProtocol = Fetcher()
        let viewModel = DayDetailsViewModel(weekDay: weekDay, timeZone: timeZone, fetcher: fetcher)
        return DayDetailsView(weekDay: weekDay, timeZone: timeZone, viewModel: viewModel)
    }
}
