//
//  MotherView.swift
//  NavigateInSwiftUIComplete
//
//  Created by Andreas Schultz on 19.07.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI


extension AppView {

    struct Tab5_View : View {
        @ObservedObject var viewRouter: Tab5_ViewRouter
        var body: some View {
            VStack {
                if viewRouter.currentPage == Tab5Pages.page1 {
                    AppView.Tab5ContentViewA_View(viewRouter: viewRouter)
                } else if viewRouter.currentPage == Tab5Pages.page2 {
                    AppView.Tab5ContentViewB_View(viewRouter: viewRouter)
                }
            }
            .onAppear { print("[\(self)] onAppear!") }
            .onDisappear { print("[\(self)] onDisappear!") }
        }
    }
}


struct Tab5_View_Previews: PreviewProvider {
    static var previews: some View {
        AppView.Tab5_View(viewRouter: Tab5_ViewRouter())
    }
}
