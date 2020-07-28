//
//  Created by Ricardo Santos on 12/06/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct DebugFonts: View {
        let size: CGFloat = 20
        var body: some View {
            ScrollView {
                VStack {
                    Text("system.ultraLight").font(.system(size: size, weight: .ultraLight))
                    Text("system.thin").font(.system(size: size, weight: .thin))
                    Text("system.light").font(.system(size: size, weight: .light))
                    Text("system.regular").font(.system(size: size, weight: .regular))
                    Text("system.medium").font(.system(size: size, weight: .medium))
                    Text("system.semibold").font(.system(size: size, weight: .semibold))
                    Text("system.bold").font(.system(size: size, weight: .bold))
                    Text("system.heavy").font(.system(size: size, weight: .heavy))
                    Text("system.black").font(.system(size: size, weight: .black))
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 0)
                Divider()
                VStack {
                    Text("largeTitle").font(.largeTitle)
                    Text("title").font(.title)
                    Text("headline").font(.headline)
                    Text("subheadline").font(.subheadline)
                    Text("body").font(.body)
                    Text("callout").font(.callout)
                    Text("footnote").font(.footnote)
                    Text("caption").font(.caption)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 0)
                Divider()
                VStack {
                    Text("Regular Text")
                    Text("system.\(Int(size))").font(.system(size: size))
                    Text("monospaced").font(.system(size: size, design: .monospaced))
                    Text("monospaced.medium").font(.system(size: size, design: .monospaced)).fontWeight(.medium)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 0)
            }
        }
    }
}

// MARK: - Preview

struct DebugFonts: PreviewProvider {
    static var previews: some View {
        V.DebugFonts()
    }
}
