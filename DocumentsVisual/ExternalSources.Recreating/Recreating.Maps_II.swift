//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine
import MapKit 

struct Maps_II: View {
    @State var latitude = 37.7749
    @State var longitude = -122.4194
    var body: some View {
        ZStack {
            Maps_II_MapViewUIViewRepresentable(latitude: $latitude, longitude: $longitude)
            VStack {
                HStack {
                    Spacer()
                    Maps_II_Controls(latitude: $latitude, longitude: $longitude)
                }
                Spacer()
                Maps_II_Sheet()
            }
        }
        .cornerRadius(24)
    }
}

struct Maps_II_Sheet: View {
    @State var search = ""

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 32, height: 5)
                .foregroundColor(Color(UIColor.tertiaryLabel))

            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for a place or address", text: $search)
                    .foregroundColor(.primary)
                Image(systemName: "mic.fill")
            }
            .foregroundColor(Color(UIColor.tertiaryLabel))
            .padding(12)
            .background(Color(UIColor.tertiarySystemGroupedBackground))
            .cornerRadius(12)
        }
        .padding(24)
        .padding(.top, -16)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

struct Maps_II_Controls: View {
    @Binding var latitude: Double
    @Binding var longitude: Double

    var body: some View {
        VStack(spacing: 6) {
            VStack(spacing: 12) {
                Image(systemName: "info.circle")
                Divider()

                Button(action: {
                    // set location to New York
                    self.latitude = 40.7128
                    self.longitude = -74.0060
                }) {
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 40)
            .padding(.vertical, 12)
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(8)

            Image(systemName: "binoculars.fill")
                .frame(width: 40)
                .padding(.vertical, 12)
                .background(Color(UIColor.secondarySystemGroupedBackground))
                .cornerRadius(8)
        }
        .font(.system(size: 20))
        .foregroundColor(.blue)
        .padding()
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.1)), radius: 4)
    }
}

struct Maps_II_MapViewUIViewRepresentable: UIViewRepresentable {
    @Binding var latitude: Double
    @Binding var longitude: Double

    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)

        // drop a pin
        let pin = MKPointAnnotation()
        // set the coordinates
        pin.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        // add to map
        view.addAnnotation(pin)
    }
}

// MARK: - Preview

public struct Maps_II_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        Maps_II()
    }
}
