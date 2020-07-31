import Foundation
import Combine
import SwiftUI

enum Tab5Pages: String {
    case page1
    case page2
}

extension V {
    struct Tab5ContentViewB: View {
        @ObservedObject var viewRouter: Tab5_ViewRouter
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

struct Tab5ContentViewB: PreviewProvider {
    static var previews: some View {
        V.Tab5ContentViewB(viewRouter: Tab5_ViewRouter())
    }
}

extension V {

    struct Tab5ContentViewA: View {
        @ObservedObject var viewRouter: Tab5_ViewRouter
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

struct Tab5ContentViewA: PreviewProvider {
    static var previews: some View {
        V.Tab5ContentViewA(viewRouter: Tab5_ViewRouter())
    }
}

// MARK: - Tab5_ViewRouter

class Tab5_ViewRouter: ObservableObject {
    // PassthroughSubject : A subject that broadcasts elements to downstream subscribers.
    let objectWillChange = PassthroughSubject<Tab5_ViewRouter, Never>() // DONT CHANGE NAME, else Stops working
    var currentPage: Tab5Pages = .page1 {
        didSet {
            objectWillChange.send(self)
        }
    }
}

// MARK: - Preview Tab5ContentViewA

extension V {

    struct Tab5_View: View {
        @ObservedObject var viewRouter: Tab5_ViewRouter
        var body: some View {
            VStack {
                if viewRouter.currentPage == Tab5Pages.page1 {
                    V.Tab5ContentViewA(viewRouter: viewRouter)
                } else if viewRouter.currentPage == Tab5Pages.page2 {
                    V.Tab5ContentViewB(viewRouter: viewRouter)
                }
            }
        }
    }
}

// MARK: - Preview

struct Tab5_View_Previews: PreviewProvider {
    static var previews: some View {
        V.Tab5_View(viewRouter: Tab5_ViewRouter())
    }
}
