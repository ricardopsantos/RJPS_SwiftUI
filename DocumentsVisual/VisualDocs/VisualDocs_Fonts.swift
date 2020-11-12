//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension Text {
    func greenStrikethrough() -> some View { return self.strikethrough(color: .green) }
    func redUnderline() -> some View { return self.underline(true, color: .red) }
}

struct VisualDocs_Fonts: View {
    let size: CGFloat = 20

    var sampleModifiers: some View {
        VStack {
            Divider()
            Group {
                Text("Foreground colour").foregroundColor(.red)
                Text("background colour").background(Color.red)
            }
            Group {
                Text("background colour with padding").background(Color.red).padding()
            }.border(Color.red, width: 1)
            VStack {
                Text("Bold").bold()
                Text("Italic").italic()
                Text("Italic + bold").italic().bold()
                Text("Baseline offset 1").baselineOffset(-20).border(Color.red, width: 1)
                Text("Baseline offset 2").baselineOffset(20).border(Color.red, width: 1)
                Text("Tracking").tracking(20)
                Text("Kerning").kerning(20)
            }
            Group {
                Text("Underline").underline()
                Text("Blue Underline").underline(color: .blue)
                Text("Custom Underline").redUnderline()
            }
            Group {
                Text("Strikethrough").strikethrough()
                Text("Red Strikethrough").strikethrough(color: .red)
                Text("Custom Strikethrough").greenStrikethrough()
            }
        }
    }

    var body: some View {
        ScrollView {
            Text("Fonts").font(.title)
            VStack {
                Divider()
                Text("fontWeight.ultraLight").fontWeight(.ultraLight)
                Text("fontWeight.thin").fontWeight(.thin)
                Text("fontWeight.light").fontWeight(.light)
                Text("fontWeight.regular").fontWeight(.regular)
                Text("fontWeight.medium").fontWeight(.medium)
                Text("fontWeight.semibold").fontWeight(.semibold)
                Text("fontWeight.bold").fontWeight(.bold)
                Text("fontWeight.heavy").fontWeight(.heavy)
                Text("fontWeight.black").fontWeight(.black)
            }
            VStack {
                Divider()
                Text("standart.largeTitle").font(.largeTitle)
                Text("standart.title").font(.title)
                Text("standart.headline").font(.headline)
                Text("standart.subheadline").font(.subheadline)
                Text("standart.body").font(.body)
                Text("standart.callout").font(.callout)
                Text("standart.footnote").font(.footnote)
                Text("standart.caption").font(.caption)
            }
            VStack {
                Divider()
                Text("Regular Text")
                Text("system.\(Int(size))").font(.system(size: size))
                Text("monospaced").font(.system(size: size, design: .monospaced))
                Text("monospaced.medium").font(.system(size: size, design: .monospaced)).fontWeight(.medium)
            }
            VStack {
                Divider()
                Text("alignment.leading").frame(maxWidth: 200, alignment: .leading)
                Text("alignment.center").frame(maxWidth: 200, alignment: .center)
                Text("alignment.trailing").frame(maxWidth: 200, alignment: .trailing)
                Text("These lines are limited").frame(maxWidth: 100)
            }
            sampleModifiers
        }
    }
}

// MARK: - Preview

public struct VisualDocs_Fonts_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        VisualDocs_Fonts()
    }
}
