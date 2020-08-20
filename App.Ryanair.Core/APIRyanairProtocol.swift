//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import Base_Domain

// https://tripstest.ryanair.com/static/stations.json
public protocol APIRyanairProtocol {
    func stations(cache: CachePolicy) -> AnyPublisher<RyanairDto.Stations, APIError>
    func availability(cache: CachePolicy) -> AnyPublisher<RyanairDto.Availability, APIError>
}
