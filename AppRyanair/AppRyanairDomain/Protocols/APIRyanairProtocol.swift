//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
//
import RJSLibUFBase
import RJSLibUFNetworking
//
import BaseDomain

// https://tripstest.ryanair.com/static/stations.json
public protocol APIRyanairProtocol {
    func stations(request: RequestDto.Stations, cache: CachePolicy) -> AnyPublisher<ResponseDto.Stations, APIError>
    func availability(request: RequestDto.Availability, cache: CachePolicy) -> AnyPublisher<ResponseDto.Availability, APIError>
}
