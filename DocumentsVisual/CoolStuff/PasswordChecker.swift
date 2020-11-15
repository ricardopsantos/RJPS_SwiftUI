//
//  Created by Ricardo Santos on 08/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//swiftlint:disable all

// https://peterfriese.dev/swift-combine-love/

class PasswordCheckerViewModel: ObservableObject {
    // input
    @Published var username = ""
    @Published var password = ""
    @Published var passwordAgain = ""

    // output
    @Published var usernameMessage = ""
    @Published var passwordMessage = ""
    @Published var isValid = false

    private var disposables: Set<AnyCancellable> = []

    init() {
        isUsernameValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in valid ? "" : "User name must at least have 3 characters"
        }
        .assign(to: \.usernameMessage, on: self)
        .store(in: &disposables)

        isPasswordValidPublisher
            .receive(on: RunLoop.main)
            .map { passwordCheck in
                switch passwordCheck {
                case .empty: return "Password must not be empty"
                case .noMatch: return "Passwords don't match"
                case .notStrongEnough: return "Password not strong enough"
                default: return ""
                }
        }
        .assign(to: \.passwordMessage, on: self)
        .store(in: &disposables)

        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &disposables)
    }

    private var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in return input.count >= 3 }
            .eraseToAnyPublisher()
    }

    private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { password in return password == "" }
            .eraseToAnyPublisher()
    }

    private var arePasswordsEqualPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($password, $passwordAgain)
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .map { password, passwordAgain in return password == passwordAgain }
            .eraseToAnyPublisher()
    }

    enum PasswordStrength {
        case reasonable
        case strong
        case veryStrong
        case weak
    }

    enum PasswordCheck {
        case valid
        case empty
        case noMatch
        case notStrongEnough
    }

    private var passwordStrengthPublisher: AnyPublisher<PasswordStrength, Never> {
        $password
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return input.count > 8 ? .strong : .weak
        }
        .eraseToAnyPublisher()
    }

    private var isPasswordStrongEnoughPublisher: AnyPublisher<Bool, Never> {
        passwordStrengthPublisher
            .map { strength in
                switch strength {
                case .reasonable, .strong, .veryStrong: return true
                default: return false
                }
        }
        .eraseToAnyPublisher()
    }

    private var isPasswordValidPublisher: AnyPublisher<PasswordCheck, Never> {
        Publishers.CombineLatest3(isPasswordEmptyPublisher, arePasswordsEqualPublisher, isPasswordStrongEnoughPublisher)
            .map { passwordIsEmpty, passwordsAreEqual, passwordIsStrongEnough in
                if passwordIsEmpty {  return .empty }
                else if !passwordsAreEqual { return .noMatch }
                else if !passwordIsStrongEnough { return .notStrongEnough }
                else { return .valid }
        }
        .eraseToAnyPublisher()
    }

    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isUsernameValidPublisher, isPasswordValidPublisher)
            .map { userNameIsValid, passwordIsValid in return userNameIsValid && (passwordIsValid == .valid)
        }
        .eraseToAnyPublisher()
    }
}

struct PasswordChecker: View {

    @ObservedObject private var userViewModel = PasswordCheckerViewModel()
    @State var presentAlert = false

    var body: some View {
        Form {
            Section(footer: Text(userViewModel.usernameMessage).foregroundColor(.red)) {
                TextField("Username", text: $userViewModel.username).autocapitalization(.none)
            }
            Section(footer: Text(userViewModel.passwordMessage).foregroundColor(.red)) {
                SecureField("Password", text: $userViewModel.password)
                SecureField("Password again", text: $userViewModel.passwordAgain)
            }
            Section {
                Button(action: { self.signUp() }) { Text("Sign up") }.disabled(!self.userViewModel.isValid)
            }
        }
        .sheet(isPresented: $presentAlert) {
            WelcomeView()
        }
    }

    func signUp() {
        self.presentAlert = true
    }
}

struct WelcomeView: View {
    var body: some View {
        Text("Welcome! Great to have you on board!")
    }
}

// MARK: - Preview VisualDocs_Binding_State

public struct PasswordChecker_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        PasswordChecker()
    }
}
