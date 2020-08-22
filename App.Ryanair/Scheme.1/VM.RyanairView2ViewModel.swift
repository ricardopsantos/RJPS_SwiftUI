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

    @Published var isLoading: Bool = false

    private let fetcher: APIRyanairProtocol
    private var repository: RepositoryRyanairProtocol
    private var cancelBag = CancelBag()
    var flight: RyanairResponseDto.Flight?

    public init(fetcher: APIRyanairProtocol,
                repository: RepositoryRyanairProtocol,
                scheduler: DispatchQueue = DispatchQueue(label: "Schemes1TemplateViewModel"),
                flight: RyanairResponseDto.Flight?) {
        self.fetcher = fetcher
        self.repository = repository
        self.flight = flight
        self.isLoading = true
    }
}

private extension RyanairView1ViewModel {

}
