//
//  Created by Ricardo Santos on 07/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

//swiftlint:disable cyclomatic_complexity
/*
import Foundation
import UIKit
import SwiftUI
import Combine
//
import UtilsExtensions

public class Fetcher {
    public init() { }
    public static var shared = Fetcher()
}

extension Fetcher: APIProtocol {
    public func day(weekDay: Int) -> AnyPublisher<String, E.HourlyErrorEntity> {
        return Just(HourlyChallengeData.day(weekDay: weekDay))
            .mapError { error in
            os_log("Error : \(error)", type: .error)
            return .customError(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
    public func mainTask(weekDay: Int) -> AnyPublisher<String, E.HourlyErrorEntity> {
        return Just(HourlyChallengeData.mainTask(weekDay: weekDay))
            .mapError { error in
            os_log("Error : \(error)", type: .error)
            return .customError(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
    public func imageName(weekDay: Int) -> AnyPublisher<String, E.HourlyErrorEntity> {
        return Just(HourlyChallengeData.imageName(weekDay: weekDay))
            .mapError { error in
            os_log("Error : \(error)", type: .error)
            return .customError(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
    public func color(weekDay: Int) -> AnyPublisher<Color, E.HourlyErrorEntity> {
        return Just(HourlyChallengeData.color(weekDay: weekDay))
            .mapError { error in
            os_log("Error : \(error)", type: .error)
            return .customError(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
    public func task(weekDay: Int, hour: String) -> AnyPublisher<String, E.HourlyErrorEntity> {
        return Just(HourlyChallengeData.task(weekDay: weekDay, hour: hour))
            .mapError { error in
            os_log("Error : \(error)", type: .error)
            return .customError(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
}

fileprivate struct HourlyChallengeData {

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
}
*/
