//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

 public enum APIError: Error {
    case ok // no error
    case genericError 
    case cacheNotFound // no error
    case parsing(description: String)
    case network(description: String)
    case failedWithStatusCode(code: Int)
}
