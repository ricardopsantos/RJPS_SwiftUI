//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

struct SwiftUIFactory {
    struct ButtonView: View {
        let title: String
        var subTitle: String = ""
        var action = { }
        var body: some View {
            Button(action: {
                self.action()
            }, label: {
                Text(title)
                if subTitle != "" {
                    Text(subTitle)
                }
            })
                .foregroundColor(UIColor.Button.Default.foregroundColor)
                .padding().background(UIColor.Button.Default.background)
                .cornerRadius(5)
        }
    }
}

// MARK: - Preview

struct SwiftUIFactory_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                SwiftUIFactory.ButtonView(title: "Title", action: {
                    print("!action!")
                })
            }
        }

    }
}
