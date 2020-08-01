//
//  Created by Ricardo Santos on 31/07/2020.
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

extension V {
    struct VisualDocs_onDelete: View {
        init() {
              UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
              UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
          }
          @State var tasks = ["Meal Prep", "Call Family", "Do Laundry"]
          var body: some View {
              NavigationView {
                  VStack(alignment: .leading) {
                      List {
                          ForEach(self.tasks, id: \.self) { task in
                              HStack {
                                  Image(systemName: "circle").resizable().frame(width: 20, height: 20)
                                  Text(task)
                              }
                          }.onDelete { indexSet in
                              self.tasks.remove(atOffsets: indexSet)
                          }
                      }
                      Button(action: { }) {
                          HStack {
                              Image(systemName: "plus.circle.fill").resizable().frame(width: 20, height: 20)
                              Text("New Reminder").foregroundColor(.blue)
                          }
                      }.padding()
                  }.navigationBarTitle("Reminders").navigationBarItems(trailing: Button(action: {}) {
                      Image(systemName: "ellipsis.circle")
                  })
              }
          }
    }
}

// MARK: - Preview 

struct VisualDocs_onDelete: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_onDelete()
    }
}
