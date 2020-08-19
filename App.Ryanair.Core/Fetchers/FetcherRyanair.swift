//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public class FetcherRyanair {
    private let session: URLSession
    public init(session: URLSession = .shared) {
        self.session = session
    }
}
