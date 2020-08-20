//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
//
import Utils_Designables
//
import App_Ryanair_Core

struct RyanairView1: View {

    @ObservedObject private var viewModel: RyanairView1ViewModel

    public init(viewModel: RyanairView1ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        return ZStack {
            ScrollView {
                VStack {
                    originStationView
                    destinationStationView
                    departureDateView
                    adultsView
                    teensView
                    childrenView
                    outputView
                }
            }
            ActivityIndicatorRepresentable(isAnimating: viewModel.isLoading)
        }
    }
}

extension RyanairView1 {
    var outputView: some View {
        return Text(viewModel.output)
    }
}

extension RyanairView1 {
    var originStationView: some View {
        return Text("originStationView")
    }
}

extension RyanairView1 {
    var destinationStationView: some View {
        return Text("destinationStationView")
    }
}

extension RyanairView1 {
    var departureDateView: some View {
        return Text("departureDateView")
    }
}

extension RyanairView1 {
    var adultsView: some View {
        return Text("adultsView")
    }
}

extension RyanairView1 {
    var teensView: some View {
        return Text("Origin")
    }
}

extension RyanairView1 {
    var childrenView: some View {
        VStack {
            Text("childrenView")
            Stepper(value: $viewModel.children,
            onEditingChanged: { _ in /*self.viewModel.refresh()*/ },
            label: { Text("Children: \(viewModel.children)") })
        }
    }
}
