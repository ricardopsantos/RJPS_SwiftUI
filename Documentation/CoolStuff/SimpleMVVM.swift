//
//  Created by Ricardo Santos on 09/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct BasicApp_SimpleMVVM: View {
    @EnvironmentObject var viewModel: BasicApp_SimpleMVVM_ViewModel
    var body: some View {
        return VStack {
            Text(String(self.viewModel.count))
            HStack {
                Button("+", action: { self.viewModel.countUp() })
                Button("-", action: { self.viewModel.countDown() })
            }
        }
    }
}

struct BasicApp_SimpleMVVM_Model {
    public static func incrementCount(currentCount: Int) -> Int { return currentCount + 1 }
    public static func decrementCount(currentCount: Int) -> Int { currentCount - 1 }
}

class BasicApp_SimpleMVVM_ViewModel: ObservableObject {
    @Published var count = 0
    public func countUp() { count = BasicApp_SimpleMVVM_Model.incrementCount(currentCount: count) }
    public func countDown() { count = BasicApp_SimpleMVVM_Model.decrementCount(currentCount: count) }
}

struct BasicApp_SimpleMVVM_Preview: PreviewProvider {
    static var previews: some View {
        BasicApp_SimpleMVVM().environmentObject(BasicApp_SimpleMVVM_ViewModel())
    }
}
