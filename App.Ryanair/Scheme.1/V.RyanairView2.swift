//
//  Created by Ricardo Santos on 20/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
//
import Utils_Designables
import Utils_Extensions
//
import App_Ryanair_Core

struct RyanairView2: View {

    @ObservedObject private var viewModel: RyanairView2ViewModel

    public init(viewModel: RyanairView2ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            Text("Flight details").font(.title)
            VStack {
                DesignablesFactory.TitleAndValue(title: "Number", value: viewModel.flight?.flightNumber ?? "")
                DesignablesFactory.TitleAndValue(title: "Key", value: viewModel.flight?.flightKey ?? "")
                DesignablesFactory.TitleAndValue(title: "Duration", value: viewModel.flight?.duration ?? "")
                DesignablesFactory.TitleAndValue(title: "Fares left", value: "\(viewModel.flight?.faresLeft ?? 0)")
            }.padding()
        }
    }
}

struct RyanairView2_PreviewProvider: PreviewProvider {
    static var previews: some View {
        let flight = RyanairResponseDto.Flight(faresLeft: 1,
                                               flightKey: "flightKey",
                                               infantsLeft: 1,
                                               operatedBy: "operatedBy",
                                               flightNumber: "flightNumber",
                                               time: ["time"],
                                               timeUTC: ["timeUTC"],
                                               duration: "12")
        return RyanairView2Builder.buildView(flight: flight).buildPreviews()
    }
}
