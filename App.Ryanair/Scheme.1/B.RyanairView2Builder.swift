//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import Base_Domain
import App_Ryanair_Core

public struct RyanairView2Builder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        let apiRyanair_A = APIRyanair_A()
        let apiRyanair_B = APIRyanair_B()
        let fetcher: APIRyanairProtocol = FetcherRyanair(webAPI_A: apiRyanair_A, webAPI_B: apiRyanair_B)
        let repository: RepositoryRyanairProtocol = RepositoryRyanair()
        let viewModel = RyanairView2ViewModel(fetcher: fetcher, repository: repository, flight: nil)
        return RyanairView2(viewModel: viewModel)
    }

    public static func buildView(flight: RyanairResponseDto.Flight?) -> some View {
        let apiRyanair_A = APIRyanair_A()
        let apiRyanair_B = APIRyanair_B()
        let fetcher: APIRyanairProtocol = FetcherRyanair(webAPI_A: apiRyanair_A, webAPI_B: apiRyanair_B)
        let repository: RepositoryRyanairProtocol = RepositoryRyanair()
        let viewModel  = RyanairView2ViewModel(fetcher: fetcher, repository: repository, flight: flight)
        return RyanairView2(viewModel: viewModel)
    }
}
