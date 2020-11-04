//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import Base_Domain

//
// The Builder is responsible to build a View and setup the Fetcher and ViewModel
// The method [static func buildView()] is mandatory, but we can have more
//

public struct DayDetailsViewBuilder : BuilderProtocol {
    private init() { }

    public static func buildView() -> some View {
        return buildView(0, 0)
    }

    static func buildView(_ weekDay: Int, _ timeZone: Int) -> some View {
        let fetcher: APIProtocol = Fetcher()
        let viewModel = VM.DayDetailsViewModel(weekDay: weekDay, timeZone: timeZone, fetcher: fetcher)
        return DayDetailsView(weekDay: weekDay, timeZone: timeZone, viewModel: viewModel)
    }
}
