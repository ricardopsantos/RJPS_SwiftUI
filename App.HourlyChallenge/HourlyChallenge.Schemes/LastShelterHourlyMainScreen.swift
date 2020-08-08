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

public struct Dashboard: View {
    private var timeZoneServer: Int { return timeZoneUser - 3 }
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject private var settings = LastShelterUserSettings()
    @State private var showTimeZone: Bool = true
    @State private var timeZoneUser: Int = 0
    @State private var counter: Int = 0
    @State private var currentDate = Date()
    @State private var result: Result<MFMailComposeResult, Error>?
    @State private var isShowingMailView = false

    private var viewModel = VM.Hourly_ViewModel(fetcher: Fetcher())
    public init() { }

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
                            Text("\(Date.serverTime(timeZone: timeZoneServer))").onReceive(timer) { _ in }.font(.footnote)
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
                            Text("\(viewModel.taskNow(weekDay: Date.dayOfWeek!, timeZone: timeZoneServer))").font(.title).bold()
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
                            Text("- \(viewModel.taskNext(weekDay: Date.dayOfWeek!, timeZone: timeZoneServer, next: 1))").font(.footnote)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("- \(viewModel.taskNext(weekDay: Date.dayOfWeek!, timeZone: timeZoneServer, next: 2))").font(.footnote)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("- \(viewModel.taskNext(weekDay: Date.dayOfWeek!, timeZone: timeZoneServer, next: 3))").font(.footnote)
                            Spacer()
                        }
                    }
                }

                if showTimeZone {
                    Stepper(value: $timeZoneUser,
                            onEditingChanged: { _ in self.settings.timeZone = self.timeZoneUser }) { Text("Adjust TimeZone: \(timeZoneUser)") }.onAppear {
                                self.timeZoneUser = self.settings.timeZone
                    }
                }

                Section {
                    NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 1, timeZone: timeZoneServer)) { viewModel.listItem(weekDay: 1, timeZone: timeZoneServer) }
                    NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 2, timeZone: timeZoneServer)) { viewModel.listItem(weekDay: 2, timeZone: timeZoneServer) }
                    NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 3, timeZone: timeZoneServer)) { viewModel.listItem(weekDay: 3, timeZone: timeZoneServer) }
                    NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 4, timeZone: timeZoneServer)) { viewModel.listItem(weekDay: 4, timeZone: timeZoneServer) }
                    NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 5, timeZone: timeZoneServer)) { viewModel.listItem(weekDay: 5, timeZone: timeZoneServer) }
                    NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 6, timeZone: timeZoneServer)) { viewModel.listItem(weekDay: 6, timeZone: timeZoneServer) }
                    NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 7, timeZone: timeZoneServer)) { viewModel.listItem(weekDay: 7, timeZone: timeZoneServer) }
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
                    .sheet(isPresented: $isShowingMailView) {
                        ControllerRepresentable_MailView(isShowing: self.$isShowingMailView,
                                 result: self.$result,
                                 emailTo: "rjps.dev@gmail.com",
                                 emailSubject: "Last Shelter - Hourly Challenge")
                    }
                }

            }
            .navigationBarTitle("Hourly Challenges")
            .listStyle(GroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {}
    }
}

struct BasicApps_LastShelter: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
