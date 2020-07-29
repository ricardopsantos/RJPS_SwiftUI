//
//  Created by Ricardo Santos on 12/06/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

/*
systemGray2
systemGray3
 systemGray4
 systemGray5
 systemGray6
 label
 secondaryLabel
 tertiaryLabel
 quaternaryLabel
 link
 placeholderText
 separator
 opaqueSeparator
 systemBackground
 secondarySystemBackground
 tertiarySystemBackground
 systemGroupedBackground
 secondarySystemGroupedBackground
 tertiarySystemGroupedBackground
 systemFill
 secondarySystemFill
 tertiarySystemFill
 quaternarySystemFill
 lightText
 darkText
 */

extension V {
    struct VisualDocs_Colors: View {
        let size: CGFloat = 20
        var body: some View {
            ScrollView {
                VStack {
                    HStack {
                          Text("systemGray")
                          Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGray))
                    }
                    HStack {
                          Text("systemIndigo")
                          Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemIndigo))
                    }
                    HStack {
                        Text("systemTeal")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemTeal))
                    }
                    HStack {
                        Text("systemPurple")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemPurple))
                    }
                    HStack {
                        Text("systemPink")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemPink))
                    }
                    HStack {
                        Text("systemYellow")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemYellow))
                    }
                    HStack {
                        Text("systemOrange")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemOrange))
                    }
                    HStack {
                        Text("systemRed")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemRed))
                    }
                    HStack {
                        Text("systemGreen")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                    }
                    HStack {
                        Text("systemBlue")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemBlue))
                    }
                }
                Divider()
                VStack {
                    HStack {
                        Text("accentColor")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.accentColor)
                    }
                    HStack {
                        Text("black")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.black)
                    }
                    HStack {
                        Text("white")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.white)
                    }
                    HStack {
                        Text("gray")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.gray)
                    }
                    HStack {
                        Text("red")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.red)
                    }
                    HStack {
                        Text("green")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.green)
                    }
                    HStack {
                        Text("blue")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.blue)
                    }
                    HStack {
                        Text("orange")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.orange)
                    }
                    HStack {
                        Text("yellow")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.yellow)
                    }
                    HStack {
                        Text("pink")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.pink)
                    }
                    /*HStack {
                        Text("purple")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.purple)
                    }
                    HStack {
                        Text("primary")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.primary)
                    }
                    HStack {
                        Text("secondary")
                        Circle().frame(width: 20, height: 20).foregroundColor(Color.secondary)
                    }*/
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 0)
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Colors: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Colors()
    }
}
