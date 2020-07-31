//
//  File.swift
//  UglySwiftUIApp
//
//  Created by Ricardo Santos on 31/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// https://developer.apple.com/documentation/swiftui/binding
//
// Use a binding to create a two-way connection between a property that stores data,
// and a view that displays and changes the data. A binding connects a property to a
// source of truth stored elsewhere, instead of storing data directly. For example, a
// button that toggles between play and pause can create a binding to a property of its parent
// view using the Binding property wrapper.
//

struct Episode {
    let title: String
    let showTitle: String
}

extension V {
    struct PlayButton: View {
        @Binding var isPlaying: Bool
        var body: some View {
            Button(action: { self.isPlaying.toggle() }) {
                Image(systemName: isPlaying ? "pause.circle" : "play.circle")
            }
        }
    }
}

extension V {
    struct VisualDocs_Binding_I: View {
        var episode: Episode
        @State private var isPlaying: Bool = false
        var body: some View {
            ScrollView {
                VStack {
                    Text(episode.title)
                    if isPlaying {
                        ImageNames.app.image
                    }
                    V.PlayButton(isPlaying: $isPlaying)
                }.scaledToFill()
            }
        }
    }
}

struct VisualDocs_Binding_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Binding_I(episode: Episode(title: "title", showTitle: "showTitle"))
    }
}
