//
//  Created by Ricardo Santos on 14/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension UserDefaults {
    func save(kvStorableRecord: GenericStorableKeyValueModel) {
        UserDefaults.standard.set(kvStorableRecord.toData, forKey: kvStorableRecord.key)
    }
}

public extension UserDefaults {
    /**
    [Source](https://medium.com/swlh/a-type-safe-userdefaults-in-swift-45a5cfc54b1b)

    ```
    UserDefaults.standard.userID = "123"
    if let userID = UserDefaults.standard.userID {
        print(userID)
    }
    ```
    */

    var userID: String? {
        get { return string(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
}
