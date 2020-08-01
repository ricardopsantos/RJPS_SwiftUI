//
//  Created by Ricardo Santos on 28/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

//swiftlint:disable multiple_closures_with_trailing_closure

//
// Active bank, código multi-canal
//

extension V {
    struct BasicApp_PassCode: View {
        private let size: CGFloat = 70
        let secret: String
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
                    Button(action: { self.eval(1) }) {
                        Image(systemName: "1.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                    Button(action: { self.eval(2) }) {
                        Image(systemName: "2.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                    Button(action: { self.eval(3) }) {
                        Image(systemName: "3.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                }.padding()
                HStack {
                    Button(action: { self.eval(4) }) {
                        Image(systemName: "4.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                    Button(action: {  self.eval(5) }) {
                        Image(systemName: "5.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                    Button(action: { self.eval(6) }) {
                        Image(systemName: "6.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                }.padding()
                HStack {
                    Button(action: { self.eval(7) }) {
                        Image(systemName: "7.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                    Button(action: { self.eval(8) }) {
                        Image(systemName: "8.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                    Button(action: { self.eval(9) }) {
                            Image(systemName: "9.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                }.padding()
                HStack {
                    Spacer()
                    Button(action: { self.eval(0) }) {
                        Image(systemName: "0.circle").resizable().frame(width: size, height: size).foregroundColor(color).padding()
                    }
                    Spacer()
                }.padding()
            }.padding()
        }

        func eval(_ number: Int) {
            /*let pinChar = "*"
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
            print("Do stuff!")*/
        }
    }
}

// MARK: - Preview

struct BasicApp_PassCode: PreviewProvider {
    static var previews: some View {
        V.BasicApp_PassCode(secret: "1234")
    }
}
