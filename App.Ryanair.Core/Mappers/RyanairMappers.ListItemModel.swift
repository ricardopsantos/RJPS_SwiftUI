//
//  Created by Ricardo Santos on 22/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import Utils
import Utils_Extensions
//
import Base_Domain
public extension RyanairMappers {

    static func listItemsWith(trips: [RyanairResponseDto.Trip]) -> [ListItemModel] {
        var acc: [ListItemModel] = []
        trips.forEach { (trip) in
            trip.flights.forEach { (flight) in
                let flightNumber = flight.flightNumber
                let (date) = DateFormatters.medium.string(from: Date.with(string: flight.timeUTC.first!))
                let title = "\(flightNumber)"
                let subTitle = "\(flight.regularFare!.fares.first!.amount)€ | \(date)"
                acc.append(ListItemModel(id: flight.id, title: title, subtitle: subTitle))
            }
        }
        return acc
    }
}
