//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI
import Combine
//
import RJSLibUFBase
import RJSLibUFAppThemes
//
import Utils

struct DevScreen_View: View {
    var body : some View {

        NavigationView {
            List {
                Section(header: Text("WIKI Reference")) {
                    NavigationLink(destination: VisualDocs_Colors_PreviewProvider.previews) { Text("Color WIKI") }
                    NavigationLink(destination: VisualDocs_Fonts_PreviewProvider.previews) { Text("Fonts WIKI") }
                    //NavigationLink(destination: VisualDocs_ImageName_PreviewProvider.previews) { Text("Images WIKI") }
                    NavigationLink(destination: VisualDocs_Shapes_PreviewProvider.previews) { Text("Shapes WIKI") }
                }
                Section(header: Text("Personal Components Reference")) {
                    NavigationLink(destination: VisualDocs_Designables.previews) { Text("My Designables") }
                    NavigationLink(destination: VisualDocs_ViewExtensions_PreviewProvider.previews) { Text("View+Extensions") }
                    NavigationLink(destination: VisualDocs_Buttons_PreviewProvider.previews) { Text("Sample Buttons") }
                    NavigationLink(destination: VisualDocs_Shadows_PreviewProvider.previews) { Text("Sample Shadows") }
                    NavigationLink(destination: VisualDocs_Image_PreviewProvider.previews) { Text("Sample Images") }
                }
                Section(header: Text("SwiftUI Components Reference")) {
                    NavigationLink(destination: VisualDocs_ForEach_PreviewProvider.previews) { Text("ForEach") }
                    NavigationLink(destination: VisualDocs_Lists_PreviewProvider.previews) { Text("Lists") }
                    NavigationLink(destination: VisualDocs_Form_PreviewProvider.previews) { Text("Form") }
                    NavigationLink(destination: VisualDocs_TabView_PreviewProvider.previews) { Text("TabView") }
                    NavigationLink(destination: VisualDocs_Sheet_PreviewProvider.previews) { Text("Sheet") }
                    NavigationLink(destination: VisualDocs_VisualDocs_NavigationView_A_PreviewProvider.previews) { Text("NavigationView") }
                }
                Section(header: Text("SwiftUI operators Reference")) {
                    NavigationLink(destination: VisualDocs_Padding_PreviewProvider.previews) { Text("Padding") }
                }
                Section(header: Text("Combine & State")) {
                    NavigationLink(destination: VisualDocs_Combine_PreviewProvider.previews) { Text("Combine") }
                    NavigationLink(destination: VisualDocs_State_PreviewProvider.previews) { Text("@State") }
                    NavigationLink(destination: VisualDocs_EnvironmentObject_PreviewProvider.previews) { Text("@EnvironmentObject & @ObservedObject") }
                    NavigationLink(destination: VisualDocs_Published_PreviewProvider.previews) { Text("@Published & @ObservedObject") }
                }
                Section(header: Text("Events")) {
                    NavigationLink(destination: VisualDocs_OnEditingChanged_PreviewProvider.previews) { Text("onEditingChanged") }
                    NavigationLink(destination: VisualDocs_OnReceive_PreviewProvider.previews) { Text("onReceive") }
                    NavigationLink(destination: VisualDocs_OnDelete_PreviewProvider.previews) { Text("onDelete") }
                }
                Section(header: Text("Misc")) {
                    NavigationLink(destination: VisualDocs_Background_PreviewProvider.previews) { Text("Background") }
                    NavigationLink(destination: PasswordChecker_PreviewProvider.previews) { Text("PasswordChecker") }
                    NavigationLink(destination: InfiniteScrollView_PreviewProvider.previews) { Text("InfiniteScrollView") }
                    NavigationLink(destination: SimpleMVVM_PreviewProvider.previews) { Text("SimpleMVVM") }
                    NavigationLink(destination: ScrollEffect3D_PreviewProvider.previews) { Text("ScrollEffect3D") }
                    NavigationLink(destination: VisualDocs_TimerView_PreviewProvider.previews) { Text("TimerView") }
                }
                Section(header: Text("Recreating")) {
                    Group {
                        NavigationLink(destination: Breathe_PreviewProvider.previews) { Text("Breathe") }
                        NavigationLink(destination: Settings_PreviewProvider.previews) { Text("Settings") }
                        NavigationLink(destination: Twitter_PreviewProvider.previews) { Text("Twitter") }
                        NavigationLink(destination: Instragram_PreviewProvider.previews) { Text("Instagram") }
                        NavigationLink(destination: InstagramMessages_PreviewProvider.previews) { Text("InstagramMessages") }
                    }
                    Group {
                        NavigationLink(destination: HomeScreen_PreviewProvider.previews) { Text("HomeScreen") }
                        NavigationLink(destination: LockScreen_PreviewProvider.previews) { Text("LockScreen") }
                        NavigationLink(destination: Tinder_PreviewProvider.previews) { Text("Tinder") }
                        NavigationLink(destination: Messages_I_PreviewProvider.previews) { Text("Messages_I") }
                        NavigationLink(destination: Messages_II_PreviewProvider.previews) { Text("Messages_II") }
                    }
                    Group {
                        NavigationLink(destination: Messages_III_PreviewProvider.previews) { Text("Messages_III") }
                        NavigationLink(destination: IPhone12ProWebsite_PreviewProvider.previews) { Text("IPhone12ProWebsite") }
                        NavigationLink(destination: AppStore_PreviewProvider.previews) { Text("AppStore") }
                        NavigationLink(destination: Reminder_PreviewProvider.previews) { Text("Reminder") }
                        NavigationLink(destination: Maps_I_PreviewProvider.previews) { Text("Maps_I") }
                    }
                    Group {
                        NavigationLink(destination: Maps_II_PreviewProvider.previews) { Text("Maps_II") }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Dev Screen")
        }
        .tabItem({ VStack { ImageNames.heart.image; Text("Dev") } })}
}

public struct DevScreen_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        Group {
            DevScreen_View().previewDisplayName("Default")
            DevScreen_View().environment(\.colorScheme, .dark).previewDisplayName("Dark")
        }
    }
}

