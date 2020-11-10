//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//

struct IdentifiableStruct: Identifiable {
    var id = UUID()
    let text: String
}

struct VisualDocs_Sheet_Details: View {
    @Environment(\.presentationMode) var presentation
    let details: IdentifiableStruct
    @State var showDismissButton: Bool
    var body: some View {
        VStack {
            Text(details.text)
            if showDismissButton {
                Button("Dismiss") { self.presentation.wrappedValue.dismiss() }
            }
        }
    }
}

// MARK: - Preview VisualDocs_Sheet_I

struct VisualDocs_Sheet_BaseI: View {
    @State var isPresented = false
    var body: some View {
        VStack {
            Text("Will present sheet in 3 seconds using @State var...").padding()
        }
        .sheet(isPresented: $isPresented) {
            VisualDocs_Sheet_Details(details: IdentifiableStruct(text: "Im the sheet! Will be automatically dismissed"), showDismissButton: false)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                //self.isPresented.toggle()
                self.isPresented = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    //self.isPresented.toggle()
                    self.isPresented = false
                }
            }
        }
    }
}

// MARK: - Preview VisualDocs_Sheet_II

struct VisualDocs_Sheet_BaseII: View {
    @State private var details: IdentifiableStruct?
    @State var isPresented = false
    var body: some View {
        VStack {
            Button("Show Sheet") {
                self.details = IdentifiableStruct(text: "Hello, this is the sheet screen")
            }
            .sheet(item: $details) { detail in
                VisualDocs_Sheet_Details(details: detail, showDismissButton: true)
            }
        }
    }
}

// MARK: - Preview

public struct VisualDocs_Sheet_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        TabView {
            VisualDocs_Sheet_BaseI().tabItem({ Text("1") })
            VisualDocs_Sheet_BaseII().tabItem({ Text("2") })
        }
    }
}
