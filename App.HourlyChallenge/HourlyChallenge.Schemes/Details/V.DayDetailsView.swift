//
//  Created by Ricardo Santos on 06/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import UIKit

// MARK: - Preview

// MARK: - View

public struct DayDetailsView: View {
    var weekDay: Int
    var timeZone: Int
    let list = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
    
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
            ForEach(list, id: \.self) { some in
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
        .onAppear(perform: { })
    }
}

// MARK: - Auxiliar components

fileprivate extension DayDetailsView {
    
}
