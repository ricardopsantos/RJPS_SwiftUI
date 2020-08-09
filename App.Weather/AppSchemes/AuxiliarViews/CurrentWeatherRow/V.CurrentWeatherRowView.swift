//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI

struct CurrentWeatherRowView: View {
    private let viewModel: VM.CurrentWeatherRowViewModel

    init(viewModel: VM.CurrentWeatherRowViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            MapViewRepresentable(coordinate: viewModel.coordinate).cornerRadius(25).frame(height: 300).disabled(true)
            VStack(alignment: .leading) {
                HStack {
                    Text("☀️ Temperature:")
                    Text("\(viewModel.temperature)°").foregroundColor(.gray)
                }

                HStack {
                    Text("📈 Max temperature:")
                    Text("\(viewModel.maxTemperature)°").foregroundColor(.gray)
                }

                HStack {
                    Text("📉 Min temperature:")
                    Text("\(viewModel.minTemperature)°").foregroundColor(.gray)
                }

                HStack {
                    Text("💧 Humidity:")
                    Text(viewModel.humidity).foregroundColor(.gray)
                }
            }
        }
    }
}
