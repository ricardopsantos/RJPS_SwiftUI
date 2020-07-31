//
//  Created by Ricardo Santos on 28/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

extension V {
    struct LockScreen: View {
        var body: some View {
            ScrollView {
                VStack {
                    Text("5:45").font(.system(size: 64, weight: .thin))
                    Text("Monday, May 11").font(.system(size: 24))
                }.padding(.vertical, 32)

                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Rectangle().frame(width: 16, height: 16).foregroundColor(Color(UIColor.systemFill)).cornerRadius(4)
                            Text("APP NAME").font(.caption)
                            Spacer()
                            Text("21m ago").font(.caption)
                        }

                        Text("Notification title").font(.headline)
                        Text("This is the notification body")
                    }.padding().background(Color(UIColor.secondarySystemBackground)).cornerRadius(12)
                }.padding()
            }
        }
    }

}

// MARK: - Preview

struct LockScreen: PreviewProvider {
    static var previews: some View {
        V.LockScreen()
    }
}