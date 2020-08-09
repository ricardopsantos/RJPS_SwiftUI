//
//  Created by Ricardo Santos on 09/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct BasicApp_SimpleMVVM: View {
    @EnvironmentObject var counterViewModel: CounterViewModel
    var body: some View {
        return VStack {
            Text(String(self.counterViewModel.count))
            HStack {
                Button("+", action: { self.counterViewModel.countUp() })
                Button("-", action: { self.counterViewModel.countDown() })
            }
        }
    }
}

struct CounterModel {
    public static func incrementCount(currentCount: Int) -> Int { return currentCount + 1 }
    public static func decrementCount(currentCount: Int) -> Int { currentCount - 1 }
}

class CounterViewModel: ObservableObject {
    @Published var count = 0
    public func countUp() { count = CounterModel.incrementCount(currentCount: count) }
    public func countDown() { count = CounterModel.decrementCount(currentCount: count) }
}

struct BasicApp_SimpleMVVM_Preview: PreviewProvider {
    static var previews: some View {
        BasicApp_SimpleMVVM().environmentObject(CounterViewModel())
    }
}
