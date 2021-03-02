//
//  Created by Ricardo Santos on 24/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
//
import RJSLibUFAppThemes
import RJSLibUFBase

public struct Designables_View: View {
    public init() { }
    @State private var valuesFloatingTextField = ""

    public var body: some View {
        VStack {
            VStack {
                Text("Designables").font(.title)
                Divider()
            }
            VStack {
                Text("Button 1").font(.caption)
                DesignablesFactory.Button(title: "Title", action: { print("!action!") })
                Divider()
            }
            VStack {
                Text("FloatingTextField").font(.caption)
                DesignablesFactory.FloatingTextField(title: "First Name", text: $valuesFloatingTextField)
                Text(valuesFloatingTextField)
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

// MARK: - Preview

public struct VisualDocs_Designables: PreviewProvider {
    public static var previews: some View {
        return Designables_View().buildPreviews()
    }
}
