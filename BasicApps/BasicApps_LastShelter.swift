//
//  LastShelter.swift
//  UglySwiftUIApp
//
//  Created by Ricardo Santos on 30/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

// https://www.appgamer.com/last-shelter-survival/strategy-guide/hourly-challenges-schedule
// https://wwdcbysundell.com/2020/building-entire-apps-with-swiftui/

extension Date {
    static func dayNumberOfWeek() -> Int? {
        // Friday -> 6
        return Calendar.current.dateComponents([.weekday], from: Date()).weekday
    }
}

func getHour() -> String {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    if hour < 10 {
        return "0\(hour)"
    } else {
        return "\(hour)"
    }
}

// https://www.appsdeveloperblog.com/local-user-notifications-with-unusernotificationcenter/
class LastShelterNotifications {
    static func ask() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert)
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (_, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }

    static var notificationContent: UNMutableNotificationContent {
        // Create new notifcation content instance
       /* let notificationContent = UNMutableNotificationContent()
        //notificationContent.title = "Hourly challange"
        if Date.dayNumberOfWeek() == 0 {
            notificationContent.subtitle = "\(Days.Wednesday.taskNow) | \(Date())"
        }
        if Date.dayNumberOfWeek() == 1 {
            notificationContent.subtitle = "\(Days.Wednesday.taskNow) | \(Date())"
        }
        if Date.dayNumberOfWeek() == 2 {
            notificationContent.subtitle = "\(Days.Wednesday.taskNow) | \(Date())"
        }
        if Date.dayNumberOfWeek() == 3 {
            notificationContent.subtitle = "\(Days.Wednesday.taskNow) | \(Date())"
        }
        if Date.dayNumberOfWeek() == 4 {
            notificationContent.subtitle = "\(Days.Wednesday.taskNow) | \(Date())"
        }
        if Date.dayNumberOfWeek() == 5 {
            notificationContent.subtitle = "\(Days.Wednesday.taskNow) | \(Date())"
        }
        if Date.dayNumberOfWeek() == 6 {
            notificationContent.subtitle = "\(Days.Wednesday.taskNow) | \(Date())"
        }*/
        return notificationContent
    }

    static func make() {
/*
        UIApplication application = UIApplication.SharedApplication;
        foreach (UILocalNotification localnotifiation in application.ScheduledLocalNotifications) {
            application.CancelLocalNotification(localnotifiation);
        }

        let trigger_1 = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request_1 = UNNotificationRequest(identifier: "testNotification_1", content: notificationContent, trigger: trigger_1)

        UNUserNotificationCenter.current().add(request_1) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }*/
    }
}

enum Days {
    enum Monday: String, CaseIterable {
        case t00 = "00"
        case t01 = "01"
        case t02 = "02"
        case t03 = "03"
        case t04 = "04"
        case t05 = "05"
        case t06 = "06"
        case t07 = "07"
        case t08 = "08"
        case t09 = "09"
        case t10 = "10"
        case t11 = "11"
        case t12 = "12"
        case t13 = "13"
        case t14 = "14"
        case t15 = "15"
        case t16 = "16"
        case t17 = "17"
        case t18 = "18"
        case t19 = "19"
        case t20 = "20"
        case t21 = "21"
        case t22 = "22"
        case t23 = "23"

        static var weekData: Int { return 6 }
        static var day: String { return "Monday" }
        static var mainTask: String { return "CoZ Gathering Day" }
        var task: String {
            switch self {
            case .t00, .t08, .t16: return "Building + Building Speedups"
            case .t01, .t09, .t17: return "Building"
            case .t02, .t10, .t18: return "Use Training Speedups + Spend VIP points"
            case .t03, .t11, .t19: return "Building + Training troops + Spend VIP points"
            case .t04, .t12, .t20: return "Building Speedups + Research Speedups + Training Speedups"
            case .t05, .t13, .t21: return "Building + Tech Research + Training Speedups"
            case .t06, .t14, .t22: return "Building + Tech Research + Training troops"
            case .t07, .t15, .t23: return "Building"

            }
        }

