//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension AppView {
    struct Tab3_View: View {
        @State private var detail: SomeIdentifiableStruct?
        var body: some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                VStack (alignment: .center) {
                    Text("Present sheet").font(.title).foregroundColor(Color.purple).padding(20)
                    SwiftUIFactory.ButtonView(title: "Click Me", action: {
                        self.detail = SomeIdentifiableStruct(someParam: "Details!")
                    }).sheet(item: $detail, content: { detail in
                        AppView.MiscPresentModelDetails_View(param: detail.someParam)
                        }).padding(20)
                }.background(UIColor.Stack.debugColor)
               }
            .onAppear { print("[\(self)] onAppear!") }
            .onDisappear { print("[\(self)] onDisappear!") }
        }
    }
}

// MARK: MiscPresentModelDetails_View
extension AppView {
    struct MiscPresentModelDetails_View: View {
        let param : String
        var body: some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                Text(param)
            }
            .onAppear { print("[\(self)] onAppear!") }
            .onDisappear { print("[\(self)] onDisappear!") }
        }
    }
}

