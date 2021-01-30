//
//  Created by Ricardo Santos on 22/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import Utils
import BaseDomain
import AppRyanairDomain

public extension RyanairMappers {

    static func listItemsWith(trips: [RyanairResponseDto.Trip]) -> [ListItemModel] {
        var acc: [ListItemModel] = []
        trips.forEach { (trip) in
            trip.flights.forEach { (flight) in
                let flightNumber = flight.flightNumber
                if let time = flight.timeUTC.first,
                   let dateWithTime = Date.with(time) {
                    let date = DateFormatters.medium.string(from: dateWithTime)
                    let title = "\(flightNumber), \(flight.regularFare!.fares.first!.amount)€"
                    let subTitle = "\(date)"
                    acc.append(ListItemModel(id: flight.id, title: title, subtitle: subTitle))
                }
            }
        }
        return acc
    }
}
