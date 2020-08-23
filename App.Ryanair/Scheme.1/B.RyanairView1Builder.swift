//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import Base_Domain
import App_Ryanair_Core

public struct RyanairView1Builder: BuilderProtocol {
    private init() { }
    public static func buildView() -> some View {
        let apiRyanair_A = APIRyanair_A()
        let apiRyanair_B = APIRyanair_B()
        let fetcher: APIRyanairProtocol = FetcherRyanair(webAPI_A: apiRyanair_A, webAPI_B: apiRyanair_B)
        let repository: RepositoryRyanairProtocol = RepositoryRyanair()
        let viewModel  = RyanairView1ViewModel(fetcher: fetcher, repository: repository)
        return RyanairView1(viewModel: viewModel)
    }

    public static func buildMockView() -> some View {
        let fetcher: APIRyanairProtocol = FetcherRyanairMock()
        let repository: RepositoryRyanairProtocol = RepositoryRyanair()
        let viewModel  = RyanairView1ViewModel(fetcher: fetcher, repository: repository)
        return RyanairView1(viewModel: viewModel)
    }
}
