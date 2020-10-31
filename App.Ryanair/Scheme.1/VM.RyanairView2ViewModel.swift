//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
//
import Utils_Extensions
import Utils
//
import App_Ryanair_Core

public class RyanairView2ViewModel: ObservableObject {

    // Encapsulate that the View properties that the ViewModel needs to read on to work
    @Published var viewOut: ViewStateOut = ViewStateOut()
    class ViewStateOut: ObservableObject {

    }

    // Encapsulate that the View properties that the ViewModel updates in order to change UI
    @Published var viewIn: ViewStateIn = ViewStateIn()
    class ViewStateIn: ObservableObject {
        @Published var isLoading: Bool = false
    }

    private let fetcher: APIRyanairProtocol
    private var repository: RepositoryRyanairProtocol
    private var cancelBag = CancelBag()
    var flight: RyanairResponseDto.Flight?

    public init(fetcher: APIRyanairProtocol,
                repository: RepositoryRyanairProtocol,
                scheduler: DispatchQueue = DispatchQueue(label: "RyanairView2ViewModel"),
                flight: RyanairResponseDto.Flight?) {
        self.fetcher = fetcher
        self.repository = repository
        self.flight = flight
        self.viewIn.isLoading = true
    }
}

private extension RyanairView1ViewModel {

}
