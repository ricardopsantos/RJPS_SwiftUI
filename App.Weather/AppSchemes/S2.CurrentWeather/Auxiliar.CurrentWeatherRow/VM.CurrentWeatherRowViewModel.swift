//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit
//
import App_Weather_Core

public extension VM {
    struct CurrentWeatherRowViewModel {
        private let item: WeatherDto.CurrentWeatherForecastEntity
        
        var temperature: String {
            return String(format: "%.1f", item.main.temperature)
        }
        
        var maxTemperature: String {
            return String(format: "%.1f", item.main.maxTemperature)
        }
        
        var minTemperature: String {
            return String(format: "%.1f", item.main.minTemperature)
        }
        
        var humidity: String {
            return String(format: "%.1f", item.main.humidity)
        }
        
        var coordinate: CLLocationCoordinate2D {
            return CLLocationCoordinate2D.init(latitude: item.coord.lat, longitude: item.coord.lon)
        }
        
        init(item: WeatherDto.CurrentWeatherForecastEntity) {
            self.item = item
        }
    }
}
