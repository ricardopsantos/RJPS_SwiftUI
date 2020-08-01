//
//  Created by Ricardo Santos on 31/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

enum VisualDocs_ScreenSwap_Pages: String {
    case page1
    case page2
}

extension V {
    struct VisualDocs_ScreenSwap_ViewB: View {
        @ObservedObject var viewRouter: VisualDocs_ScreenSwap_Router
        var body: some View {
            VStack {
                Image("happyDog").resizable().aspectRatio(contentMode: .fit)
                SwiftUIFactory.ButtonView(title: "Go to Page 1", subTitle: "") {
                    self.viewRouter.currentPage = .page1
                }
            }
        }
    }
}

// MARK: - Preview Tab5ContentViewB_View

struct VisualDocs_ScreenSwap_ViewB: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_ScreenSwap_ViewB(viewRouter: VisualDocs_ScreenSwap_Router())
    }
}

extension V {

    struct VisualDocs_ScreenSwap_ViewA: View {
        @ObservedObject var viewRouter: VisualDocs_ScreenSwap_Router
        var body: some View {
            VStack {
                Image("grumpyDog").resizable().aspectRatio(contentMode: .fit)
                SwiftUIFactory.ButtonView(title: "Go to Page 2", subTitle: "") {
                    self.viewRouter.currentPage = .page2
                }
            }
        }
    }

}

// MARK: - Preview Tab5ContentViewA

struct VisualDocs_ScreenSwap_ViewA: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_ScreenSwap_ViewA(viewRouter: VisualDocs_ScreenSwap_Router())
    }
}

// MARK: - VisualDocs_ScreenSwap_Router

class VisualDocs_ScreenSwap_Router: ObservableObject {
    // PassthroughSubject : A subject that broadcasts elements to downstream subscribers.
    let objectWillChange = PassthroughSubject<VisualDocs_ScreenSwap_Router, Never>() 
    var currentPage: VisualDocs_ScreenSwap_Pages = .page1 {
        didSet {
            objectWillChange.send(self)
        }
    }
}

// MARK: - Preview VisualDocs_ScreenSwap

extension V {

    struct VisualDocs_ScreenSwap: View {
        @ObservedObject var viewRouter: VisualDocs_ScreenSwap_Router
        var body: some View {
            VStack {
                if viewRouter.currentPage == .page1 {
                    V.VisualDocs_ScreenSwap_ViewA(viewRouter: viewRouter)
                } else if viewRouter.currentPage == .page2 {
                    V.VisualDocs_ScreenSwap_ViewB(viewRouter: viewRouter)
                }
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_ScreenSwap: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_ScreenSwap(viewRouter: VisualDocs_ScreenSwap_Router())
    }
}
