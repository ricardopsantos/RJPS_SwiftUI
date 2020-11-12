//
//  ShowAlert.swift
//  UglySwiftUIApp
//
//  Created by Ricardo Santos on 04/11/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct ShowAlertContentView: View {
    @State private var showAlert = false
    var body: some View {
        ZStack {
          Color.yellow
          .opacity(0.01)
          .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
            }
        }.alert(isPresented: $showAlert) {
          Alert(title: Text("Important message"), message: Text("Numbers Only"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct ShowAlertContentView_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        ShowAlertContentView()
    }
}
