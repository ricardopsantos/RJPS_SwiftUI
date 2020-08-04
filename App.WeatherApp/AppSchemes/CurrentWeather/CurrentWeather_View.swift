//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI

extension V {
    public struct CurrentWeather_View: View {
        @ObservedObject var viewModel: VM.CurrentWeather_ViewModel
        init(viewModel: VM.CurrentWeather_ViewModel) {
            self.viewModel = viewModel
        }
        public var body: some View {
            List(content: content)
                .onAppear(perform: viewModel.refresh)
                .navigationBarTitle(viewModel.city)
                .listStyle(GroupedListStyle())
        }
    }
}

private extension V.CurrentWeather_View {
    func content() -> some View {
        if let viewModel = viewModel.dataSource {
            return AnyView(details(for: viewModel))
        } else {
            return AnyView(loading)
        }
    }
    func details(for viewModel: VM.CurrentWeatherRow_ViewModel) -> some View {
        V.CurrentWeatherRow_View(viewModel: viewModel)
    }
    var loading: some View {
        Text("Loading \(viewModel.city)'s weather...").foregroundColor(.gray)
    }
}
