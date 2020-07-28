//
//  ViewRouter.swift
//  NavigateInSwiftUIComplete
//
//  Created by Andreas Schultz on 19.07.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class Tab5_ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<Tab5_ViewRouter, Never>() // DONT CHANGE NAME, else Stops working
    var currentPage: Tab5Pages = .page1 {
        didSet {
            objectWillChange.send(self)
        }
    }
}