        static var taskNow: String { Self(rawValue: getHour())!.task }
        static var listItem : some View {
            HStack {
                Image(systemName: "airplane").frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                VStack(alignment: .leading) {
                    Text(Self.day).bold()
                    Text(Self.taskNow)
                }
            }
        }
        static var body : some View {
            ForEach(Self.allCases, id: \.self) { some in
                HStack(alignment: .top, spacing: 3) {
                    if getHour() == some.rawValue {
                        Text(some.rawValue).bold()
                        Text(some.task).bold()
                    } else {
                        Text(some.rawValue)
                        Text(some.task)
                    }
                 }
            }
        }
    }

    enum Tuesday: String, CaseIterable {
        case t00 = "00"
        case t01 = "01"
        case t02 = "02"
        case t03 = "03"
        case t04 = "04"
        case t05 = "05"
        case t06 = "06"
        case t07 = "07"
        case t08 = "08"
        case t09 = "09"
        case t10 = "10"
        case t11 = "11"
        case t12 = "12"
        case t13 = "13"
        case t14 = "14"
        case t15 = "15"
        case t16 = "16"
        case t17 = "17"
        case t18 = "18"
        case t19 = "19"
        case t20 = "20"
        case t21 = "21"
        case t22 = "22"
        case t23 = "23"

        static var weekData: Int { return 2 }
        static var day: String { return "Tuesday" }
        static var mainTask: String { return "CoZ Building Day" }
        var task: String {
            switch self {
            case .t00, .t08, .t16: return "Building + Craft Parts"
            case .t01, .t09, .t17: return "Building + Tech Research + Training Speedups"
            case .t02, .t10, .t18: return "Building + Craft Parts"
            case .t03, .t11, .t19: return "Use Any Speedups"
            case .t04, .t12, .t20: return "Building + Tech Research"
            case .t05, .t13, .t21: return "Building + Building Speedups + Consume energy core"
            case .t06, .t14, .t22: return "Building + Tech Research"
            case .t07, .t15, .t23: return "Building + Tech Research + Training troops"

            }
        }

        static var taskNow: String { Self(rawValue: getHour())!.task }
        static var listItem : some View {
            HStack {
                Image(systemName: "airplane").frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                VStack(alignment: .leading) {
                    Text(Self.day).bold()
                    Text(Self.taskNow)
                }
            }
        }
        static var body : some View {
            return ForEach(Self.allCases, id: \.self) { some in
                HStack(alignment: .top, spacing: 3) {
                    if getHour() == some.rawValue {
                        Text(some.rawValue).bold()
                        Text(some.task).bold()
                    } else {
                        Text(some.rawValue)
                        Text(some.task)
                    }
                 }
            }
        }
    }

}

var gameTimer: Timer?
class Brain {
    static func doWork() {
        gameTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }

    @objc static func runTimedCode() {
        print("Hi")
    }
}

extension V {

    struct BasicApps_LastShelterWeek: View {
        var monday = V.LastShelter_DayDetails(day: Days.Monday.day, task: Days.Monday.mainTask)
        var tuesday = V.LastShelter_DayDetails(day: Days.Tuesday.day, task: Days.Tuesday.mainTask)
        func challange() -> String {
            if Date.dayNumberOfWeek() == Days.Monday.weekData { return Days.Monday.taskNow }
            if Date.dayNumberOfWeek() == Days.Tuesday.weekData { return Days.Tuesday.taskNow }
            return ""
        }
        var body: some View {
            NavigationView {
                List {
                    Text("Server time: \(Date()) | \(challange())")
                    Section {
                        NavigationLink(destination: monday) { Days.Monday.listItem }
                        NavigationLink(destination: tuesday) { Days.Tuesday.listItem }
                    }

                    /*
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
                    }*/
                }
                .navigationBarTitle("Hourly Challanges")
                .listStyle(GroupedListStyle())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear { Brain.doWork() }
        }
    }
}

extension V {
    struct LastShelter_DayDetails: View {
        var day: String
        var task: String
        var body : some View {
            ZStack {
                ScrollView {
                    VStack {
                        Text(day).bold()
                        Text(task).bold()
                    }
                    Divider()
                    if day == Days.Monday.day { Days.Monday.body }
                    if day == Days.Tuesday.day { Days.Tuesday.body }
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
