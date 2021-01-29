//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
//
import RJSLibUFBase
//
import Utils
//
import AppRyanairCore
import AppRyanairWebAPI
import AppRyanairDomain

public extension VM {
    class RyanairView2ViewModel: ObservableObject {

        // Encapsulate the ViewModel internal/auxiliar state properties
        @Published private var vmInternalState: ViewModelState = ViewModelState()
        class ViewModelState: ObservableObject {

        }

        // Encapsulate that the View properties that the ViewModel needs to read on to work
        @Published var viewOut: ViewStateOut = ViewStateOut()
        class ViewStateOut: ObservableObject {

        }

        // Encapsulate that the View properties that the ViewModel updates in order to change UI
        @Published var viewIn: ViewStateIn = ViewStateIn()
        class ViewStateIn: ObservableObject {
            @Published fileprivate(set) var isLoading: Bool = false
            @Published var flight: RyanairResponseDto.Flight?
        }

        private let fetcher: APIRyanairProtocol
        private var repository: RepositoryRyanairProtocol
        private var cancelBag = CancelBag()

        public init(fetcher: APIRyanairProtocol,
                    repository: RepositoryRyanairProtocol,
                    scheduler: DispatchQueue = DispatchQueue(label: "RyanairView2ViewModel"),
                    flight: RyanairResponseDto.Flight?) {
            self.fetcher = fetcher
            self.repository = repository
            self.viewIn.flight = flight
            self.viewIn.isLoading = true
        }
    }
}

private extension VM.RyanairView1ViewModel {

}
