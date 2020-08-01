//
//  LastShelter.swift
//  UglySwiftUIApp
//
//  Created by Ricardo Santos on 30/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

//
// Solving this : https://www.appgamer.com/last-shelter-survival/strategy-guide/hourly-challenges-schedule
// https://wwdcbysundell.com/2020/building-entire-apps-with-swiftui/
//

//swiftlint:disable cyclomatic_complexity

import Foundation
import UIKit
import SwiftUI
import Combine
import MessageUI

@propertyWrapper
struct LastShelterUserDefault<T> {
    let key: String
    let defaultValue: T
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    var wrappedValue: T {
        get {
            let result = UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
            //print("result: \(result)")
            return result
        }
        set {
            //print("new: \(newValue)")
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

final class LastShelterUserSettings: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    @LastShelterUserDefault("appDefaults.TimeZone", defaultValue: 0)
    var timeZone: Int {
        willSet {
            objectWillChange.send()
        }
    }
}

extension Date {
    static var dayOfWeek: Int? {
        // Friday -> 6
        return Calendar.current.dateComponents([.weekday], from: Date()).weekday
    }

    static func serverTime(timeZone: Int) -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 60 * 60 * timeZone)
        formatter.dateFormat = "MMMM-dd-yyyy HH:mm:ss"
        let datetime = formatter.string(from: now)
        return "\(datetime)"
    }

    var formated: String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM-dd-yyyy HH:mm:ss"
        let datetime = formatter.string(from: now)
        return "\(datetime)"
    }
}

func getUserHour(diff: Int) -> String {
    let calendar = Calendar.current
    let date1 = Date()
    let date2 = calendar.date(byAdding: .hour, value: diff, to: date1)
    let hour = calendar.component(.hour, from: date2!)
    if hour < 10 {
        return "0\(hour)"
    } else {
        return "\(hour)"
    }
}

struct HourlyChallengeData {

    static func day(weekDay: Int) -> String {
        switch weekDay {
        case 1: return "Sunday"
        case 2: return "Monday"
        case 3: return "Tuesday"
        case 4: return "Wednesday"
        case 5: return "Thursday"
        case 6: return "Friday"
        case 7: return "Saturday"
        default: return ""
        }
    }

    static func mainTask(weekDay: Int) -> String {
        switch weekDay {
        case 1, 7: return "Conquer State, Kill enemy soldiers"
        case 2: return "Gather resources"
        case 3: return "Upgrade Buildings"
        case 4: return "Complete Research"
        case 5: return "Upgrade heroes, Defeat Zombies"
        case 6: return "Train troops"
        default: return ""
        }
    }

    static func imageName(weekDay: Int) -> String {
        switch weekDay {
        case 1, 7: return "map"
        case 2: return "cart"
        case 3: return "hammer"
        case 4: return "magnifyingglass"
        case 5: return "person.3"
        case 6: return "xmark.shield"
        default: return ""
        }
    }

    static func color(weekDay: Int) -> Color {
        let alpha: CGFloat = Date.dayOfWeek == weekDay ? 1 : 0.25
        switch weekDay {
        case 1, 7: return Color(UIColor.systemRed.withAlphaComponent(alpha))
        case 2: return Color(UIColor.systemGreen.withAlphaComponent(alpha))
        case 3: return Color(UIColor.systemGray.withAlphaComponent(alpha))
        case 4: return Color(UIColor.systemTeal.withAlphaComponent(alpha))
        case 5: return Color(UIColor.purple.withAlphaComponent(alpha))
        case 6: return Color(UIColor.orange.withAlphaComponent(alpha))
        default: return Color(UIColor.red.withAlphaComponent(alpha))
        }
    }

