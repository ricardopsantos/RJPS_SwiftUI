//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

//
// Solving this : https://www.appgamer.com/last-shelter-survival/strategy-guide/hourly-challenges-schedule
// https://wwdcbysundell.com/2020/building-entire-apps-with-swiftui/
//

import Foundation
import UIKit
import SwiftUI
import Combine
import MessageUI
//
import Utils

// MARK: - View

public struct DashboardView: View {
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentDate = Date()
    @State private var result: Result<MFMailComposeResult, Error>?
    @State private var isShowingMailView = false

    @ObservedObject private var viewModel: VM.DashBoardViewModel
    public init(viewModel: VM.DashBoardViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationView {
            List {
                Section {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            Text("Your time").font(.body)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("\(currentDate.formated)").onReceive(timer) { input in self.currentDate = input }.font(.footnote)
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Server time").font(.body).bold()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("\(Date.serverTime(timeZone: viewModel.viewIn.timeZoneServer))").onReceive(timer) { _ in }.font(.footnote)
                            Spacer()
                        }
                    }
                }

                Section {
                    VStack {
                        HStack {
                            Spacer()
                            Text("Current challenge: ").font(.footnote).bold()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("\(viewModel.viewIn.taskNow)").font(.title).bold()
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Next challenges: ").font(.footnote).bold()
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Text("\(viewModel.viewIn.taskNext1)").font(.footnote)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("\(viewModel.viewIn.taskNext2)").font(.footnote)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("\(viewModel.viewIn.taskNext3)").font(.footnote)
                            Spacer()
                        }
                    }
                }

                Stepper(value: $viewModel.viewOut.settings.timeZone,
                        onEditingChanged: { _ in self.viewModel.refresh() },
                        label: { Text("Adjust TimeZone: \(viewModel.viewOut.settings.timeZone)") })

                Section {
                    ForEach([1, 2, 3, 4, 5, 6, 7], id: \.self) { day in
                        NavigationLink(destination: DayDetailsViewBuilder.buildView(day, self.viewModel.viewIn.timeZoneServer)) { self.listItem(weekDay: day) }
                    }
                }

                if MFMailComposeViewController.canSendMail() {
                    VStack {
                        Spacer()
                        Button("Contact support") { self.isShowingMailView.toggle() }
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Twitter:").foregroundColor(.secondary)
                            Text("@ricardo_psantos").foregroundColor(.secondary)
                            Spacer()
                        }
                        Spacer()
                    }
                    .sheet(isPresented: $isShowingMailView) { self.mailView }
                }

            }
            .navigationBarTitle("Hourly Challenges")
            .listStyle(GroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.viewModel.refresh()
        }
    }
}

// MARK: - Auxiliar components

fileprivate extension DashboardView {

    var mailView: some View {
        MailViewControllerRepresentable(isShowing: self.$isShowingMailView,
                                        result: self.$result,
                                        emailTo: "rjps.dev@gmail.com",
                                        emailSubject: "Last Shelter - Hourly Challenge")
    }

    func listItem(weekDay: Int) -> some View {
        HStack {
            Image(systemName: viewModel.imageName(weekDay: weekDay)).frame(width: 28, height: 28).background(viewModel.color(weekDay: weekDay)).cornerRadius(6)
            VStack(alignment: .leading) {
                if Date.dayOfWeek == weekDay {
                    Text(viewModel.day(weekDay: weekDay)).bold()
                    Text(viewModel.mainTask(weekDay: weekDay))
                } else {
                    Text(viewModel.day(weekDay: weekDay))
                    Text(viewModel.mainTask(weekDay: weekDay)).foregroundColor(.gray)
                }
            }
        }
    }

    func weedDayDetailsBody(weekDay: Int, timeZone: Int) -> some View {
        return Text("")
    }
}

// MARK: - Preview

struct BasicApps_LastShelter1: PreviewProvider {
    static var previews: some View {
        DashboardViewBuilder.buildView().buildPreviews()
    }
}
