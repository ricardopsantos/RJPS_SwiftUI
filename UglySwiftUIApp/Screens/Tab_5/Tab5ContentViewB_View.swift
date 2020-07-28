//
//  ContentViewB.swift
//  NavigateInSwiftUITutorial
//
//  Created by Andreas Schultz on 18.07.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

extension V {

    struct Tab5ContentViewB_View: View {
        @ObservedObject var viewRouter: Tab5_ViewRouter
        var body: some View {
            VStack {
                Image("happyDog").resizable().aspectRatio(contentMode: .fit)
                SwiftUIFactory.ButtonView(title: "Go to Page 1", subTitle: "") {
                    self.viewRouter.currentPage = .page1
                }
                .onAppear { print("[\(self)] onAppear!") }
                .onDisappear { print("[\(self)] onDisappear!") }
            }
        }
    }
}

// MARK: - Preview

struct Tab5ContentViewB_View_Previews: PreviewProvider {
    static var previews: some View {
        V.Tab5ContentViewB_View(viewRouter: Tab5_ViewRouter())
    }
}
