//
//  Created by Ricardo Santos on 07/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

public class DashBoardViewModel: ObservableObject {

    private let fetcher: APIProtocol
    private var disposables = Set<AnyCancellable>()

    public init(fetcher: APIProtocol) {
        self.fetcher = fetcher
    }

    func taskNow(weekDay: Int, timeZone: Int) -> String {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone))
        return ""
    }

    func taskNext(weekDay: Int, timeZone: Int, next: Int) -> String {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone+next))
        return ""
    }

    func day(weekDay: Int) -> String {
        fetcher.day(weekDay: weekDay)
        return "1"
    }

    func mainTask(weekDay: Int) -> String {
        fetcher.mainTask(weekDay: weekDay)
        return "1"
    }

    func imageName(weekDay: Int) -> String {
        fetcher.imageName(weekDay: weekDay)
        return ""
    }

    func color(weekDay: Int) -> Color {
        fetcher.color(weekDay: weekDay)
        return Color.red
    }

    func task(weekDay: Int, hour: String) -> String {
        fetcher.task(weekDay: weekDay, hour: hour)
        return ""
    }
    
}
