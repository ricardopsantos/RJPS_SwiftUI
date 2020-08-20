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
        return TextField("Origin. Ex: DUB", text: $viewModel.viewRequest.origin)
    }
}

extension RyanairView1 {
    var destinationStationView: some View {
        return TextField("Destination. Ex: STN", text: $viewModel.viewRequest.destination)
    }
}

extension RyanairView1 {
    var departureDateView: some View {
        return TextField("Departure. Ex: 2020-12-31", text: $viewModel.viewRequest.dateDeparture)
    }
}

extension RyanairView1 {
    var adultsView: some View {
        VStack {
            Stepper(value: $viewModel.viewRequest.adult,
            onEditingChanged: { _ in  },
            label: { Text("Adults: \(viewModel.viewRequest.adult)") })
        }
    }
}

extension RyanairView1 {
    var teensView: some View {
        VStack {
            Stepper(value: $viewModel.viewRequest.teen,
            onEditingChanged: { _ in  },
            label: { Text("Teens: \(viewModel.viewRequest.teen)") })
        }
    }
}

extension RyanairView1 {
    var childrenView: some View {
        VStack {
            Stepper(value: $viewModel.viewRequest.children,
            onEditingChanged: { _ in  },
            label: { Text("Children: \(viewModel.viewRequest.children)") })
        }
    }
}