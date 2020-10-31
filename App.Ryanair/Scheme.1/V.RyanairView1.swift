//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
//
import Utils_Designables
import Utils
import Utils_Extensions
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
        ZStack {
            NavigationView {
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
                    }.navigationBarTitle(Text("Book flight ✈️"))
                    outputView
                }
            }
            .disabled(viewModel.viewIn.isLoading).blur(radius: viewModel.viewIn.isLoading ? 3 : 0)
            ActivityIndicator_V2(isAnimating: $viewModel.viewIn.isLoading)
        }
    }
}

// MARK: - ViewModel -> View UI elements

extension RyanairView1 {

    var outputView: some View {
        VStack {
            DesignablesFactory.ErrorView(message: viewModel.viewIn.outputText)
            ConnectivityView(subTitle: "Will try to use cache if available")
        }
    }

    var outputViewList: some View {
        ForEach(self.viewModel.viewIn.outputList, id: \.self) { some in
            NavigationLink(destination: self.viewModel.routeWithFight(id: some.id) ) {
                DesignablesFactory.ListItem(title: some.title,
                                        value: some.subtitle,
                                        imageName: ImageNames.paperplane.rawValue,
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
                .accessibility(identifier: "TextField.origin")
            if self.viewModel.viewIn.airportsDepartureSuggestions.count > 0 {
                List {
                    ForEach(self.viewModel.viewIn.airportsDepartureSuggestions, id: \.self) { some in
                        HStack {
                            Text("\(some.code) : \(some.name)").font(.footnote)
                            Spacer()
                        }
                    }
                }.multilineTextAlignment(.leading)
            } else {
                Spacer()
            }
        }
    }

    var destinationStationView: some View {
        VStack {
            TextField("Destination. Ex: STN", text: $viewModel.viewOut.destination)
                .accessibility(identifier: "TextField.destination")
            if self.viewModel.viewIn.airportsArrivalSuggestions.count > 0 {
                List {
                    ForEach(self.viewModel.viewIn.airportsArrivalSuggestions, id: \.self) { some in
                        HStack {
                            Spacer()
                            Text("\(some.code) : \(some.name)").font(.footnote)
                        }
                    }
                }
            } else {
                Spacer()
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
                .accessibility(identifier: "Stepper.adult")
        }
    }

    var teensView: some View {
        VStack {
            Stepper(value: $viewModel.viewOut.teen,
                    onEditingChanged: { _ in  },
                    label: { Text("Teens: \(viewModel.viewOut.teen)") })
                .accessibility(identifier: "Stepper.teen")
        }
    }

    var childrenView: some View {
        VStack {
            Stepper(value: $viewModel.viewOut.children,
                    onEditingChanged: { _ in  },
                    label: { Text("Children: \(viewModel.viewOut.children)") })
            .accessibility(identifier: "Stepper.children")
        }
    }
}

// MARK: - Preview

struct RyanairView1_PreviewProvider1: PreviewProvider {
    static var previews: some View {
        RyanairView1Builder.buildView().buildPreviews()
    }
}

struct RyanairView1_PreviewProvider2: PreviewProvider {
    static var previews: some View {
        RyanairView1Builder.buildMockView().buildPreviews()
    }
}

struct RyanairView1_PreviewProvider3: PreviewProvider {
    static var previews: some View {
        ActivityIndicator_V3(isAnimating: .constant(true), message: .constant("Loading..."), content: {
            RyanairView1Builder.buildMockView()
        })
    }
}

