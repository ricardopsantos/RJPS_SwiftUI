//
//  LastShelter.swift
//  UglySwiftUIApp
//
//  Created by Ricardo Santos on 30/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

//swiftlint:disable cyclomatic_complexity

import Foundation
import UIKit
import SwiftUI
import Combine

// https://www.appgamer.com/last-shelter-survival/strategy-guide/hourly-challenges-schedule
// https://wwdcbysundell.com/2020/building-entire-apps-with-swiftui/

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

struct HourlyChallangeData {

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
        case 1, 7: return "Conquer the opposing State, Kill enemy soldiers"
        case 2: return "Gather resources"
        case 3: return "Upgrade Buildings"
        case 4: return "Complete Research"
        case 5: return "Recruit and Upgrade heroes, Defeat Zombies"
        case 6: return "Train troops"
        default: return ""
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
        } else if weekDay == 2 { // Monday
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
        } else if weekDay == 3 { // Tuesday
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
        } else if weekDay == 4 { // Wednesday
            switch hour {
            case "00", "08", "16": return "Use Any Speedups"
            case "01", "09", "17": return "Tech Research + Tech Research Speedups"
            case "02", "10", "18": return "Building Speedups + Tech Research Speedups + Training Speedups"
            case "03", "11", "19": return "Building + Tech Research + Craft Parts"
            case "04", "12", "20": return "Building + Tech Research + Craft Parts"
            case "05", "13", "21": return "Building Speedups + Tech Research Speedups + Training Speedups"
            case "06", "14", "22": return "Building + Tech Research + Training Speedups + Consume energy core"
            case "07", "15", "23": return "Building + Tech Research"
            default: return ""
            }
        } else if weekDay == 5 { // Thursday
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
        } else if weekDay == 6 { // Friday
            switch hour {
            case "00", "08", "16": return "Use Any Speedups"
            case "01", "09", "17": return "Building Speedups + Tech Research Speedups + Training Speedups"
            case "02", "10", "18": return "Building + Tech Research + Training Speedups"
            case "03", "11", "19": return "Training Speedups"
            case "04", "12", "20": return "Building + Tech Research + Training Speedups"
            case "05", "13", "21": return "Building + Training troops"
            case "06", "14", "22": return "Building + Training troops"
            case "07", "15", "23": return "Use Any Speedups"
            default: return ""
            }
        }
        return ""
    }

    static func taskNow(weekDay: Int, timeZone: Int) -> String {
        task(weekDay: weekDay, hour: getUserHour(diff: timeZone))
    }

    static func taskNext(weekDay: Int, timeZone: Int) -> String {
        task(weekDay: weekDay, hour: getUserHour(diff: timeZone+1))
    }

    static func listItem(weekDay: Int, timeZone: Int) -> some View {
        HStack {
            Image(systemName: "airplane").frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
            VStack(alignment: .leading) {
                Text(day(weekDay: weekDay)).bold()
                Text(mainTask(weekDay: weekDay))
            }
        }
    }

    static func weedDayDetailsBody(weekDay: Int, timeZone: Int) -> some View {
        let list = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
        return ForEach(list, id: \.self) { some in
            HStack(alignment: .top, spacing: 3) {
                if getUserHour(diff: timeZone) == some {
                    Divider()
                    Text(some).bold()
                    Text(HourlyChallangeData.task(weekDay: weekDay, hour: some)).bold()
                    Divider()
                } else {
                    Text(some)
                    Text(HourlyChallangeData.task(weekDay: weekDay, hour: some))
                }
             }
        }
    }
}

var gameTimer: Timer?
class Brain {
    static func doWork() {
        //gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }

    @objc static func runTimedCode() {
        print("running!!")
    }
}

struct BasicApps_LastShelterWeekConfig {
    static var backgroundColor = UIColor.clear// UIColor.systemGray6
    static var background : some View {
        ZStack { Color(backgroundColor).edgesIgnoringSafeArea(.all) }
    }
}

extension V {

    struct BasicApps_LastShelterWeek: View {
        @State private var timeZone: Int = 0
        @State private var counter: Int = 0
        @State var currentDate = Date()
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

        init() {
            Brain.doWork()
            //UINavigationBar.appearance().backgroundColor = BasicApps_LastShelterWeekConfig.backgroundColor
        }

        var body: some View {
            NavigationView {
                List {
                    Section {
                        Color(BasicApps_LastShelterWeekConfig.backgroundColor)
                        VStack {
                            Color(BasicApps_LastShelterWeekConfig.backgroundColor)
                            Text("Your time").bold()
                            Text("\(currentDate.formated)").onReceive(timer) { input in self.currentDate = input }
                            Text("Server time").bold()
                            Text("\(Date.serverTime(timeZone: timeZone))").onReceive(timer) { _ in }
                        }
                    }

                    Section {
                        Color(BasicApps_LastShelterWeekConfig.backgroundColor)
                        VStack {
                            Text("Current challenge").bold()
                            Text("\(HourlyChallangeData.taskNow(weekDay: Date.dayOfWeek!, timeZone: timeZone))")
                            Text("Next challenge").bold()
                            Text("\(HourlyChallangeData.taskNext(weekDay: Date.dayOfWeek!, timeZone: timeZone))")
                        }
                    }

                    Section {
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 1, timeZone: timeZone)) { HourlyChallangeData.listItem(weekDay: 1, timeZone: timeZone) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 2, timeZone: timeZone)) { HourlyChallangeData.listItem(weekDay: 2, timeZone: timeZone) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 3, timeZone: timeZone)) { HourlyChallangeData.listItem(weekDay: 3, timeZone: timeZone) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 4, timeZone: timeZone)) { HourlyChallangeData.listItem(weekDay: 4, timeZone: timeZone) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 5, timeZone: timeZone)) { HourlyChallangeData.listItem(weekDay: 5, timeZone: timeZone) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 6, timeZone: timeZone)) { HourlyChallangeData.listItem(weekDay: 6, timeZone: timeZone) }
                        NavigationLink(destination: V.LastShelter_DayDetails(weekDay: 7, timeZone: timeZone)) { HourlyChallangeData.listItem(weekDay: 7, timeZone: timeZone) }
                    }

                    Stepper(value: $timeZone) { Text("TimeZone: \(timeZone)") }

                    Section {
                        NavigationLink(destination: Text("Detail View")) {
                            HStack {
                                ZStack {
                                    Image(systemName: "app.badge").font(.callout)
                                }.frame(width: 28, height: 28).background(Color.red).cornerRadius(6)
                                Text("Notifications")
                            }
                        }
                        NavigationLink(destination: Text("Detail View")) {
                            HStack {
                                ZStack {
                                    Image(systemName: "gear").font(.callout)
                                }.frame(width: 28, height: 28).background(Color.gray).cornerRadius(6)
                                Text("General")
                            }
                        }
                    }
                }
                .navigationBarTitle("Hourly Challenges")
                //.listStyle(GroupedListStyle())
            .padding()
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
        var body : some View {
            ZStack {
                ScrollView {
                    VStack {
                        Text(HourlyChallangeData.day(weekDay: weekDay)).bold()
                        Text(HourlyChallangeData.mainTask(weekDay: weekDay)).bold()
                    }
                    Divider()
                    HourlyChallangeData.weedDayDetailsBody(weekDay: weekDay, timeZone: timeZone)
                }
            }
        }
    }
}

struct BasicApps_LastShelter: PreviewProvider {
    static var previews: some View {
        V.BasicApps_LastShelterWeek()
    }
}
