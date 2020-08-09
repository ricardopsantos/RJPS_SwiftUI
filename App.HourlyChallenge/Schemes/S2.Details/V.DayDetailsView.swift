//
//  Created by Ricardo Santos on 06/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import UIKit

// MARK: - Preview

struct BasicApps_DayDetailsView: PreviewProvider {
    static var previews: some View {
        DayDetailsViewBuilder.buildView(1, 0)
    }
}

// MARK: - View

public struct DayDetailsView: View {
    var weekDay: Int
    var timeZone: Int

    @ObservedObject private var viewModel: DayDetailsViewModel
    public init(weekDay: Int, timeZone: Int, viewModel: DayDetailsViewModel) {
        self.viewModel = viewModel
        self.weekDay = weekDay
        self.timeZone = timeZone
        self.viewModel.refresh()
    }
    
    public var body : some View {
        ScrollView {
            VStack {
                Text(viewModel.day).font(.title)
                Spacer()
                Text("Current challenge: ").font(.footnote).bold()
                Text(viewModel.taskNow)
            }.scaledToFill().padding(.vertical)
            Spacer()
            Text("Today Challenges Schedule").font(.title)
            ForEach(viewModel.availableHours, id: \.self) { some in
                VStack {
                    Divider()
                    HStack(alignment: .top, spacing: 3) {
                        if Date.getUserHour(diff: self.timeZone) == some {
                            Text("\(some):00").font(.headline).bold()
                            Text(self.viewModel.task(weekDay: self.weekDay, hour: some)).font(.headline).bold()
                        } else {
                            Text("\(some):00 ").alpha(0.6)
                            Text(self.viewModel.task(weekDay: self.weekDay, hour: some)).alpha(0.6)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Auxiliar components

fileprivate extension DayDetailsView {
    
}
