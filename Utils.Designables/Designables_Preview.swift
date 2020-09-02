//
//  Created by Ricardo Santos on 24/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI

public struct Designables_View: View {
    var food = ["Spaghetti", "Cheese Burger", "Pizza", "Fried Rice"]
    public init() { }
    public var body: some View {
        VStack {
            VStack {
                Text("Designables").font(.title)
                Divider()
            }
            VStack {
                Text("ConnectivityView").font(.caption)
                ConnectivityView(subTitle: "Try again latter")//.debugComposed()
                Divider()
            }
            VStack {
                Text("Button 1").font(.caption)
                DesignablesFactory.Button(title: "Title", action: { print("!action!") })
                Divider()
            }
            VStack {
                Text("TitleAndValue").font(.caption)
                DesignablesFactory.TitleAndValue(title: "Name", value: "Joe")
                Divider()
            }
            VStack {
                Text("Error view").font(.caption)
                DesignablesFactory.ErrorView(message: "Some error")
                Divider()
            }
            Text("ListItem (3 types)").font(.caption)
            List {
                DesignablesFactory.ListItem(title: "Option1 title", value: "Option1 value")
                DesignablesFactory.ListItem(title: "Option2 title", value: "Option2 value", imageName: "paperplane.fill", imageColor1: Color.red, imageColor2: Color.blue)
                DesignablesFactory.ListItem(title: "Option3 title", value: "Option3 value", imageName: "paperplane.fill")
            }
        }.padding()
    }
}

struct Designables_Previews: PreviewProvider {
    static var previews: some View {
        return Designables_View()
    }
}
