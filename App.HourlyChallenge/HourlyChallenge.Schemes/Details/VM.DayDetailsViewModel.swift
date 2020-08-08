//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import UIKit

public class DayDetailsViewModel: ObservableObject {

    let list = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]

    private let fetcher: APIProtocol
    private let weekDay: Int
    private let timeZone: Int

    private var disposables = Set<AnyCancellable>()

    @Published var taskNow = ""
    @Published var day = ""

    public init(weekDay: Int, timeZone: Int, fetcher: APIProtocol) {
        self.fetcher = fetcher
        self.weekDay = weekDay
        self.timeZone = timeZone
    }

    func refresh() {
        taskNow(weekDay: weekDay, timeZone: timeZone)
        day(weekDay: weekDay)
    }

    func task(weekDay: Int, hour: String) -> String {
        FetcherStaticData.task(weekDay: weekDay, hour: hour)
    }
}

private extension DayDetailsViewModel {
    private func taskNow(weekDay: Int, timeZone: Int) {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone)).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.taskNow = value
        }).store(in: &disposables)
    }

    private func day(weekDay: Int) {
        fetcher.day(weekDay: weekDay).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.day = value
        }).store(in: &disposables)
    }

}
