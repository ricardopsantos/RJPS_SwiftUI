//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine

struct Settings: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "airplane").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.orange).cornerRadius(6)
                            Text("Airplane Mode")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "wifi").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                            Text("Wi-Fi")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "wifi").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                            Text("Bluetooth")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "phone.fill").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Cellular")
                        }
                    }
                }

                Section {
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "app.badge").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.red).cornerRadius(6)
                            Text("Notifications")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "gear").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.gray).cornerRadius(6)
                            Text("General")
                        }
                    }
                }
            }
            .navigationBarTitle("Title")
            .listStyle(GroupedListStyle())

        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Preview

public struct Settings_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        Settings()
    }
}
