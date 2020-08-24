//
//  Created by Ricardo Santos on 23/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    func clearText(andReplaceWith newText: String? = nil) {
        tap()
        press(forDuration: 1.0)
        var select = XCUIApplication().menuItems["Select All"]

        if !select.exists {
            select = XCUIApplication().menuItems["Select"]
        }
        //For empty fields there will be no "Select All", so we need to check
        if select.waitForExistence(timeout: 0.5), select.exists {
            select.tap()
            typeText(String(XCUIKeyboardKey.delete.rawValue))
        } else {
            tap()
        }
        if let newVal = newText {
            typeText(newVal)
        }
    }
}
