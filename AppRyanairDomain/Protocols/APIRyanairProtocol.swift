//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import BaseDomain

// https://tripstest.ryanair.com/static/stations.json
public protocol APIRyanairProtocol {
    func stations(request: RyanairRequestDto.Stations, cache: CachePolicy) -> AnyPublisher<RyanairResponseDto.Stations, APIError>
    func availability(request: RyanairRequestDto.Availability, cache: CachePolicy) -> AnyPublisher<RyanairResponseDto.Availability, APIError>
}
