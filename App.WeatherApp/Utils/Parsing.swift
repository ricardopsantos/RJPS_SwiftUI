//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, E.WeatherError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970

    return Just(data).decode(type: T.self, decoder: decoder).mapError { error in
        .parsing(description: error.localizedDescription)
    }.eraseToAnyPublisher()
}
