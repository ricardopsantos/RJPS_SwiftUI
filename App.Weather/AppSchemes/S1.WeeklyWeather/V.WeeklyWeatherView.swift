//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import UIKitRepresentables
import Combine

// MARK: - Preview

// MARK: - View

public struct WeeklyWeatherView: View {
    @ObservedObject private var viewModel: WeeklyWeatherViewModel

    public init(viewModel: WeeklyWeatherViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ZStack {
            NavigationView {
                List {
                    searchField
                    if viewModel.dataSource.isEmpty {
                        emptySection
                    } else {
                        cityHourlyWeatherSection
                        forecastSection
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Weather ⛅️")
            }
            ActivityIndicatorRepresentable(isAnimating: viewModel.isAnimating)
        }
    }
}

private extension WeeklyWeatherView {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("e.g. Cupertino", text: $viewModel.city)
        }
    }

    var forecastSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: DailyWeatherRow_View.init(viewModel:))
        }
    }

    var cityHourlyWeatherSection: some View {
        Section {
            NavigationLink(destination: viewModel.currentWeatherView) {
                VStack(alignment: .leading) {
                    Text(viewModel.city)
                    Text("Weather today").font(.caption).foregroundColor(.gray)
                }
            }
        }
    }

    var emptySection: some View {
        Section {
            Text("No results").foregroundColor(.gray)
        }
    }
}

// MARK: - Auxiliar components

fileprivate extension WeeklyWeatherView {

}
