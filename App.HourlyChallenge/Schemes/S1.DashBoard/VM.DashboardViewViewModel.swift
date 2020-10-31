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

    // Encapsulate that the ViewModel internal/auxiliar state properties
    @Published private var viewModelInternalState: ViewModelState = ViewModelState()
    class ViewModelState: ObservableObject {

    }

    // Encapsulate that the View properties that the ViewModel needs to read on to work
    @Published var viewOut: ViewStateOut = ViewStateOut()
    class ViewStateOut: ObservableObject {
        @ObservedObject var settings = AppDefaultsRepository.shared
    }

    // Encapsulate that the View properties that the ViewModel updates in order to change UI
    @Published var viewIn: ViewStateIn = ViewStateIn()
    class ViewStateIn: ObservableObject {
        var timeZoneServer: Int { return AppDefaultsRepository.shared.timeZone - 3 }
        @Published fileprivate(set) var taskNow: String = ""
        @Published fileprivate(set) var taskNext1: String = ""
        @Published fileprivate(set) var taskNext2: String = ""
        @Published fileprivate(set) var taskNext3: String = ""
    }

    private let fetcher: APIProtocol
    private var cancelBag = CancelBag()

    public init(fetcher: APIProtocol) {
        self.fetcher = fetcher
    }

    func day(weekDay: Int) -> String {
        return FetcherStaticData.day(weekDay: weekDay)
    }

    func mainTask(weekDay: Int) -> String {
        return FetcherStaticData.mainTask(weekDay: weekDay)
    }

    func imageName(weekDay: Int) -> String {
        return FetcherStaticData.imageName(weekDay: weekDay)
    }

    func color(weekDay: Int) -> Color {
        return FetcherStaticData.color(weekDay: weekDay)
    }

    func task(weekDay: Int, hour: String) -> String {
        return FetcherStaticData.task(weekDay: weekDay, hour: hour)
    }

    func refresh() {
        let weekDay = Date.dayOfWeek!
        fetchTaskNow(weekDay: weekDay, timeZone: viewIn.timeZoneServer)
        fetchTaskNext1(weekDay: weekDay, timeZone: viewIn.timeZoneServer)
        fetchTaskNext2(weekDay: weekDay, timeZone: viewIn.timeZoneServer)
        fetchTaskNext3(weekDay: weekDay, timeZone: viewIn.timeZoneServer)
    }
    
}

private extension DashBoardViewModel {
    private func fetchTaskNow(weekDay: Int, timeZone: Int) {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone)).receive(on: DispatchQueue.main).sink(
            receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.viewIn.taskNow = value
        }).store(in: cancelBag)
    }

    private func fetchTaskNext1(weekDay: Int, timeZone: Int) {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone+1)).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.viewIn.taskNext1 = value
        }).store(in: cancelBag)
    }

    private func fetchTaskNext2(weekDay: Int, timeZone: Int) {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone+2)).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.viewIn.taskNext2 = value
        }).store(in: cancelBag)
    }

    private func fetchTaskNext3(weekDay: Int, timeZone: Int) {
        fetcher.task(weekDay: weekDay, hour: Date.getUserHour(diff: timeZone+3)).receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.viewIn.taskNext3 = value
        }).store(in: cancelBag)
    }
}
