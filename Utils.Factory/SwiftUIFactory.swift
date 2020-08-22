//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
//
import Utils_Extensions

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

    public struct TitleAndValue: View {
        public let title: String
        public let value: String
        public init(title: String, value:String ) {
            self.title = title
            self.value = value
        }
        public var body: some View {
            HStack {
                Text(title).font(.body).bold().foregroundColor(Color(UIColor.label))
                Spacer()
                Text(value).font(.body).foregroundColor(Color(UIColor.secondaryLabel))
            }
        }
    }
}

// MARK: - Preview

struct SwiftUIFactory_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                SwiftUIFactory.ButtonView(title: "Title", action: { print("!action!") })
                SwiftUIFactory.TitleAndValue(title: "Title", value: "value")
            }
        }
    }
}
