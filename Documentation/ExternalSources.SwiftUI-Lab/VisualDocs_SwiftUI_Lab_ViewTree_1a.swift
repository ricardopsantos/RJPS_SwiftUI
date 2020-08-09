//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// https://github.com/swiftui-lab
// https://swiftui-lab.com
//

struct ViewTree_1a: View {
    @State private var activeIdx: Int = 0
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "January", idx: 0)
                    MonthView(activeMonth: $activeIdx, label: "February", idx: 1)
                    MonthView(activeMonth: $activeIdx, label: "March", idx: 2)
                    MonthView(activeMonth: $activeIdx, label: "April", idx: 3)
                }
                Spacer()
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "May", idx: 4)
                    MonthView(activeMonth: $activeIdx, label: "June", idx: 5)
                    MonthView(activeMonth: $activeIdx, label: "July", idx: 6)
                    MonthView(activeMonth: $activeIdx, label: "August", idx: 7)
                }
                Spacer()
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "September", idx: 8)
                    MonthView(activeMonth: $activeIdx, label: "October", idx: 9)
                    MonthView(activeMonth: $activeIdx, label: "November", idx: 10)
                    MonthView(activeMonth: $activeIdx, label: "December", idx: 11)
                }
                Spacer()
            }
        }
    }
}

struct MonthView: View {
    @Binding var activeMonth: Int
    let label: String
    let idx: Int
    var body: some View {
        Text(label).padding(10).onTapGesture { self.activeMonth = self.idx }.background(MonthBorder(show: activeMonth == idx))
    }
}

struct MonthBorder: View {
    let show: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3.0).foregroundColor(show ? Color.red : Color.clear)
            .animation(.easeInOut(duration: 0.6))
    }
}

struct VisualDocs_SwiftUI_Lab_ViewTree_1a_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewTree_1a()
    }
}
