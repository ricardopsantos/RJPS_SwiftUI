//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
//
import Utils_Designables
import Utils_Factory
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
                            outputViewList
                        }
                    }.navigationBarTitle(Text("Book flight"))
                    outputViewText
                }
                ActivityIndicatorRepresentable(isAnimating: viewModel.isLoading)
            }
        }
    }
}

// MARK: - ViewModel -> View UI elements

extension RyanairView1 {

    var outputViewText: some View {
        Text(viewModel.viewStateIn.outputText).bold().foregroundColor(Color.red)
    }

    var outputViewList: some View {
        ForEach(self.viewModel.viewStateIn.outputList, id: \.self) { some in
            NavigationLink(destination: self.viewModel.routeWithFight(id: some.id) ) {
                SwiftUIFactory.ListItem(title: some.title, value: some.subtitle, imageName: "paperplane.fill", imageColor: Color.red)
            }
        }
    }
}

// MARK: - View -> ViewModel UI elements

extension RyanairView1 {
    var originStationView: some View {
        VStack {
            TextField("Origin. Ex: DUB", text: $viewModel.viewStateOut.origin)
            if self.viewModel.viewStateIn.airportsDepartureSuggestions.count > 0 {
                List {
                    ForEach(self.viewModel.viewStateIn.airportsDepartureSuggestions, id: \.self) { some in
                        SwiftUIFactory.ListItem(title: some.code, value: some.name, imageName: "paperplane.fill", imageColor: Color.red)
                    }
                }
            }
        }
    }

    var destinationStationView: some View {
        VStack {
            TextField("Destination. Ex: STN", text: $viewModel.viewStateOut.destination)
            if self.viewModel.viewStateIn.airportsArrivalSuggestions.count > 0 {
                List {
                    ForEach(self.viewModel.viewStateIn.airportsArrivalSuggestions, id: \.self) { some in
                        SwiftUIFactory.ListItem(title: some.code, value: some.name, imageName: "paperplane.fill", imageColor: Color.red)
                    }
                }
            }
        }
    }
}

extension RyanairView1 {
    var departureDateView: some View {
        return VStack {
            DatePicker("Departure", selection: $viewModel.viewStateOut.dateDeparture, displayedComponents: .date)
        }
    }
}

extension RyanairView1 {
    var adultsView: some View {
        VStack {
            Stepper(value: $viewModel.viewStateOut.adult,
                    onEditingChanged: { _ in  },
                    label: { Text("Adults: \(viewModel.viewStateOut.adult)") })
        }
    }

    var teensView: some View {
        VStack {
            Stepper(value: $viewModel.viewStateOut.teen,
                    onEditingChanged: { _ in  },
                    label: { Text("Teens: \(viewModel.viewStateOut.teen)") })
        }
    }

    var childrenView: some View {
        VStack {
            Stepper(value: $viewModel.viewStateOut.children,
                    onEditingChanged: { _ in  },
                    label: { Text("Children: \(viewModel.viewStateOut.children)") })
        }
    }
}

struct RyanairView1_PreviewProvider: PreviewProvider {
    static var previews: some View {
        RyanairView1Builder.buildView()
    }
}
