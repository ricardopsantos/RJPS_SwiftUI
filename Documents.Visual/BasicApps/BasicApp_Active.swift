//
//  Created by Ricardo Santos on 28/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

//
// Active bank, código multi-canal
//

extension V {
    struct BasicApp_ActiveBackMultiChanelCode: View {
        private let size: CGFloat = 70
        let secret: String
        let multiCode: [Int]
        private let defaultColor = Color(UIColor.gray)
        @State private var color = Color(UIColor.gray)
        @State private var text = ""
        @State private var pin = ""
        @State private var unlocked = false
        var body: some View {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    TextField("", text: $text).font(.largeTitle).multilineTextAlignment(.center).textColor(color).padding().border(color, width: 1)
                    Spacer()
                }
                Spacer()
                HStack {
                    Button(action: { self.eval(self.multiCode[0], 1) }) { Image(systemName: "1.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                    Button(action: { self.eval(self.multiCode[1], 2) }) { Image(systemName: "2.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                    Button(action: { self.eval(self.multiCode[2], 3) }) { Image(systemName: "3.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                }.padding()
                HStack {
                    Button(action: { self.eval(self.multiCode[3], 4) }) { Image(systemName: "4.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                    Button(action: { self.eval(self.multiCode[4], 5) }) { Image(systemName: "5.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                    Button(action: { self.eval(self.multiCode[5], 6) }) { Image(systemName: "6.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                }.padding()
                HStack {
                    Button(action: { self.eval(self.multiCode[6], 7) }) { Image(systemName: "7.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                    Button(action: { self.eval(self.multiCode[7], 8) }) { Image(systemName: "8.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                    Button(action: { self.eval(self.multiCode[9], 9) }) { Image(systemName: "9.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                }.padding()
                HStack {
                    Spacer()
                    Button(action: { self.eval(self.multiCode[0], 0) }) { Image(systemName: "0.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding() }
                    Spacer()
                }.padding()
            }.padding()
        }

        func eval(_ value: Int, _ number: Int) {
            let pinChar = "*"
            defer {
                if !unlocked {
                    unlocked = pin == secret
                    color = unlocked ? Color(UIColor.cyan) : defaultColor
                    if unlocked {
                        self.text = "Unlocked..."
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.color = self.defaultColor
                            self.text = ""
                        }
                    }
                }
            }
            if !unlocked && pin.count < 6 {
                pin = "\(pin)\(number)"
                self.text = "\(self.text) \(pinChar)"
            }
            guard unlocked else { return }
            // Work
            if text.count == 0 {
                text = "\(value)"
            } else {
                self.text = "\(self.text) - \(value)"
            }
        }
    }
}

// MARK: - Preview

struct BasicApp_ActiveBackMultiChanelCode: PreviewProvider {
    static var previews: some View {
        V.BasicApp_ActiveBackMultiChanelCode(secret: "1234", multiCode: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    }
}
