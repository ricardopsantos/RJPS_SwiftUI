//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import Base_Domain
import App_Ryanair_Core

//
// The Builder is responsible to build a View and setup the Fetcher and ViewModel
// The method [static func buildView()] is mandatory, but we can have more
//

public struct RyanairView2Builder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        let apiRyanair_A = APIRyanair_A()
        let apiRyanair_B = APIRyanair_B()
        let fetcher: APIRyanairProtocol = FetcherRyanair(webAPI_A: apiRyanair_A, webAPI_B: apiRyanair_B)
        let repository: RepositoryRyanairProtocol = RepositoryRyanair()
        let viewModel = VM.RyanairView2ViewModel(fetcher: fetcher, repository: repository, flight: nil)
        return RyanairView2(viewModel: viewModel)
    }

    public static func buildView(flight: RyanairResponseDto.Flight?) -> some View {
        let apiRyanair_A = APIRyanair_A()
        let apiRyanair_B = APIRyanair_B()
        let fetcher: APIRyanairProtocol = FetcherRyanair(webAPI_A: apiRyanair_A, webAPI_B: apiRyanair_B)
        let repository: RepositoryRyanairProtocol = RepositoryRyanair()
        let viewModel = VM.RyanairView2ViewModel(fetcher: fetcher, repository: repository, flight: flight)
        return RyanairView2(viewModel: viewModel)
    }
}
