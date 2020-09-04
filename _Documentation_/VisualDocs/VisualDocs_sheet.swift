//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//

struct IdentifiableDetailsInfo: Identifiable {
    var id = UUID()
    let text: String
}

struct VisualDocs_Sheet_Details: View {
    @Environment(\.presentationMode) var presentation
    let details: IdentifiableDetailsInfo
    @State var showDismissButton: Bool
    var body: some View {
        VStack {
            Text(details.text)
            Button("Dismiss") { self.presentation.wrappedValue.dismiss() }
        }
    }
}

// //////////////////////////////////////////////////////
// //////////////////////////////////////////////////////
// //////////////////////////////////////////////////////

struct VisualDocs_Sheet_I: View {
    @State var isPresented = false
    var body: some View {
        VStack {
            Text("Main Screen")
        }
        .sheet(isPresented: $isPresented) {
            VisualDocs_Sheet_Details(details: IdentifiableDetailsInfo(text: "Will autodismiss"), showDismissButton: false)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    //self.isPresented.toggle()
                    self.isPresented = false
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                //self.isPresented.toggle()
                self.isPresented = true
            }
        }
    }
}

// MARK: - Preview VisualDocs_Binding_State

struct VisualDocs_Sheet_I_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_Sheet_I()
    }
}

// //////////////////////////////////////////////////////
// //////////////////////////////////////////////////////
// //////////////////////////////////////////////////////

struct VisualDocs_Sheet_II: View {
    @State private var details: IdentifiableDetailsInfo?
    @State var isPresented = false
    var body: some View {
        VStack {
            Button("Show Sheet") {
                self.details = IdentifiableDetailsInfo(text: "Hello, this is the sheet screen")
            }
            .sheet(item: $details) { detail in
                VisualDocs_Sheet_Details(details: detail, showDismissButton: true)
            }
        }
    }
}

struct VisualDocs_Sheet_II_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_Sheet_II()
    }
}
