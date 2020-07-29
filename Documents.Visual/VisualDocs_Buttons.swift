//
//  Created by Ricardo Santos on 28/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Buttons: View {
        let size_w: CGFloat = 50
        let size_h: CGFloat = 50
        var body: some View {
            ScrollView {
                VStack {
                    Text("SwiftUIFactory.ButtonView").font(.headline)
                    Spacer()
                    SwiftUIFactory.ButtonView.init(title: "title_1")
                    Spacer()
                    SwiftUIFactory.ButtonView.init(title: "title_2", subTitle: "subTitle") { print("Tapped") }
                }
                Divider()
                VStack {
                    Text("Frame and padding").font(.headline)
                    Spacer()
                    Button(action: {}) { Text("Not text padding...") }.frame(width: 300).background(Color.green).padding()
                    Spacer()
                    Button(action: {}) { Text("Text padding..").padding() }.frame(width: 300).background(Color.green)
                }
                Divider()
                VStack {
                    Text("Basic").font(.headline)
                    Spacer()
                    Button(action: {}) { Text("Hi") }.foregroundColor(.primary)
                    Button(action: {}) { Text("Hi") }.foregroundColor(.secondary)
                }
                Divider()
                VStack {
                    Text("Shapes and padding").font(.headline)
                    Button(action: { }) {
                        Image(systemName: "paperplane.fill").resizable().frame(width: 20, height: 20).foregroundColor(.red).padding()
                    }.background(Color.blue).clipShape(Circle()).padding().padding(.horizontal, 30)
                    Button(action: { }) {
                        Image(systemName: "paperplane.fill").resizable().frame(width: 20, height: 20).foregroundColor(.red).padding()
                    }.background(Color.blue).padding().padding(.horizontal, 30)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 0)
                Divider()
                VStack {
                    Text("Composed").font(.headline)
                    Button(action: { }) {
                            HStack {
                                Image(systemName: "plus.circle.fill").resizable().frame(width: 20, height: 20)
                                Text("New Reminder").foregroundColor(.blue)
                            }
                        }.padding()
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 0)

            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Buttons: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Buttons()
        //V.Costa()
    }
}
