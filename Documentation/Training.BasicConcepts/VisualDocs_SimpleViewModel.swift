//
//  Events.swift
//  UglySwiftUIApp
//
//  Created by Ricardo Santos on 31/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class MyViewModel: ObservableObject {
    var title: String = "SwiftUI"
    @Published var text: String = ""
}

struct TextFieldView: View {
    @ObservedObject var myViewModel: MyViewModel = MyViewModel()
    var body: some View {
        ScrollView {
            TextField(myViewModel.title, text: $myViewModel.text).padding()
        }
    }
}

extension V {
    struct VisualDocs_SimpleViewModel: View {
        var body: some View {
            ScrollView {
                VStack {
                    TextFieldView()
                }
            }
        }
    }
}

// MARK: - Preview VisualDocs_ReactingEvents

struct VisualDocs_SimpleViewModel: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_SimpleViewModel()
    }
}
