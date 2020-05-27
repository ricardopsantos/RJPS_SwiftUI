//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension View {
    @inlinable public func textColor(_ color: Color?) -> some View {
        self.foregroundColor(color)
    }
}


struct SwiftUIFactory {
    struct ButtonView : View {
        let title : String
        var subTitle : String = ""
        var action = { }
        var body: some View {
            Button(action: {
            self.action()
            }, label: {
                Text(title)
                if(subTitle != "") {
                    Text(subTitle)
                }
            }).foregroundColor(UIColor.Button.Default.foregroundColor).padding().background(UIColor.Button.Default.background).cornerRadius(5)
        }
    }
}
