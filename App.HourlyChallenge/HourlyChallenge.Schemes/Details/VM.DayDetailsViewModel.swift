//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import UIKit

public class DayDetailsViewModel: ObservableObject {

    private let fetcher: APIProtocol
    private let weekDay: Int
    private let timeZone: Int

    private var disposables = Set<AnyCancellable>()

    public init(weekDay: Int, timeZone: Int, fetcher: APIProtocol) {
        self.fetcher = fetcher
        self.weekDay = weekDay
        self.timeZone = timeZone
    }

}
