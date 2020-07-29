//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension V {
    
    struct Tab2_View: View {
        private var _background: Color = .green
        
        var someListSample1: some View {
            List {
                Text("List2.Item_1")
                Text("List2.Item_2")
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: "clock")
                    Text("List2.Item_3")
                }
                Text("List2.Item_4")
                Text("List2.Item_5")
                Text("List2.Item_6")
                Text("List2.Item_7")
            }
        }
        var someLabel: some View { return Text("Hello World").bold().italic().underline().lineLimit(2) }
        var someBtn: some View {
            Button(action: {
                print("Tap!")
            }, label: {
                Image(systemName: "clock")
                Text("Click Me")
                Text("Subtitle")})
.foregroundColor(UIColor.Button.Default.foregroundColor).padding().background(UIColor.Button.Default.background).cornerRadius(5)
        }
        
        @State private var isShowing: Bool = true // toggle state
        var toggleView: some View {
            return Toggle(isOn: $isShowing) {
                if isShowing {
                    Text("Toggle On")
                } else {
                    Text("Toggle Off")
                }
            }
        }
        
        var viewHorizontalStack: some View {
            HStack(alignment: .center, spacing: 10) {
            Spacer()
            someLabel
            Spacer()
            someLabel
            Spacer()
            }
        }
        
        var viewVerticalStack: some View {
            VStack(alignment: .center, spacing: 10) {
            someBtn
            SwiftUIFactory.ButtonView(title: "Click here", action: {
                print("!action!")
            })
            }.background(UIColor.Stack.debugColor)
        }
        
        var body : some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 10) {
                Text("Sample SwiftUI elements").font(.title)
                Divider().background(Color.clear)
                viewHorizontalStack
                Divider()
                viewVerticalStack
                Divider()
                toggleView
                Divider()
                // Section is used to create the header/footer view content, which is generally used in conjunction with the List component.
                Section(header: Text("List.Section.Header"),
                        footer: Text("List.Section.Footer")) {
                            Text("List1.Item_1")
                            Text("List1.Item_2")
                        }
                someListSample1
                }.background(UIColor.Stack.debugColor)
                .onAppear { print("[\(self)] onAppear!") }
                .onDisappear { print("[\(self)] onDisappear!") }
            }
        }
    }
}

// MARK: - Preview

struct Tab2_View_Previews: PreviewProvider {
    static var previews: some View {
        V.Tab2_View()
    }
}
