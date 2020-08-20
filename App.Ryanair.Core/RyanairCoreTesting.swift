//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import Utils

public struct RyanairCoreTesting {
    public init() { }
    public func test1() {
        let webAPI_A = APIRyanair_A()
        let webAPI_B = APIRyanair_B()
        let fetcher = FetcherRyanair(webAPI_A: webAPI_A, webAPI_B: webAPI_B)
        let stations = fetcher.stations(request: RyanairRequestDto.Stations(), cache: .cacheElseLoad)

        let request = RyanairRequestDto.Availability.sample
        let availability = fetcher.availability(request: request, cache: .cacheElseLoad)
        let response1 = stations.sink(receiveCompletion: { (result) in
            print(result)
        }) { (result) in
            print(result.stations.count)
        }
        let response2 = availability.sink(receiveCompletion: { (result) in
            print(result)
        }) { (result) in
            print(result)
        }

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 3))
        withExtendedLifetime(response2, {})
    }
}
