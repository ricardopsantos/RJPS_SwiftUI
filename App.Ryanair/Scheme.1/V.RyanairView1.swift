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
import Base_Domain

struct RyanairView1: View {

    @ObservedObject private var viewModel: RyanairView1ViewModel
    @State var date: Date = Date()

    public init(viewModel: RyanairView1ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Form {
                        Section(header: Text("Book options")) {
                            departureDateView
                            HStack {
                                originStationView
                                Spacer()
                                destinationStationView
                            }
                            adultsView
                            teensView
                            childrenView
                        }
                        Section(header: Text("Book results")) {
                            outputViewList3
                        }
                    }.navigationBarTitle(Text("Book flight"))
                    outputViewText
                }
                ActivityIndicatorRepresentable(isAnimating: viewModel.isLoading)
            }
        }
    }
}

extension RyanairView1 {

    var outputViewText: some View {
        Text(viewModel.outputText).bold().foregroundColor(Color.red)
    }

    var outputViewList3: some View {
        ForEach(self.viewModel.outputList, id: \.self) { some in
            NavigationLink(destination: self.viewModel.routeWithFight(id: some.id) ) {
                Text("\(some.title) | \(some.subtitle)")
            }
        }
    }

    var outputViewList1: some View {
        VStack {
            if self.viewModel.outputList.count > 0 {
                List {
                    ForEach(self.viewModel.outputList, id: \.self) { some in
                        VStack {
                            Text("\(some.title)")
                            Text("\(some.subtitle)")
                        }
                    }
                }
            }
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

    var teensView: some View {
        VStack {
            Stepper(value: $viewModel.viewRequest.teen,
                    onEditingChanged: { _ in  },
                    label: { Text("Teens: \(viewModel.viewRequest.teen)") })
        }
    }

    var childrenView: some View {
        VStack {
            Stepper(value: $viewModel.viewRequest.children,
                    onEditingChanged: { _ in  },
                    label: { Text("Children: \(viewModel.viewRequest.children)") })
        }
    }
}

struct RyanairView1_PreviewProvider: PreviewProvider {
    static var previews: some View {
        RyanairView1Builder.buildView()
    }
}
