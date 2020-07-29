//
//  Created by Ricardo Santos on 28/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Padding: View {
        let size: CGFloat = 20
        var body: some View {
            ScrollView {
                VStack {
                    Button(action: { }) {
                        Text("No padding").textColor(Color.black)
                    }.background(Color.blue)
                    Divider()
                    Button(action: { }) {
                        Text("Button.padding").textColor(Color.black)
                        }.background(Color.blue).padding()
                    Divider()
                    Button(action: { }) {
                        Text("Text.padding").padding().textColor(Color.black)
                        }.background(Color.blue)
                    Divider()
                    Button(action: { }) {
                        Text("Text.padding + Button.padding").padding().textColor(Color.black)
                        }.background(Color.blue).padding()
                    Divider()
                    Button(action: { }) {
                        Text("Text.2*padding + Button.2*padding").padding().padding().textColor(Color.black)
                        }.background(Color.blue).padding().padding()
                    Divider()
                }
                VStack {
                    Text("")
                }
                Divider()
                VStack {
                    Text("")
                }
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Padding: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Padding()
        //V.Costa()
    }
}
