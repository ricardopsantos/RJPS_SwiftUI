//
//  Created by Ricardo Santos on 02/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

private let boxWidth = UIScreen.screenWidth * 0.85
private let size_1: CGFloat = 50
private let colorPrimary = UIColor(red: CGFloat(46)/CGFloat(255),
                           green: CGFloat(99)/CGFloat(255),
                           blue: CGFloat(168)/CGFloat(255),
                           alpha: 1)
extension V {
    struct VisualDocs_Caixa_I: View {
        var body: some View {
            VStack {
                Image("caixa_1").resizable().frame(width: size_1 * 2, height: size_1, alignment: .center)
                HStack {
                    Text("Internet".uppercased()).textColor(Color(colorPrimary))
                    Text("Banking".uppercased()).bold().textColor(Color(colorPrimary))
                }
            }.padding()
        }
    }
}

// MARK: - Preview VisualDocs_Caixa_I

struct VisualDocs_Caixa_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Caixa_I()
    }
}

extension V {
    struct TextInputField: View {
        let title: String
        @State var value: String = ""
        var body: some View {
            VStack {
                Spacer()
                ZStack {
                    ZStack {
                        TextField(title, text: $value)
                            //.background(Color.white)
                            .padding(.horizontal, size_1 / 2)
                            .padding(.vertical, size_1 / 3)
                            .border(Color.secondary, width: 2)
                            .cornerRadius(8)
                            .frame(width: boxWidth, height: size_1)
                    }
                    ZStack {
                        HStack {
                            Text("  \(title)  ")
                                .textColor(Color(UIColor.darkGray))
                                .background(Color.white)
                                .offset(x: 0, y: -size_1/2).padding(.horizontal, size_1 / 1.5)

                            Spacer()
                        }
                    }
                }
            }.padding()
        }
    }
}
extension V {
    struct VisualDocs_Caixa_II: View {
        @State var rememberPassword = false
        let topPartBackgroundView: Color
        var viewTop: some View {
           ZStack {
                topPartBackgroundView
                VStack(alignment: .center, spacing: 20) {
                    HStack(spacing: 20) {
                        Text("Internet".uppercased())
                            .multilineTextAlignment(.trailing)
                            .textColor(Color.white)
                        Text("Banking".uppercased())
                            .bold()
                            .multilineTextAlignment(.leading)
                            .textColor(Color.white)
                    }.padding(.top, size_1)
                    Image("caixa_1").resizable().frame(width: size_1 * 2, height: size_1, alignment: .center)
                    Spacer()
                    HStack(spacing: 20) {
                        Button(action: {}) {
                            ZStack {
                                Capsule(style: .circular).frame(width: size_1 * 3.5, height: size_1).foregroundColor(Color.white)
                                Text("Pessoa fisica".uppercased())
                                    .bold().font(.footnote)
                            }
                        }
                        Button(action: {}) {
                            ZStack {
                                Capsule(style: .circular).frame(width: size_1 * 3.5, height: size_1).foregroundColor(Color.white)
                                Text("Pessoa Juridica".uppercased()).textColor(Color.gray)
                                    .font(.footnote)
                            }
                        }
                    }
                }.padding(.bottom, 30)
            }
        }

        var viewBottom: some View {
              VStack {
                  VStack {
                    V.TextInputField(title: "User")
                      Spacer()
                      V.TextInputField(title: "Password")
                      Button(action: {}) {
                          ZStack {
                              Text("Enter on your account".uppercased())
                                  .textColor(Color.white)
                                  .background(Color(colorPrimary), alignment: .center)
                                  .frame(width: boxWidth, height: size_1)
                                  .background(Color(colorPrimary))
                              .cornerRadius(9)
                          }
                      }
                      Spacer()
                      ZStack(alignment: .center) {
                          Text("Remember my password")
                              .multilineTextAlignment(.leading)
                              .textColor(Color(UIColor.lightGray))
                              .frame(maxWidth: .infinity, alignment: .trailing)
                              //.background(Color(UIColor.gray))
                              .padding(.horizontal, 60)
                          Toggle("", isOn: $rememberPassword)
                          //.background(Color(UIColor.gray))
                      }
                      .padding(.horizontal, size_1/2)
                      .padding(.vertical, size_1/2)
                  }
                  VStack {
                      Image(systemName: "qrcode.viewfinder")
                          .resizable()
                          .frame(width: size_1*1.5, height: size_1*1.5, alignment: .center).padding(.bottom, size_1*1.5)
                          //.background(Color(UIColor.gray))
                          .foregroundColor(Color(colorPrimary))
                      Text("Don't have an account".uppercased())
                        .bold().font(.footnote)
                        .textColor(Color(colorPrimary))
                        .frame(width: boxWidth, height: size_1*0.5)
                        //.background(Color(UIColor.gray))
                      Text("Accessibility mode".uppercased())
                        .bold().font(.footnote)
                        .textColor(Color(colorPrimary))
                        .frame(width: boxWidth, height: size_1*0.5)
                        //.background(Color(UIColor.gray))
                  }
              }
          }

        var viewMidle: some View {
            ZStack {
                topPartBackgroundView
                Rectangle()
                    .frame(width: UIScreen.screenWidth,
                           height: size_1)
                    .foregroundColor(Color(UIColor.white))
                    .cornerRadius(size_1)
                Color(UIColor.white).padding(.top, size_1 / 2)
            }
        }

        let topPartHeight: CGFloat = 200
        let clockBarSize: CGFloat = 44

        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                viewTop.padding(.top, -clockBarSize)
                viewMidle
                viewBottom
            }
        }
    }
}

// MARK: - Preview VisualDocs_Caixa_II

struct VisualDocs_Caixa_II: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_Caixa_II(topPartBackgroundView: Color(colorPrimary))
    }
}
