//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI
import Combine
//
import Utils_Designables

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
                    // Search Field
                    HStack(alignment: .center) {
                        TextField("e.g. Cupertino", text: $viewModel.city)
                    }
                    if viewModel.dataSource.isEmpty {
                        // Empty Section
                        Section {
                             Text("No results").foregroundColor(.gray)
                         }
                    } else {
                        // City Hourly Weather Section
                        Section {
                            NavigationLink(destination: viewModel.currentWeatherView) {
                                VStack(alignment: .leading) {
                                    Text(viewModel.city)
                                    Text("Weather today").font(.caption).foregroundColor(.gray)
                                }
                            }
                        }
                        // Forecast Section
                        Section {
                            ForEach(viewModel.dataSource, id: \.self) { some in
                                DailyWeatherRowView.init(viewModel: some)
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Weather ⛅️")
            }
            ActivityIndicator_V2(isAnimating: viewModel.isAnimating)
        }
    }
}

// MARK: - Auxiliar components

fileprivate extension WeeklyWeatherView {

}

struct WeeklyWeatherView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherBuilder.buildView()
    }
}
