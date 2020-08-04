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

extension V {

    struct BasicApps_LastShelterWeek: View {
        private var timeZoneServer: Int { return timeZoneUser - 2 }
        private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        @ObservedObject private var settings = LastShelterUserSettings()
        @State private var showTimeZone: Bool = true
        @State private var timeZoneUser: Int = 0
        @State private var counter: Int = 0
        @State private var currentDate = Date()
        @State private var result: Result<MFMailComposeResult, Error>?
        @State private var isShowingMailView = false

        init() { }

        var body: some View {
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
                                Text("\(HourlyChallengeData.taskNow(weekDay: Date.dayOfWeek!, timeZone: timeZoneServer))").font(.title).bold()
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
                                Text("- \(HourlyChallengeData.taskNext(weekDay: Date.dayOfWeek!, timeZone: timeZoneServer, next: 1))").font(.footnote)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text("- \(HourlyChallengeData.taskNext(weekDay: Date.dayOfWeek!, timeZone: timeZoneServer, next: 2))").font(.footnote)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text("- \(HourlyChallengeData.taskNext(weekDay: Date.dayOfWeek!, timeZone: timeZoneServer, next: 3))").font(.footnote)
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
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 1, timeZone: timeZoneServer)) { HourlyChallengeData.listItem(weekDay: 1, timeZone: timeZoneServer) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 2, timeZone: timeZoneServer)) { HourlyChallengeData.listItem(weekDay: 2, timeZone: timeZoneServer) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 3, timeZone: timeZoneServer)) { HourlyChallengeData.listItem(weekDay: 3, timeZone: timeZoneServer) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 4, timeZone: timeZoneServer)) { HourlyChallengeData.listItem(weekDay: 4, timeZone: timeZoneServer) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 5, timeZone: timeZoneServer)) { HourlyChallengeData.listItem(weekDay: 5, timeZone: timeZoneServer) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 6, timeZone: timeZoneServer)) { HourlyChallengeData.listItem(weekDay: 6, timeZone: timeZoneServer) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 7, timeZone: timeZoneServer)) { HourlyChallengeData.listItem(weekDay: 7, timeZone: timeZoneServer) }
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
}

extension V {
    struct LastShelter_DayDetails: View {
        var weekDay: Int
        var timeZone: Int
        let list = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
        var body : some View {
            ScrollView {
                VStack {
                    Text(HourlyChallengeData.day(weekDay: weekDay)).font(.title)
                    Spacer()
                    Text("Current challenge: ").font(.footnote).bold()
                    Text(HourlyChallengeData.taskNow(weekDay: weekDay, timeZone: timeZone))
                }.scaledToFill().padding(.vertical)
                Spacer()
                Text("Today Challenges Schedule").font(.title)
                ForEach(list, id: \.self) { some in
                    VStack {
                        Divider()
                        HStack(alignment: .top, spacing: 3) {
                            if Date.getUserHour(diff: self.timeZone) == some {
                                Text("\(some):00").font(.headline).bold()
                                Text(HourlyChallengeData.task(weekDay: self.weekDay, hour: some)).font(.headline).bold()
                            } else {
                                Text("\(some):00 ")
                                Text(HourlyChallengeData.task(weekDay: self.weekDay, hour: some))
                            }
                        }
                    }
                 }
            }.padding(.horizontal)
        }
    }
}

struct BasicApps_LastShelter: PreviewProvider {
    static var previews: some View {
        V.BasicApps_LastShelterWeek()
    }
}
