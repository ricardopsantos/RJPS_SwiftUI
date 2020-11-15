//
//  Created by Ricardo Santos on 22/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import Utils

public struct ConnectivityView: View {
    @State var connectivity = ""
    let subTitle: String
    public init(subTitle: String) {
        self.subTitle = subTitle
    }
    public var body: some View {
        Text(connectivity)
            .font(.caption)
            .foregroundColor(Color.red)
            .multilineTextAlignment(.center)
            .onAppear {
                ConnectivityUtils.shared.monitor.pathUpdateHandler = { path in
                    DispatchQueue.main.async {
                        if path.status == .satisfied {
                            self.connectivity = ""
                        } else {
                            self.connectivity = "No internet connection\n(\(self.subTitle))"
                        }
                    }
                }
        }
    }
}