    static func task(weekDay: Int, hour: String) -> String {
        if weekDay == 1 || weekDay == 7 { // Sunday / Saturday
            switch hour {
            case "00", "08", "16": return "Use Any Speedups"
            case "01", "09", "17": return "Tech Research + Tech Speedups"
            case "02", "10", "18": return "Building + Building Speedups"
            case "03", "11", "19": return "Use Training Speedups"
            case "04", "12", "20": return "Building + Tech Research + Training Speedups"
            case "05", "13", "21": return "Building + Tech Research + Training Speedups"
            case "06", "14", "22": return "Building + Training troops"
            case "07", "15", "23": return "Tech Research + Training troops"
            default: return ""
            }
        } else if weekDay == 2 { // Monday : Gathering
            switch hour {
            case "00", "08", "16": return "Building + Craft Parts"
            case "01", "09", "17": return "Building + Tech Research + Training Speedups"
            case "02", "10", "18": return "Building + Craft Parts"
            case "03", "11", "19": return "Use Any Speedups"
            case "04", "12", "20": return "Building + Tech Research"
            case "05", "13", "21": return "Building + Building Speedups + Consume energy core"
            case "06", "14", "22": return "Building + Tech Research"
            case "07", "15", "23": return "Building + Tech Research + Training troops"
            default: return ""
            }
        } else if weekDay == 3 { // Tuesday : Buildings
            switch hour {
            case "00", "08", "16": return "Building".uppercased() + " + Craft Parts"
            case "01", "09", "17": return "Building".uppercased() + " + Tech Research + Training Speedups"
            case "02", "10", "18": return "Building".uppercased() + " + Craft Parts"
            case "03", "11", "19": return "Use Any Speedups"
            case "04", "12", "20": return "Building".uppercased() + " + Tech Research"
            case "05", "13", "21": return "Building + Building Speedups".uppercased() + " + Consume energy core"
            case "06", "14", "22": return "Building".uppercased() + " + Tech Research"
            case "07", "15", "23": return "Building".uppercased() + " + Tech Research + Training troops"
            default: return ""
            }
        } else if weekDay == 4 { // Wednesday : Research
            switch hour {
            case "00", "08", "16": return "Use Any Speedups"
            case "01", "09", "17": return "Tech Research + Tech Research Speedups"
            case "02", "10", "18": return "Building Speedups + Tech Research Speedups + Training Speedups"
            case "03", "11", "19": return "Building" + " + Tech Research".uppercased() + " + Craft Parts"
            case "04", "12", "20": return "Building + " + "Tech Research".uppercased()  + " + Craft Parts"
            case "05", "13", "21": return "Building Speedups + Tech Research Speedups + Training Speedups"
            case "06", "14", "22": return "Building + " + "Tech Research".uppercased() + " + Training Speedups + Consume energy core"
            case "07", "15", "23": return "Building + " + "Tech Research".uppercased()
            default: return ""
            }
        } else if weekDay == 5 { // Thursday :  Heroes + Zombies
            switch hour {
            case "00", "08", "16": return "Hero Recruitment + Kill Zombies"
            case "01", "09", "17": return "All Hero Development"
            case "02", "10", "18": return "Spend / Acquire Wisdom Medals + Kill Zombies"
            case "03", "11", "19": return "All Hero Development"
            case "04", "12", "20": return "Hero Recruitment + Spend Wisdom Medals"
            case "05", "13", "21": return "All Hero Development"
            case "06", "14", "22": return "Spend / Acquire Wisdom Medals + Kill Zombies"
            case "07", "15", "23": return "All Hero Development"
            default: return ""
            }
        } else if weekDay == 6 { // Friday : Training Troops
            switch hour {
            case "00", "08", "16": return "Use Any Speedups"
            case "01", "09", "17": return "Building Speedups + Tech Research Speedups + Training Speedups"
            case "02", "10", "18": return "Building + Tech Research + Training Speedups"
            case "03", "11", "19": return "Training Speedups"
            case "04", "12", "20": return "Building + Tech Research + Training Speedups"
            case "05", "13", "21": return "Building + " + "Training troops".uppercased()
            case "06", "14", "22": return "Building + " + "Training troops".uppercased()
            case "07", "15", "23": return "Use Any Speedups"
            default: return ""
            }
        }
        return ""
    }

    static func taskNow(weekDay: Int, timeZone: Int) -> String {
        task(weekDay: weekDay, hour: getUserHour(diff: timeZone))
    }

    static func taskNext(weekDay: Int, timeZone: Int, next: Int) -> String {
        task(weekDay: weekDay, hour: getUserHour(diff: timeZone+next))
    }

    static func listItem(weekDay: Int, timeZone: Int) -> some View {
        HStack {
            Image(systemName: imageName(weekDay: weekDay)).frame(width: 28, height: 28).background(color(weekDay: weekDay)).cornerRadius(6)
            VStack(alignment: .leading) {
                if Date.dayOfWeek == weekDay {
                    Text(day(weekDay: weekDay)).font(.headline).bold()
                    Text(mainTask(weekDay: weekDay)).font(.headline).bold()
                } else {
                    Text(day(weekDay: weekDay))
                    Text(mainTask(weekDay: weekDay))
                }
            }
        }
    }

    static func weedDayDetailsBody(weekDay: Int, timeZone: Int) -> some View {
        return Text("")
    }
}

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
                            MailView(isShowing: self.$isShowingMailView,
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
                            if getUserHour(diff: self.timeZone) == some {
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
