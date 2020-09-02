//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct VisualDocs_Colors: View {
    let size: CGFloat = 20
    var body: some View {
        ScrollView {

            VStack {
                Text("Color.systemXXX").font(.title)
                Divider()
                HStack {
                    Text("systemIndigo")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemIndigo))
                }.scaledToFill()
                HStack {
                    Text("systemTeal")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemTeal))
                }.scaledToFill()
                HStack {
                    Text("systemPurple")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemPurple))
                }.scaledToFill()
                HStack {
                    Text("systemPink")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemPink))
                }.scaledToFill()
                HStack {
                    Text("systemYellow")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemYellow))
                }.scaledToFill()
                HStack {
                    Text("systemOrange")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemOrange))
                }.scaledToFill()
                HStack {
                    Text("systemRed")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemRed))
                }.scaledToFill()
                HStack {
                    Text("systemGreen")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                }.scaledToFill()
            }

            VStack {
                HStack {
                    Text("systemBlue")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemBlue))
                }.scaledToFill()
            }

            VStack {
                HStack {
                    Text("systemGray")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGray))
                }.scaledToFill()
                HStack {
                    Text("systemGray2")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGray2))
                }.scaledToFill()
                HStack {
                    Text("systemGray3")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGray3))
                }.scaledToFill()
                HStack {
                    Text("systemGray4")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGray4))
                }.scaledToFill()
                HStack {
                    Text("systemGray5")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGray5))
                }.scaledToFill()
                HStack {
                    Text("systemGray6")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGray6))
                }.scaledToFill()
            }

            // Color
            // Color
            // Color

            VStack {
                Text("Color").font(.title)
                HStack {
                    Text("black")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.black)
                }.scaledToFill()
                HStack {
                    Text("white")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.white)
                }.scaledToFill()
                HStack {
                    Text("gray")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.gray)
                }.scaledToFill()
                HStack {
                    Text("red")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.red)
                }.scaledToFill()
                HStack {
                    Text("green")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.green)
                }.scaledToFill()
                HStack {
                    Text("blue")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.blue)
                }.scaledToFill()
                HStack {
                    Text("orange")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.orange)
                }.scaledToFill()
                HStack {
                    Text("yellow")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.yellow)
                }.scaledToFill()
            }
            VStack {
                HStack {
                    Text("pink")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.pink)
                }.scaledToFill()
                HStack {
                    Text("purple")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.purple)
                }.scaledToFill()
                HStack {
                    Text("primary")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.primary)
                }.scaledToFill()
                HStack {
                    Text("secondary")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.secondary)
                }
                HStack {
                    Text("accentColor")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color.accentColor)
                }.scaledToFill()
            }

            // Misc
            // Misc
            // Misc

            VStack {
                Text("Misc").font(.title)
                HStack {
                    Text("lightText")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.lightText))
                }.scaledToFill()
                HStack {
                    Text("darkText")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.darkText))
                }.scaledToFill()
                HStack {
                    Text("label")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.label))
                }.scaledToFill()
                HStack {
                    Text("secondaryLabel")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.secondaryLabel))
                }.scaledToFill()
                HStack {
                    Text("tertiaryLabel")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.tertiaryLabel))
                }.scaledToFill()
                HStack {
                    Text("tertiaryLabel")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.tertiaryLabel))
                }.scaledToFill()
                HStack {
                    Text("quaternaryLabel")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.quaternaryLabel))
                }.scaledToFill()
                HStack {
                    Text("link")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.link))
                }.scaledToFill()
            }

            VStack {
                HStack {
                    Text("placeholderText")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.placeholderText))
                }.scaledToFill()
                HStack {
                    Text("separator")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.separator))
                }.scaledToFill()
                HStack {
                    Text("opaqueSeparator")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.opaqueSeparator))
                }.scaledToFill()
            }

            // systemBackgroundXXX
            // systemBackgroundXXX
            // systemBackgroundXXX

            VStack {
                Text("systemBackgroundXXX").font(.title)
                HStack {
                    Text("systemBackground")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemBackground))
                }.scaledToFill()
            }

            VStack {
                HStack {
                    Text("secondarySystemBackground")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.secondarySystemBackground))
                }.scaledToFill()
                HStack {
                    Text("tertiarySystemBackground")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.tertiarySystemBackground))
                }.scaledToFill()
                HStack {
                    Text("systemGroupedBackground")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGroupedBackground))
                }.scaledToFill()
                HStack {
                    Text("systemGroupedBackground")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGroupedBackground))
                }.scaledToFill()
                HStack {
                    Text("secondarySystemGroupedBackground")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                }.scaledToFill()
                HStack {
                    Text("tertiarySystemGroupedBackground")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.tertiarySystemGroupedBackground))
                }.scaledToFill()
                HStack {
                    Text("systemFill")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemFill))
                }
                HStack {
                    Text("secondarySystemFill")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.secondarySystemFill))
                }.scaledToFill()
                HStack {
                    Text("tertiarySystemFill")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.tertiarySystemFill))
                }.scaledToFill()
                HStack {
                    Text("quaternarySystemFill")
                    Circle().frame(width: 20, height: 20).foregroundColor(Color(UIColor.quaternarySystemFill))
                }.scaledToFill()
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Colors_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_Colors()
    }
}
