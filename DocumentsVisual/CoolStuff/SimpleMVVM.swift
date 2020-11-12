//
//  Created by Ricardo Santos on 09/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct SimpleMVVM: View {
    @EnvironmentObject var viewModel: SimpleMVVM_ViewModel
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

struct SimpleMVVM_Model {
    public static func incrementCount(currentCount: Int) -> Int { return currentCount + 1 }
    public static func decrementCount(currentCount: Int) -> Int { currentCount - 1 }
}

class SimpleMVVM_ViewModel: ObservableObject {
    @Published var count = 0
    public func countUp() { count = SimpleMVVM_Model.incrementCount(currentCount: count) }
    public func countDown() { count = SimpleMVVM_Model.decrementCount(currentCount: count) }
}

public struct SimpleMVVM_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        SimpleMVVM().environmentObject(SimpleMVVM_ViewModel())
    }
}
