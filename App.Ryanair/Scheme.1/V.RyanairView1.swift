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
import Utils
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
                    outputView
                }
                ActivityIndicatorRepresentable(isAnimating: viewModel.isLoading)
            }
        }
    }
}

// MARK: - ViewModel -> View UI elements

extension RyanairView1 {

    var outputView: some View {
        VStack {
            Text(viewModel.viewIn.outputText)
                .font(.caption)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
            ConnectivityView(subTitle: "Will try to use cache if available")
        }
    }

    var outputViewList: some View {
        ForEach(self.viewModel.viewIn.outputList, id: \.self) { some in
            NavigationLink(destination: self.viewModel.routeWithFight(id: some.id) ) {
                SwiftUIFactory.ListItem(title: some.title,
                                        value: some.subtitle,
                                        imageName: "paperplane.fill",
                                        imageColor1: Color(UIColor(red: 238.0/255.0, green: 202.0/255.0, blue: 85.0/255.0, alpha: 1)),
                                        imageColor2: Color(UIColor(red: 48.0/255.0, green: 71.0/255.0, blue: 117.0/255.0, alpha: 1)))
            }
        }
    }
}

// MARK: - View -> ViewModel UI elements

extension RyanairView1 {
    var originStationView: some View {
        VStack {
            TextField("Origin. Ex: DUB", text: $viewModel.viewOut.origin)
            if self.viewModel.viewIn.airportsDepartureSuggestions.count > 0 {
                List {
                    ForEach(self.viewModel.viewIn.airportsDepartureSuggestions, id: \.self) { some in
                        Text("\(some.code) : \(some.name)").font(.footnote)
                    }
                }
            }
        }
    }

    var destinationStationView: some View {
        VStack {
            TextField("Destination. Ex: STN", text: $viewModel.viewOut.destination)
            if self.viewModel.viewIn.airportsArrivalSuggestions.count > 0 {
                List {
                    ForEach(self.viewModel.viewIn.airportsArrivalSuggestions, id: \.self) { some in
                        Text("\(some.code) : \(some.name)").font(.footnote)
                    }
                }
            }
        }
    }
}

extension RyanairView1 {
    var departureDateView: some View {
        return VStack {
            DatePicker("Departure", selection: $viewModel.viewOut.dateDeparture, displayedComponents: .date)
        }
    }
}

extension RyanairView1 {
    var adultsView: some View {
        VStack {
            Stepper(value: $viewModel.viewOut.adult,
                    onEditingChanged: { _ in  },
                    label: { Text("Adults: \(viewModel.viewOut.adult)") })
        }
    }

    var teensView: some View {
        VStack {
            Stepper(value: $viewModel.viewOut.teen,
                    onEditingChanged: { _ in  },
                    label: { Text("Teens: \(viewModel.viewOut.teen)") })
        }
    }

    var childrenView: some View {
        VStack {
            Stepper(value: $viewModel.viewOut.children,
                    onEditingChanged: { _ in  },
                    label: { Text("Children: \(viewModel.viewOut.children)") })
        }
    }
}

struct RyanairView1_PreviewProvider: PreviewProvider {
    static var previews: some View {
        RyanairView1Builder.buildView()
    }
}
