//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
//
import Extensions
import Factory

extension V {
    struct Tab3_View: View {
        @State private var detail: SomeIdentifiableStruct?
        var body: some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    SwiftUIFactory.ButtonView(title: "Present sheet", action: {
                        self.detail = SomeIdentifiableStruct(someParam: "Details!")
                    }).sheet(item: $detail, content: { detail in
                        V.MiscPresentModelDetails_View(param: detail.someParam)
                        }).padding(20)
                }.background(UIColor.Stack.debugColor)
               }
            .onAppear { print("[\(self)] onAppear!") }
            .onDisappear { print("[\(self)] onDisappear!") }
        }
    }
}

// MARK: MiscPresentModelDetails_View
extension V {
    struct MiscPresentModelDetails_View: View {
        let param: String
        var body: some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                Text(param)
            }
        }
    }
}

// MARK: - Preview

struct Tab3_View_Previews: PreviewProvider {
    static var previews: some View {
        V.Tab3_View()
    }
}
