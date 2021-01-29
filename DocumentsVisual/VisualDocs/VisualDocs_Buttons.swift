//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import UtilsDesignables

struct VisualDocs_Buttons: View {
    let size_w: CGFloat = 50
    let size_h: CGFloat = 50
    var body: some View {
        ScrollView {
            Text("Buttons").font(.title)

            VStack {
                Divider()
                Button(action: { }) { Text("DefaultButtonStyle") } .buttonStyle(DefaultButtonStyle())
                Spacer()
                Button(action: { }) { Text("PlainButtonStyle") } .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: { }) { Text("BorderlessButtonStyle") } .buttonStyle(BorderlessButtonStyle())
            }
            VStack {
                Divider()
                Text("DesignablesFactory.ButtonView").font(.headline)
                Spacer()
                DesignablesFactory.Button(title: "SwiftUIFactory : 1")
                Spacer()
                DesignablesFactory.Button(title: "SwiftUIFactory : 2", subTitle: "subTitle") { print("Tapped") }
            }

            // Tap options
            // Tap options
            // Tap options

            VStack {
                Divider()
                Text("Tap options").font(.headline)
                Spacer()
                Button(action: { print("Tap options : 1") }, label: { Text("Tap option 1") } )
                Spacer()
                Button("Tap options : 2") { print("Tap") }
            }

            // Frame and padding
            // Frame and padding
            // Frame and padding

            VStack {
                Divider()
                Text("Frame and padding").font(.headline)
                Spacer()
                Button(action: {}) { Text("Not text padding...") }.frame(width: 300).background(Color.green).padding()
                Spacer()
                Button(action: {}) { Text("Text padding..").padding() }.frame(width: 300).background(Color.green)
            }

            // Fancy
            // Fancy
            // Fancy

            VStack {
                Divider()
                Text("Fancy").font(.headline)
                Button(action: {}) {
                    Text("Fancy : 1")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding(10)
                        .border(Color.blue, width: 5)

                }
                Spacer()
                Button(action: {}) {
                    Text("Fancy : 2")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.blue, lineWidth: 5))
                }
                Spacer()
                Button(action: {
                    print("Floating")
                }, label: {
                    Text("+")
                    .font(.system(.largeTitle))
                    .frame(width: 77, height: 70)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 7)
                })
                .background(Color.blue)
                .cornerRadius(38.5)
                .padding()
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
            }

            // Basic
            // Basic
            // Basic

            VStack {
                Divider()
                Text("Basic").font(.headline)
                Spacer()
                Button(action: {}) { Text("Basic_1") }.foregroundColor(.primary)
                Button(action: {}) { Text("Basic_2") }.foregroundColor(.secondary)
            }

            // Shapes and padding
            // Shapes and padding
            // Shapes and padding

            VStack {
                Divider()
                Text("Shapes and padding ").font(.headline)
                Button(action: { }) {
                    Image(systemName: "paperplane.fill").resizable().frame(width: 20, height: 20).foregroundColor(.red).padding()
                }.background(Color.blue).clipShape(Circle()).padding().padding(.horizontal, 30)
                Button(action: { }) {
                    Image(systemName: "paperplane.fill").resizable().frame(width: 20, height: 20).foregroundColor(.red).padding()
                }.background(Color.blue).padding().padding(.horizontal, 30)
            }

            // Composed
            // Composed
            // Composed

            VStack {
                Divider()
                Text("Composed").font(.headline)
                Button(action: { }) {
                    HStack {
                        Image(systemName: "plus.circle.fill").resizable().frame(width: 20, height: 20)
                        Text("New Reminder").foregroundColor(.blue)
                    }
                }.padding()
                Spacer()
                Button(action: {
                    print("Tap!")
                }, label: {
                    HStack {
                        Image(systemName: "trash").font(.title)
                        Text("Delete")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                })
            }
        }
    }
}

// MARK: - Preview

public struct VisualDocs_Buttons_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        VisualDocs_Buttons()
    }
}
