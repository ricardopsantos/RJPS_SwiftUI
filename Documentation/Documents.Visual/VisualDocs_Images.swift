//
//  Created by Ricardo Santos on 12/06/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

extension V {
    struct VisualDocs_Images: View {
        @State var imageNames = ImageNames.allCases
        var body: some View {
            VStack {
                Text("ImageNames.allCases").font(.title)
                ScrollView {
                    ForEach(self.imageNames, id: \.self) { imageName in
                        VStack {
                            Divider()
                            HStack {
                                Text(imageName.name).bold()
                                imageName.image.foregroundColor(Color(UIColor.black))
                            }.scaledToFill()
                            HStack {
                                VStack {
                                    imageName.imageFill.foregroundColor(Color(UIColor.black))
                                    Text(".fill").font(.caption).textColor(Color(UIColor.lightGray))
                                }.scaledToFill()
                                VStack {
                                    imageName.imageBadge.foregroundColor(Color(UIColor.black))
                                    Text(".badge").font(.caption).textColor(Color(UIColor.lightGray))
                                }.scaledToFill()
                                VStack {
                                    imageName.imageSquarePath.foregroundColor(Color(UIColor.black))
                                    Text(".squarePath").font(.caption).textColor(Color(UIColor.lightGray))
                                }.scaledToFill()
                                VStack {
                                    imageName.imageSquare.foregroundColor(Color(UIColor.black))
                                    Text(".square").font(.caption).textColor(Color(UIColor.lightGray))
                                }.scaledToFill()
                                VStack {
                                    imageName.imageCircle.foregroundColor(Color(UIColor.black))
                                    Text(".circle").font(.caption).textColor(Color(UIColor.lightGray))
                                }.scaledToFill()
                            }.scaledToFill()
                            HStack {
                                VStack {
                                    imageName.imageRight.foregroundColor(Color(UIColor.black))
                                    Text(".right").font(.caption).textColor(Color(UIColor.lightGray))
                                }.scaledToFill()
                                VStack {
                                    imageName.imageLeft.foregroundColor(Color(UIColor.black))
                                    Text(".left").font(.caption).textColor(Color(UIColor.lightGray))
                                }.scaledToFill()
                                VStack {
                                    imageName.imageUp.foregroundColor(Color(UIColor.black))
                                    Text(".up").font(.caption).textColor(Color(UIColor.lightGray))
                                }.scaledToFill()
                                VStack {
                                    imageName.imageDown.foregroundColor(Color(UIColor.black))
                                    Text(".down").font(.caption).textColor(Color(UIColor.lightGray))
                                }.scaledToFill()
                            }.scaledToFill()
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Preview

struct VisualDocs_Images: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Images()
    }
}
