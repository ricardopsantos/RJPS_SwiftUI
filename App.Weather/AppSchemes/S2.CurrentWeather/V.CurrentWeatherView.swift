//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI

// MARK: - Preview

// MARK: - View

public struct CurrentWeatherView: View {
    @ObservedObject var viewModel: VM.CurrentWeatherViewModel
    init(viewModel: VM.CurrentWeatherViewModel) {
        self.viewModel = viewModel
    }
    public var body: some View {
        List(content: content)
            .onAppear(perform: viewModel.refresh)
            .navigationBarTitle(viewModel.city)
            .listStyle(GroupedListStyle())
    }
}

// MARK: - Auxiliar components

private extension CurrentWeatherView {
    func content() -> some View {
        if let viewModel = viewModel.dataSource {
            return AnyView(details(for: viewModel))
        } else {
            return AnyView(loading)
        }
    }
    func details(for viewModel: VM.CurrentWeatherRowViewModel) -> some View {
        CurrentWeatherRowView(viewModel: viewModel)
    }
    var loading: some View {
        Text("Loading \(viewModel.city)'s weather...").foregroundColor(.gray)
    }
}
