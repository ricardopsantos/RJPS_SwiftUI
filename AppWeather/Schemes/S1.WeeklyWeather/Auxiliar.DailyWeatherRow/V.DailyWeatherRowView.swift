//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI

struct DailyWeatherRowView: View {
    private let viewModel: VM.DailyWeatherRowViewModel

    init(viewModel: VM.DailyWeatherRowViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            VStack {
                Text("\(viewModel.day)")
                Text("\(viewModel.month)")
            }
            VStack(alignment: .leading) {
                Text("\(viewModel.title)").font(.body)
                Text("\(viewModel.fullDescription)").font(.footnote)
            }
            .padding(.leading, 8)
            Spacer()
            Text("\(viewModel.temperature)°").font(.title)
        }
    }
}
