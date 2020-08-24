//
//  Created by Ricardo Santos on 23/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import XCTest

class ActiveUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuggestions() {
        let app = XCUIApplication()
        app.launch()

        // Wait some seconds for launch
        XCTAssertTrue(app.waitForExistence(timeout: 1))

        let txtOrigin = app.textFields["TextField.origin"]
        if txtOrigin.exists {
            txtOrigin.tap()
            txtOrigin.typeText("DU")
        }

        XCTAssertTrue(app.tables.staticTexts["DUB : Dublin"].waitForExistence(timeout: 1))

    }

}
