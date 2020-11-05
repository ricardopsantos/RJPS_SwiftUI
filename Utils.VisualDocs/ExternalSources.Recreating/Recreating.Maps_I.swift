//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine
import MapKit 

struct Maps_I: View {
    var body: some View {
        ZStack {
            Maps_I_MapViewUIViewRepresentable()
            VStack {
                HStack {
                    Spacer()
                    Controls_Maps_I()
                }
                Spacer()
                Sheet_Maps_I()
            }
        }
        .cornerRadius(24)
    }
}

struct Sheet_Maps_I: View {
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

struct Controls_Maps_I: View {
    var body: some View {
        VStack(spacing: 6) {
            VStack(spacing: 12) {
                Image(systemName: "info.circle")
                Divider()
                Image(systemName: "location.fill")
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

struct Maps_I_MapViewUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        // do nothing
    }
}

// MARK: - Preview

struct Maps_I_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        Maps_I()
    }
}
