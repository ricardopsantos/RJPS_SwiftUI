//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

public extension VM {
    struct CurrentWeatherRow_ViewModel {
        private let item: E.CurrentWeatherForecastEntity
        
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
        
        init(item: E.CurrentWeatherForecastEntity) {
            self.item = item
        }
    }
}
