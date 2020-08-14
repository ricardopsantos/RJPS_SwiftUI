//
//  Created by Ricardo Santos on 14/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

public extension UserDefaults {
    func save(kvStorableRecord: GenericKeyValueStorableRecord) {
        UserDefaults.standard.set(kvStorableRecord.toData, forKey: kvStorableRecord.key)
    }
}
