//
//  ContentViewA.swift
//  NavigateInSwiftUITutorial
//
//  Created by Andreas Schultz on 18.07.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

extension AppView {

    struct Tab5ContentViewA_View : View {
        @ObservedObject var viewRouter: Tab5_ViewRouter
        var body: some View {
            VStack {
                Image("grumpyDog").resizable().aspectRatio(contentMode: .fit)
                SwiftUIFactory.ButtonView(title: "Go to Page 2", subTitle: "") {
                    self.viewRouter.currentPage = .page2
                }
            }
            .onAppear { print("[\(self)] onAppear!") }
            .onDisappear { print("[\(self)] onDisappear!") }
        }
    }
    
}


