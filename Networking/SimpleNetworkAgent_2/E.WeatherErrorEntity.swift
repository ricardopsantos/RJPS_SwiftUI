//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

 public enum APIErrorEntity: Error {
    case parsing(description: String)
    case network(description: String)
}
