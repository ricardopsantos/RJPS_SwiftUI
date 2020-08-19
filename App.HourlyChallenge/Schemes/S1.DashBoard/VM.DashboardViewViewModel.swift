//
//  Created by Ricardo Santos on 07/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Utils

public class DashBoardViewModel: ObservableObject {

    private let fetcher: APIProtocol
    private var cancelBag = CancelBag()
    @ObservedObject var settings = AppDefaultsRepository.shared

    var timeZoneServer: Int { return settings.timeZone - 3 }

    @Published private(set) var taskNow: String = ""
    @Published private(set) var taskNext1: String = ""
    @Published private(set) var taskNext2: String = ""
    @Published private(set) var taskNext3: String = ""

    public init(fetcher: APIProtocol) {
        self.fetcher = fetcher
    }

    func day(weekDay: Int) -> String {
        //fetcher.day(weekDay: weekDay)
        return FetcherStaticData.day(weekDay: weekDay)
    }

    func mainTask(weekDay: Int) -> String {
        //fetcher.mainTask(weekDay: weekDay)
        return FetcherStaticData.mainTask(weekDay: weekDay)
    }

    func imageName(weekDay: Int) -> String {
        //fetcher.imageName(weekDay: weekDay)
        return FetcherStaticData.imageName(weekDay: weekDay)
    }

    func color(weekDay: Int) -> Color {
        //fetcher.color(weekDay: weekDay)
        return FetcherStaticData.color(weekDay: weekDay)
    }

    func task(weekDay: Int, hour: String) -> String {
        //fetcher.task(weekDay: weekDay, hour: hour)
        return FetcherStaticData.task(weekDay: weekDay, hour: hour)
    }

    func refresh() {
        let weekDay = Date.dayOfWeek!
        taskNow(weekDay: weekDay, timeZone: timeZoneServer)
        taskNext1(weekDay: weekDay, timeZone: timeZoneServer)
        taskNext2(weekDay: weekDay, timeZone: timeZoneServer)
        taskNext3(weekDay: weekDay, timeZone: timeZoneServer)
    }
    
}

private extension DashBoardViewModel {
    private func taskNow(weekDay: Int, timeZone: Int) {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone)).receive(on: DispatchQueue.main).sink(
            receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.taskNow = value
        }).store(in: cancelBag)
    }

    private func taskNext1(weekDay: Int, timeZone: Int) {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone+1)).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.taskNext1 = value
        }).store(in: cancelBag)
    }

    private func taskNext2(weekDay: Int, timeZone: Int) {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone+2)).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.taskNext2 = value
        }).store(in: cancelBag)
    }

    private func taskNext3(weekDay: Int, timeZone: Int) {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone+3)).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.taskNext3 = value
        }).store(in: cancelBag)
    }
}
