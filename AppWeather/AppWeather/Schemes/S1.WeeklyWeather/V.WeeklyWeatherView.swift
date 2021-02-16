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

// MARK: - Preview

// MARK: - View

public struct WeeklyWeatherView: View {
    @ObservedObject private var viewModel: VM.WeeklyWeatherViewModel

    public init(viewModel: VM.WeeklyWeatherViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ZStack {
            NavigationView {
                List {
                    // Search Field
                    HStack(alignment: .center) {
                        TextField("e.g. Cupertino", text: $viewModel.viewOut.city)
                    }

                    if viewModel.viewIn.dataSourceB.isEmpty {
                        // Empty Section
                        Section {
                             Text("No results").foregroundColor(.gray)
                        }
                    } else {
                        // City Hourly Weather Section
                        Section {
                            NavigationLink(destination: viewModel.currentWeatherView) {
                                VStack(alignment: .leading) {
                                    Text(viewModel.viewOut.city)
                                    Text("Weather today").font(.caption).foregroundColor(.gray)
                                }
                            }
                        }
                        // Forecast Section
                        Section {
                            ForEach(viewModel.viewIn.dataSourceB, id: \.self) { some in
                                Group {
                                    DailyWeatherRowView.init(viewModel: some)
                                }
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Weather ⛅️")
            }
            RJS_Designables_SwiftUI.LoadingAnimations.Pack2.ActivityIndicator_V2(isAnimating: $viewModel.isLoading)
        }
    }
}

// MARK: - Auxiliar components

fileprivate extension WeeklyWeatherView {

}

// MARK: - PreviewProvider

struct WeeklyWeatherView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherBuilder.buildView().buildPreviews()
    }
}
