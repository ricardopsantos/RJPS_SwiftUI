//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//
import Extensions

private let clockBarSize: CGFloat = 44
private let boxWidth = UIScreen.screenWidth * 0.85
private let size_1: CGFloat = 50
private let colorPrimary = UIColor(red: CGFloat(46)/CGFloat(255), green: CGFloat(99)/CGFloat(255), blue: CGFloat(168)/CGFloat(255), alpha: 1)
private let colorOnPrimary = UIColor(red: CGFloat(245)/CGFloat(255), green: CGFloat(245)/CGFloat(255), blue: CGFloat(245)/CGFloat(255),
alpha: 1)

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

struct VisualDocs_Caixa_I_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_Caixa_I()
    }
}

// //////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////

struct VisualDocs_Caixa_II_TextInputField: View {
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
                VisualDocs_Caixa_II_TextInputField(title: "User")
                  Spacer()
                  VisualDocs_Caixa_II_TextInputField(title: "Password")
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
                      .foregroundColor(Color(colorPrimary))
                  Text("Don't have an account".uppercased())
                    .bold().font(.footnote)
                    .textColor(Color(colorPrimary))
                    .frame(width: boxWidth, height: size_1*0.5)
                  Text("Accessibility mode".uppercased())
                    .bold().font(.footnote)
                    .textColor(Color(colorPrimary))
                    .frame(width: boxWidth, height: size_1*0.5)
              }
          }
      }

    var viewMiddle: some View {
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
            viewMiddle
            viewBottom
        }
    }
}

struct VisualDocs_Caixa_II_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_Caixa_II(topPartBackgroundView: Color(colorPrimary))
    }
}

// //////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////

func button(systemName: String, name: String) -> some View {
    VStack {
        Image(systemName: systemName).resizable().frame(width: 44, height: 44, alignment: .center).foregroundColor(Color.orange)
        Text(name).bold()
    }.padding()
}

struct VisualDocs_Caixa_III: View {
    let topPartHeight: CGFloat = 200
    let viewMiddleHeight: CGFloat = 150

    var viewTop: some View {
        ZStack {
            Color(colorPrimary)
            HStack {
                ImageNames.person.imageCircle.resizable().frame(width: 44, height: 44)
                Spacer()
                Text("Conta poupança").bold().textColor(Color.white)
                Image(systemName: "chevron.down").foregroundColor(Color.white)
                Spacer()
                Image(systemName: "ellipsis").foregroundColor(Color.white).rotate(degrees: -90)
            }.padding(.leading, 44).padding(.trailing, 44)
        }
        .frame(maxWidth: .infinity)
        .frame(height: topPartHeight)
        .debugWithDashedStroke(color: UIColor.red)
    }

    var viewMiddle: some View {
        ZStack {
            Color(colorOnPrimary).cornerRadius(10)
            HStack {
                Spacer()
                Text("Saldo em conta").foregroundColor(Color(colorPrimary)).bold()
                Spacer()
            }
        }
        .padding()
        .frame(height: viewMiddleHeight)
        .padding(.top, topPartHeight * 0.4)
        .debugWithDashedStroke(color: UIColor.blue)
    }

    var viewBottom: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0..<4) { i in
                HStack(alignment: .center, spacing: 0) {
                    button(systemName: ImageNames.bag.rawValue, name: "\(i)")
                    Spacer()
                    button(systemName: ImageNames.bag.rawValue, name: "\(i)")
                    Spacer()
                    button(systemName: ImageNames.bag.rawValue, name: "\(i)")
                }.padding(.leading, 44).padding(.trailing, 44).padding(.top, 44)
            }
            Spacer()
            HStack {
                Spacer()
                Text("Solicitar ajudar").foregroundColor(Color(colorPrimary)).bold()
                Spacer()
            }
        }
        .padding(.top, viewMiddleHeight/2)
        .padding(.bottom, 44)
        .debugWithDashedStroke(color: UIColor.green)
    }

    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 0) {
                viewTop.padding(.top, -clockBarSize)
                viewBottom
            }
            viewMiddle
        }
    }
}

struct VisualDocs_Caixa_III_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_Caixa_III()
    }
}
