//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import Combine

struct Tinder: View {
    @State var size: CGSize = .zero
    var body: some View {
        //Lets Start with our Tinder Home Screen Recreate

        //First, we need entire background to be gray-ish color. ZStack puts different views on top of each other.
        ZStack {
            Color.init(red: 242/255, green: 242/255, blue: 242/255).edgesIgnoringSafeArea(.all)

            //Now we overlay everything on top of the screen above
            VStack {

                //Lets create the top button bar
                HStack {
                    Image(systemName: "person.fill").resizable().frame(width: 35, height: 35).foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "flame.fill").resizable().frame(width: 30, height: 35).foregroundColor(.red)
                    Spacer()
                    Image(systemName: "message.fill").resizable().frame(width: 35, height: 35).foregroundColor(.gray)
                }.padding(.horizontal)

                //Lets have the profile images on top of each other using ZStack
                ZStack {
                    Image(systemName: "person.fill").resizable().frame(height: 400).cornerRadius(12).padding(.vertical, 15).padding(.horizontal, 8).shadow(radius: 4)

                    //We want to be able to drag the picture on top. For this tutorial, let's learn how to add gestures to your components
                    Image(systemName: "person.fill").resizable().aspectRatio(contentMode: .fill).frame(height: 400).cornerRadius(12).padding(.vertical, 15).padding(.horizontal, 8).shadow(radius: 4).gesture(DragGesture().onChanged({ (value) in
                        self.size = value.translation
                    }).onEnded({ (value) in
                        _ = value
                        self.size = .zero
                    })).offset(self.size)
                }.animation(.spring())

                //Great, our final part is the action buttons on the bottom
                HStack {
                    Group {
                        Image(systemName: "arrow.counterclockwise").resizable().frame(width: 25, height: 25).padding().foregroundColor(.yellow)

                        Image(systemName: "xmark").resizable().frame(width: 30, height: 30).padding().foregroundColor(.pink)

                        Image(systemName: "star.fill").resizable().frame(width: 25, height: 25).padding().foregroundColor(.blue)

                        Image(systemName: "heart.fill").resizable().frame(width: 25, height: 25).padding().foregroundColor(.green)

                        Image(systemName: "sparkles").resizable().frame(width: 25, height: 25).padding().foregroundColor(.purple)
                    }.background(Color.white).shadow(radius: 25).clipShape(Circle())
                }
            }
        }
    }
}
// MARK: - Preview

public struct Tinder_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        Tinder()
    }
}
