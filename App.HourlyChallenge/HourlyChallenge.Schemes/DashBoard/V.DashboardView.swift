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
import Designables
import ControllerRepresentables

// MARK: - Preview

struct BasicApps_LastShelter: PreviewProvider {
    static var previews: some View {
        DashboardViewBuilder.buildView()
    }
}

// MARK: - View

public struct DashboardView: View {
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentDate = Date()
    @State private var result: Result<MFMailComposeResult, Error>?
    @State private var isShowingMailView = false

    @ObservedObject private var viewModel: DashBoardViewModel
    public init(viewModel: DashBoardViewModel) {
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
                            Text("\(Date.serverTime(timeZone: viewModel.timeZoneServer))").onReceive(timer) { _ in }.font(.footnote)
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
                            Text("\(viewModel.taskNow)").font(.title).bold()
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
                            Text("\(viewModel.taskNext1)").font(.footnote)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("\(viewModel.taskNext2)").font(.footnote)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("\(viewModel.taskNext3)").font(.footnote)
                            Spacer()
                        }
                    }
                }

                Stepper(value: $viewModel.settings.timeZone) { Text("Adjust TimeZone: \(viewModel.settings.timeZone)") }

                Section {
                    NavigationLink(destination: DayDetailsViewBuilder.buildView(weekDay: 1, timeZone: viewModel.timeZoneServer)) { listItem(weekDay: 1, timeZone: viewModel.timeZoneServer) }
                    NavigationLink(destination: DayDetailsViewBuilder.buildView(weekDay: 2, timeZone: viewModel.timeZoneServer)) { listItem(weekDay: 2, timeZone: viewModel.timeZoneServer) }
                    NavigationLink(destination: DayDetailsViewBuilder.buildView(weekDay: 3, timeZone: viewModel.timeZoneServer)) { listItem(weekDay: 3, timeZone: viewModel.timeZoneServer) }
                    NavigationLink(destination: DayDetailsViewBuilder.buildView(weekDay: 4, timeZone: viewModel.timeZoneServer)) { listItem(weekDay: 4, timeZone: viewModel.timeZoneServer) }
                    NavigationLink(destination: DayDetailsViewBuilder.buildView(weekDay: 5, timeZone: viewModel.timeZoneServer)) { listItem(weekDay: 5, timeZone: viewModel.timeZoneServer) }
                    NavigationLink(destination: DayDetailsViewBuilder.buildView(weekDay: 6, timeZone: viewModel.timeZoneServer)) { listItem(weekDay: 6, timeZone: viewModel.timeZoneServer) }
                    NavigationLink(destination: DayDetailsViewBuilder.buildView(weekDay: 7, timeZone: viewModel.timeZoneServer)) { listItem(weekDay: 7, timeZone: viewModel.timeZoneServer) }
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
                    .sheet(isPresented: $isShowingMailView) { self.mailView() }
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

    func mailView() -> some View {
        ControllerRepresentable_MailView(isShowing: self.$isShowingMailView, result: self.$result, emailTo: "rjps.dev@gmail.com", emailSubject: "Last Shelter - Hourly Challenge")
    }

    func listItem(weekDay: Int, timeZone: Int) -> some View {
        HStack {
           // Image(systemName: "viewModel.imageName(weekDay: weekDay)").frame(width: 28, height: 28).background(viewModel.color(weekDay: weekDay).collect()).cornerRadius(6)
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
