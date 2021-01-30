//
//  Created by Ricardo Santos on 04/09/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
//
import RJSLibUFBase
import RJSLibUFAppThemes

//
// https://medium.com/swlh/swiftui-custom-navigation-view-for-your-applications-7f6effa7dbcf
//

//
// NavigationItem, encapsulating an AnyView. Erasing the type of View,
// I am able to store different types of View objects, in a generic way; otherwise this would be
// impossible for a protocol with associated types.

struct NavigationItem {
   var view: AnyView
}

// Implement a navigation stack observable object that will provide published properties for current
// View (the view that is visible in the stack at the current moment) and the navigation stack.
// This stack contains the previous views that were shown so far, in order to provide the classical back functionality:

final class NavigationStack: ObservableObject {
    @Published var viewStack: [NavigationItem] = []
    @Published var currentView: NavigationItem

    init(_ currentView: NavigationItem) {
        self.currentView = currentView
    }

    // unwind — moves back to the previous view, which is stored as the last record in the stack)
    func unwind() {
        if viewStack.count == 0 {
            return
        }
        let last = viewStack.count - 1
        currentView = viewStack[last]
        viewStack.remove(at: last)
    }

    // advance — pushes a new view as currentView and add sthe previous current view in the stack
    func advance(_ view: NavigationItem) {
        viewStack.append(currentView)
        currentView = view
    }

    func home() {
       //currentView = NavigationItem( view: AnyView(HomeView()))
       viewStack.removeAll()
    }
}

// In order to observe the Navigation Stack properties and react to them, I need placeholder view
// that will react on changes of the currentView, displaying it. The NavigationStack is injected as
// EnvironmentObject into the view, therefore available for this view and all its child views.

struct NavigationHost: View {
   @EnvironmentObject var navigation: NavigationStack
   var body: some View {
      self.navigation.currentView.view
   }
}

struct BackView: View {
    var title: String
    var action: () -> Void
    var homeAction: () -> Void
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray).frame(height: 40)
            HStack {
                Button(action: action) {
                    Image(uiImage: UIImage( systemName: "arrow.turn.down.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large))!).padding(.leading, 20)
                }
                .foregroundColor(Color.black)
                Spacer()
                Text(title).padding(.leading, 20).font(Font.system(size: 20)).padding(.trailing, 20)
                Spacer()
                Button( action: homeAction) {
                    Image(uiImage: UIImage(systemName: "house", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15.0, weight: .bold, scale: .large))! ).padding(.trailing, 20)
                }
                .foregroundColor(Color.black)
            }
        }
    }
}

struct TitleView: View {
    var title: String
    var homeAction: () -> Void
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray).frame(height: 40)
            HStack {
                Spacer()
                Text(title)//.padding(.leading, 20).font(Font.system(size: 20.0))
                Spacer()
                Button(action: homeAction) {
                    ImageNames.house.image
                    Image(uiImage: UIImage(systemName: "house", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large))! ) .padding(.trailing, 20)
                }
                .foregroundColor(Color.black)
           }
       }
    }
}

struct NextView: View {
   @EnvironmentObject var navigation: NavigationStack
   var body: some View {
       VStack {
          BackView( title: "I am Next View", action: { self.navigation.unwind() }, homeAction: { self.navigation.home() })
          List {
             Text("I am NextView")
          }
      }
   }
}

struct HomeView: View {
    @EnvironmentObject var navigation: NavigationStack
    var body: some View {
        VStack {
            TitleView(title: "Home view", homeAction: { self.navigation.home() })
            List {
                Text("Move to NextView").onTapGesture {self.navigation.advance(NavigationItem( view: AnyView(NextView())))}
            }
        }
    }
}

struct NavigationStackSample: View {
   var body: some View {
      NavigationHost().environmentObject(NavigationStack(NavigationItem(view: AnyView(HomeView()))))
   }
}

// MARK: - Preview

struct NavigationStackSample_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStackSample()
    }
}
