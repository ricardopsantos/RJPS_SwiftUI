//
//  Created by Ricardo Santos on 24/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI

public struct DesignablesSample: View {
    public var body: some View {
        ScrollView {
            VStack {
                ConnectivityView(subTitle: "Try again latter").debug3()
                DesignablesFactorySample()
            }
        }.padding()
    }
}

struct Designables_Previews: PreviewProvider {
    static var previews: some View {
        return DesignablesSample()
    }
}
