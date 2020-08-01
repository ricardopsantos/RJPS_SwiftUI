//
//  Created by Ricardo Santos on 01/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import MessageUI

struct MailView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?
    @State var emailTo: String
    @State var emailSubject: String

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?
        init(isShowing: Binding<Bool>, result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer {
                isShowing = false
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing, result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setSubject(emailSubject)
        vc.setToRecipients([emailTo])
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailView>) {

    }
}

extension V {
    struct VisualDocs_SendEmail: View {
        @State var result: Result<MFMailComposeResult, Error>?
        @State var isShowingMailView = false
        var body: some View {
            VStack {
                if MFMailComposeViewController.canSendMail() {
                    Button("Show mail view") {
                        self.isShowingMailView.toggle()
                    }
                } else {
                    Text("Can't send emails from this device")
                }
                if result != nil {
                    Text("Result: \(String(describing: result))").lineLimit(nil)
                }
            }
            .sheet(isPresented: $isShowingMailView) {
                MailView(isShowing: self.$isShowingMailView, result: self.$result, emailTo: "", emailSubject: "Hi")
            }
        }

    }
}

// MARK: - Preview

struct VisualDocs_SendEmail: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_SendEmail()
    }
}
