//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

//swiftlint:disable all

struct AppStore: View {
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("TUESDAY, MAY 12").foregroundColor(.secondary).bold().font(.footnote)
                    Text("Today").font(.largeTitle).bold()
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "0E764E06-6B02-456A-88D3-983CA788E7F7.jpg")).resizable().aspectRatio(contentMode: .fill).frame(width: 40, height: 40, alignment: .trailing).cornerRadius(200)
            }.padding([.horizontal, .top])
            VStack {
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "0E764E06-6B02-456A-88D3-983CA788E7F7.jpg")).resizable().frame(height: 450)
                    VStack(alignment: .leading) {
                        Text("LIFE AT HOME").foregroundColor(Color.white.opacity(0.5)).bold().font(.footnote)
                        Text("3 Quick and Easy Recipes").foregroundColor(.white).bold()
                        Spacer()
                        Text("These freezer-friendly options take the stress out of meal prep.").foregroundColor(.white).lineLimit(2)
                    }.padding()
                }
            }.cornerRadius(10).padding([.horizontal, .bottom]).shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            VStack {
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "0E764E06-6B02-456A-88D3-983CA788E7F7.jpg")).resizable().frame(height: 450)
                    VStack(alignment: .leading) {
                        Text("LIFE AT HOME").foregroundColor(Color.white.opacity(0.5)).bold().font(.footnote)
                        Text("3 Quick and Easy Recipes").foregroundColor(.white).bold()
                        Spacer()
                        Text("These freezer-friendly options take the stress out of meal prep.").foregroundColor(.white).lineLimit(2)
                    }.padding()
                }
            }.cornerRadius(10).padding([.horizontal, .bottom]).shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        }
    }
}

public struct AppStore_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        AppStore()
    }
}
