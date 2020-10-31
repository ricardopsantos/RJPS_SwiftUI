//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
//
import Utils
//
import App_Weather_Core

public extension VM {
    struct DailyWeatherRowViewModel: Identifiable {
        private let item: WeatherDto.WeeklyForecastEntity.Item

        public var id: String { return day + temperature + title }
        var day: String { return DateFormatters.dayFormatter.string(from: item.date) }
        var month: String { return DateFormatters.monthFormatter.string(from: item.date) }
        
        var temperature: String { return String(format: "%.1f", item.main.temp) }
        
        var title: String {
            guard let title = item.weather.first?.main.rawValue else { return "" }
            return title
        }
        
        var fullDescription: String {
            guard let description = item.weather.first?.weatherDescription else { return "" }
            return description
        }
        
        init(item: WeatherDto.WeeklyForecastEntity.Item) {
            self.item = item
        }
    }
}

// Used to hash on just the day in order to produce a single view model for each
// day when there are multiple items per each day.
extension VM.DailyWeatherRowViewModel: Hashable {
    public static func == (lhs: VM.DailyWeatherRowViewModel, rhs: VM.DailyWeatherRowViewModel) -> Bool {
        return lhs.day == rhs.day
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.day)
    }
}
