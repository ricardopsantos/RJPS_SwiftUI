//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-a-timer-with-swiftui
// How to use a timer with SwiftUI
//

// If you want to run some code regularly, perhaps to make a countdown timer or similar,
// you should use Timer and the onReceive() modifier.
//
// For example, this code creates a timer publisher that fires every second, updating a label with the current time:
//

struct VisualDocs_onReceive: View {
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Text("\(currentDate)")
            .onReceive(timer) { input in
                self.currentDate = input
            }
    }
}

// MARK: - Preview 

struct VisualDocs_OnReceive_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_onReceive()
    }
}
