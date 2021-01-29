//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import RJSLibUFBase
//
import UtilsExtensions

struct VisualDocs_Image: View {
    var body : some View {
        ScrollView {
            Text("Images").font(.title)
            VStack {
                Group {
                    Divider()
                    Text("Pure").font(.footnote)
                    HStack {
                        ImageNames.house.image
                        Image(systemName: "house")
                    }
                }

                Group {
                    Divider()
                    Text("resizable + frame + scaled").font(.footnote)
                    HStack {
                        ImageNames.house.image.resizable()
                        ImageNames.house.image.resizable().frame(width: 50, height: 50, alignment: .center)
                        ImageNames.house.image.resizable().scaledToFit()
                    }
                    Divider()
                }
                Group {
                    Divider()
                    Text("Extensions").font(.footnote)
                    HStack {
                        ImageNames.house.image.contentMode(.fill)
                        ImageNames.house.image.resize(width: 50, height: 50, alignment: .center)
                        ImageNames.house.image.contentMode(.fit)
                    }
                }
                Group {
                    Divider()
                    Text("SymbolConfiguration : pointSize").font(.footnote)
                    HStack {
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 5, weight: .bold, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .bold, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large))!)
                    }
                }
                Group {
                    Divider()
                    Text("SymbolConfiguration : scale").font(.footnote)
                    HStack {
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .small))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .medium))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large))!)
                    }
                }
                Group {
                    Divider()
                    Text("SymbolConfiguration : weight").font(.footnote)
                    HStack {
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .ultraLight, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .thin, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .heavy, scale: .large))!)
                        Image(uiImage: UIImage(systemName: ImageNames.house.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .black, scale: .large))!)
                    }
                }

            }

        }
    }
}

// MARK: - Preview

public struct VisualDocs_Image_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        VisualDocs_Image()
    }
}
