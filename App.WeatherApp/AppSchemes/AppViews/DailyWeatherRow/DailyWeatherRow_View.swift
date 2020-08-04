//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import SwiftUI

extension V {

    struct DailyWeatherRow_View: View {
        private let viewModel: VM.DailyWeatherRow_ViewModel

        init(viewModel: VM.DailyWeatherRow_ViewModel) {
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
}
