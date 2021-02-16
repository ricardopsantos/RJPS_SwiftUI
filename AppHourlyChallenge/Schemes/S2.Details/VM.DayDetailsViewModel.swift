//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import UIKit
//
import RJSLibUFBase
//
import Utils

public extension VM {
    class DayDetailsViewModel: ObservableObject {

        // Encapsulate the ViewModel internal/auxiliar state properties
        @Published private var vmInternalState: ViewModelState = ViewModelState()
        class ViewModelState: ObservableObject {
            var weekDay: Int = 0
            var timeZone: Int = 0
        }

        // Encapsulate that the View properties that the ViewModel needs to read on to work
        @Published var viewOut: ViewStateOut = ViewStateOut()
        class ViewStateOut: ObservableObject {

        }

        // Encapsulate that the View properties that the ViewModel updates in order to change UI
        @Published var viewIn: ViewStateIn = ViewStateIn()
        class ViewStateIn: ObservableObject {
            @Published fileprivate(set) var taskNow = ""
            @Published fileprivate(set) var day = ""
            let availableHours = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
        }

        private let fetcher: APIProtocol
        private var cancelBag = CancelBag()

        public init(weekDay: Int, timeZone: Int, fetcher: APIProtocol) {
            self.fetcher = fetcher
            self.vmInternalState.weekDay = weekDay
            self.vmInternalState.timeZone = timeZone
        }

        func refresh() {
            fetchTaskNow(weekDay: vmInternalState.weekDay, timeZone: vmInternalState.timeZone)
            fetchDay(weekDay: vmInternalState.weekDay)
        }

        func task(weekDay: Int, hour: String) -> String {
            FetcherStaticData.task(weekDay: weekDay, hour: hour)
        }
    }
}
private extension VM.DayDetailsViewModel {
    func fetchTaskNow(weekDay: Int, timeZone: Int) {
        fetcher.fetchTask(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone)).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.viewIn.taskNow = value
        }).store(in: cancelBag)
    }

    func fetchDay(weekDay: Int) {
        fetcher.fetchDay(weekDay: weekDay).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.viewIn.day = value
        }).store(in: cancelBag)
    }

}
