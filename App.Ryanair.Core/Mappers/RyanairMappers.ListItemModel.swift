//
//  Created by Ricardo Santos on 22/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import Base_Domain

public extension RyanairMappers {

    static func listItemsWith(trips: [RyanairResponseDto.Trip]) -> [ListItemModel] {
        var acc: [ListItemModel] = []
        trips.forEach { (trip) in
            trip.flights.forEach { (flight) in
                let flightNumber = flight.flightNumber
                let duration = flight.duration
                let timeUTC = flight.timeUTC
                let title = "\(flightNumber) | \(timeUTC)"
                let subTitle = "\(duration)"
                acc.append(ListItemModel(id: flight.id, title: title, subtitle: subTitle))
            }
        }
        return acc
    }
}
