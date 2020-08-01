//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension V {
    struct Tab2_View: View {

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

        var someListSample1: some View {
            List {
                Text("List2.Item_1")
                Text("List2.Item_2")
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: "clock")
                    Text("List2.Item_3")
                }
                Text("List2.Item_4")
            }
        }

        var body : some View {
            ZStack { UIColor.View.appDefaultBackground.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 10) {
                    Text("Sample SwiftUI elements").font(.title)
                    Divider().background(Color.red)
                    toggleView
                    Divider()
                    // Section is used to create the header/footer view content, which is generally used in conjunction with the List component.
                    Section(header: Text("List.Section.Header"),
                            footer: Text("List.Section.Footer")) {
                                Text("List1.Item_1")
                                Text("List1.Item_2")
                            }
                    someListSample1
                }.padding()
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
