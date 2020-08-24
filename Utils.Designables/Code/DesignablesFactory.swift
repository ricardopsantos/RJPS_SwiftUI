//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
//
import Utils_Extensions

public struct DesignablesFactory {
    private init() { }
}

public extension DesignablesFactory {
    struct Button: View {
        private let title: String
        private var subTitle: String = ""
        private var action = { }
        public init(title: String, subTitle: String = "", action: @escaping () -> Void = { } ) {
            self.title = title
            self.subTitle = subTitle
            self.action = action
        }
        public var body: some View {
            SwiftUI.Button(action: {
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

    struct TitleAndValue: View {
        private let title: String
        private let value: String
        public init(title: String, value: String ) {
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

    struct ErrorView: View {
        private var message: String
        public init(message: String) {
            self.message = message
        }
        public var body: some View {
            Text(message).font(.caption).foregroundColor(Color.red).multilineTextAlignment(.center)
            //Text(message).font(.body).bold().foregroundColor(Color(UIColor.label))
        }
    }

    struct ListItem: View {
        private let imageName: String
        private let imageColor1: Color?
        private let imageColor2: Color?
        private let title: String
        private let value: String
        public init(title: String,
                    value: String,
                    imageName: String = "",
                    imageColor1: Color? = nil,
                    imageColor2: Color? = nil) {
            self.title = title
            self.value = value
            self.imageName = imageName
            self.imageColor1 = imageColor1
            self.imageColor2 = imageColor2
        }
        public var body: some View {
            HStack {
                if imageName.count > 0 {
                    if imageColor1 != nil && imageColor2 != nil {
                        Image(systemName: imageName).tint(color: imageColor2 ?? Color.black).frame(width: 28, height: 28).background(imageColor1 ?? Color.black) .cornerRadius(6)
                    } else {
                        Image(systemName: imageName).frame(width: 28, height: 28)
                    }
                }
                VStack(alignment: .leading) {
                    Text(title).font(.body).bold().foregroundColor(Color(UIColor.label))
                    Text(value).font(.body).foregroundColor(Color(UIColor.secondaryLabel))
                }
            }
        }
    }
}

// MARK: - Preview

public struct DesignablesFactorySample: View {
    var food = ["Spaghetti", "Cheese Burger", "Pizza", "Fried Rice"]

    public var body: some View {
        VStack {
            DesignablesFactory.Button(title: "Title", action: { print("!action!") })
            Spacer()
            DesignablesFactory.TitleAndValue(title: "T&V.Title", value: "T&V.value")
            Spacer()
            DesignablesFactory.ErrorView(message: "Some error")
            Spacer()
                Section(header: Text("DesignablesFactory.ListItem")) {
                    List {
                        DesignablesFactory.ListItem(title: "LI.Title1", value: "LI.Value1")
                            DesignablesFactory.ListItem(title: "LI.Title1", value: "LI.Value1", imageName: "paperplane.fill", imageColor1: Color.red, imageColor2: Color.blue)
                        DesignablesFactory.ListItem(title: "LI.Title1", value: "LI.Value1", imageName: "paperplane.fill")
                    }
                }

        }.padding()
    }
}

struct DesignablesFactory_Preview: PreviewProvider {
    static var previews: some View {
        DesignablesFactorySample()
    }
}
