//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Base_Extensions

//swiftlint:disable colon

public struct SwiftUIFactory {
    public struct ButtonView: View {
        public let title: String
        public var subTitle: String = ""
        public var action = { }
        public init(title: String, subTitle:String = "", action: @escaping () -> Void = { } ) {
            self.title = title
            self.subTitle = subTitle
            self.action = action
        }
        public var body: some View {
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
