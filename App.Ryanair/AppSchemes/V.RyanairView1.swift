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
    @State var date: Date = Date()

    public init(viewModel: RyanairView1ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        return ZStack {
            ScrollView {
                VStack {
                    departureDateView
                    HStack {
                        originStationView
                        Spacer()
                        destinationStationView
                    }
                    adultsView
                    teensView
                    childrenView
                    outputView
                }
            }.padding()
            ActivityIndicatorRepresentable(isAnimating: viewModel.isLoading)
        }
    }
}

extension RyanairView1 {
    var outputView: some View {

        VStack {
            if self.viewModel.outputResults.count > 0 {
                List {
                    ForEach(self.viewModel.outputResults, id: \.self) { some in
                        Text("\(some.title) | \(some.subtitle)")
                    }
                }.frame(height: 200)
            }
            Text(viewModel.output)
        }
    }
}

extension RyanairView1 {
    var originStationView: some View {
        VStack {
            TextField("Origin. Ex: DUB", text: $viewModel.viewRequest.origin)
            if self.viewModel.airportsDepartureSuggestions.count > 0 {
                List {
                    ForEach(self.viewModel.airportsDepartureSuggestions, id: \.self) { some in
                        Text("\(some.code) | \(some.name)")
                    }
                }.frame(height: 200)
            }
        }
    }
}

extension RyanairView1 {
    var destinationStationView: some View {
        VStack {
            TextField("Destination. Ex: STN", text: $viewModel.viewRequest.destination)
            if self.viewModel.airportsArrivalSuggestions.count > 0 {
                List {
                    ForEach(self.viewModel.airportsArrivalSuggestions, id: \.self) { some in
                        Text("\(some.code) | \(some.name)")
                    }
                }.frame(height: 200)
            }
        }
    }
}

extension RyanairView1 {
    var departureDateView: some View {
        return VStack {
            DatePicker("Departure", selection: $viewModel.viewRequest.dateDeparture, displayedComponents: .date)
        }
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
