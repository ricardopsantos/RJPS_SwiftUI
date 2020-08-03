//
//  Created by Ricardo Santos on 29/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Factory
import Extensions

// MARK: VisualDocs_RouteToAndCameBack_Sample_I

let tapToDetails: String = "Tap to details"

extension V {
    struct VisualDocs_RouteToAndCameBack_Sample_I_Details: View {
        @Environment(\.presentationMode) var presentation
        var body: some View {
            Button("Tap to Pop") { self.presentation.wrappedValue.dismiss() }
        }
    }
}

extension V {
    struct VisualDocs_RouteToAndCameBack_Sample_I: View {
        var body: some View {
            NavigationView {
                NavigationLink(destination: V.VisualDocs_RouteToAndCameBack_Sample_I_Details()) {
                    VStack {
                        Text(tapToDetails)
                    }
                }
            }
        }
    }
}

struct VisualDocs_RouteToAndCameBack_Sample_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_RouteToAndCameBack_Sample_I()
    }
}

// ////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////

// MARK: VisualDocs_RouteToAndCameBack_Sample_II

struct VisualDocs_RouteToAndCameBack_Identifiable: Identifiable {
    var id = UUID()
    let param: String
}

extension V {
    struct VisualDocs_RouteToAndCameBack_Sample_II_Details: View {
        let param: String
        var body: some View {
            Text(param)
        }
    }
}

extension V {
    struct VisualDocs_RouteToAndCameBack_Sample_II: View {
        @State private var model: VisualDocs_RouteToAndCameBack_Identifiable! // [sheet] require conformance to Identifiable
        var body: some View {
            ZStack {
                VStack(alignment: .center) {
                    SwiftUIFactory.ButtonView(title: tapToDetails, action: {
                        self.model = VisualDocs_RouteToAndCameBack_Identifiable(param: "Hi!")
                    }).sheet(item: $model, content: { some in
                        V.VisualDocs_RouteToAndCameBack_Sample_II_Details(param: some.param)
                    })
                }
            }
        }
    }
}

struct VisualDocs_RouteToAndCameBack_Sample_II: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_RouteToAndCameBack_Sample_I()
    }
}

// ////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////

// MARK: VisualDocs_RouteToAndCameBack_Sample_III

enum VisualDocs_RouteToAndCameBack_Sample_III_Pages: String {
    case page1
    case page2
}

extension V {
    struct VisualDocs_RouteToAndCameBack_Sample_III_Page1: View {
        @ObservedObject var viewRouter: VisualDocs_RouteToAndCameBack_Sample_III_Router
        var body: some View {
            VStack {
                Image("happyDog").contentMode(.fit)
                SwiftUIFactory.ButtonView(title: "Go to \(VisualDocs_RouteToAndCameBack_Sample_III_Pages.page2)", subTitle: "") {
                    self.viewRouter.currentPage = .page2
                }
            }
        }
    }
}

extension V {
    struct VisualDocs_RouteToAndCameBack_Sample_III_Page2: View {
        @ObservedObject var viewRouter: VisualDocs_RouteToAndCameBack_Sample_III_Router
        var body: some View {
            VStack {
                Image("grumpyDog").contentMode(.fit)
                SwiftUIFactory.ButtonView(title: "Go to \(VisualDocs_RouteToAndCameBack_Sample_III_Pages.page1)", subTitle: "") {
                    self.viewRouter.currentPage = .page1
                }
            }
        }
    }
}

class VisualDocs_RouteToAndCameBack_Sample_III_Router: ObservableObject {
    // PassthroughSubject : A subject that broadcasts elements to downstream subscribers.
    let objectWillChange = PassthroughSubject<VisualDocs_RouteToAndCameBack_Sample_III_Router, Never>()
    var currentPage: VisualDocs_RouteToAndCameBack_Sample_III_Pages = .page1 {
        didSet {
            objectWillChange.send(self)
        }
    }
}

extension V {

    struct VisualDocs_RouteToAndCameBack_Sample_III_BasePage: View {
        @ObservedObject var viewRouter: VisualDocs_RouteToAndCameBack_Sample_III_Router
        var body: some View {
            VStack {
                if viewRouter.currentPage == .page1 {
                    V.VisualDocs_RouteToAndCameBack_Sample_III_Page1(viewRouter: viewRouter)
                } else if viewRouter.currentPage == .page2 {
                    V.VisualDocs_RouteToAndCameBack_Sample_III_Page2(viewRouter: viewRouter)
                }
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_RouteToAndCameBack_Sample_III_BasePage: PreviewProvider {
    static var previews: some View {
        let viewRouter = VisualDocs_RouteToAndCameBack_Sample_III_Router()
        return V.VisualDocs_RouteToAndCameBack_Sample_III_BasePage(viewRouter: viewRouter)
    }
}
