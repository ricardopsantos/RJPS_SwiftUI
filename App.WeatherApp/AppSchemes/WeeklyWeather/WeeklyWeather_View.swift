//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI

//extension V {
    public struct WeeklyWeather_View: View {
        @ObservedObject var viewModel: WeeklyWeather_ViewModel

        public init(viewModel: WeeklyWeather_ViewModel) {
            print(viewModel)
            self.viewModel = viewModel
        }

        public var body: some View {
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
        }
    }
//}

private extension WeeklyWeather_View {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("e.g. Cupertino", text: $viewModel.city)
        }
    }

    var forecastSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: V.DailyWeatherRow_View.init(viewModel:))
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

struct WeeklyWeather_View_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
