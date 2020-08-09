//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// 3 ways, of having a view model reacting to the UI changes, and updating UI at same time
//

private func isCapicua(_ string: String) -> Bool {
    return String(string.reversed()) == string
}

//
// VisualDocs_SimpleViewModel_I : didSet
//

class VisualDocs_SimpleViewModel_I_ViewModel: ObservableObject {
    @Published var input: String = "" {
        didSet {
            output1 = isCapicua(input) ? "Capicua" : "Not capicua"
            output2 = String(input.reversed())
        }
    }
    @Published var output1: String = ""
    @Published var output2: String = ""
}

struct VisualDocs_SimpleViewModel_I: View {
    @ObservedObject var viewModel = VisualDocs_SimpleViewModel_I_ViewModel()
    var body: some View {
        VStack {
            TextField("Type a capicua", text: $viewModel.input).applyDefaultLayout()
            Spacer()
            Text(viewModel.output1)
            Text(viewModel.output2)
        }
    }
}

struct VisualDocs_SimpleViewModel_I_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_SimpleViewModel_I()
    }
}

//
// VisualDocs_SimpleViewModel_II : sink
//

public class VisualDocs_SimpleViewModel_II_ViewModel: ObservableObject {
    @Published var input: String = ""
    @Published var output1: String = ""
    @Published var output2: String = ""
    private var disposables = Set<AnyCancellable>()
    public init() {
        $input.sink { [weak self] (value) in
            self!.output1 = isCapicua(value) ? "Capicua" : "Not capicua"
        }.store(in: &disposables)

        $input.receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.output2 = String(value.reversed())
        }).store(in: &disposables)
    }
}

struct VisualDocs_SimpleViewModel_II: View {
    @ObservedObject private var viewModel = VisualDocs_SimpleViewModel_II_ViewModel()
    private var disposables = Set<AnyCancellable>()
    var body : some View {
        VStack {
            TextField("Type a capicua", text: $viewModel.input).applyDefaultLayout()
            Spacer()
            Text(viewModel.output1)
            Text(viewModel.output2)
        }
    }
}

struct VisualDocs_SimpleViewModel_II_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_SimpleViewModel_II()
    }
}

//
// VisualDocs_SimpleViewModel_II : AnyPublisher + assign
//

class PasswordCheckerViewModel2: ObservableObject {
    // input
    @Published var input = ""

    // output
    @Published var output1 = ""
    @Published var output2 = ""

    private var disposables: Set<AnyCancellable> = []

    private var isCapicuaPublisher: AnyPublisher<Bool, Never> {
        $input
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in return isCapicua(input) }
            .eraseToAnyPublisher()
    }

    private var usernameChangedPublisher: AnyPublisher<String, Never> {
        $input
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in return input }
            .eraseToAnyPublisher()
    }

    init() {
        isCapicuaPublisher
            .receive(on: RunLoop.main)
            .map { some in some ? "Is capicua" : "Is not capicua"
        }
        .assign(to: \.output1, on: self)
        .store(in: &disposables)

        usernameChangedPublisher
            .receive(on: RunLoop.main)
            .map { some in return String(some.reversed())
        }
        .assign(to: \.output2, on: self)
        .store(in: &disposables)

    }

}

struct VisualDocs_SimpleViewModel_III: View {
    @ObservedObject private var viewModel = PasswordCheckerViewModel2()
    var body: some View {
        VStack {
            TextField("Type a capicua", text: $viewModel.input).applyDefaultLayout()
            Spacer()
            Text(viewModel.output1)
            Text(viewModel.output2)
        }
    }
}

// MARK: - Preview VisualDocs_Binding_State

struct VisualDocs_SimpleViewModel_III_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VisualDocs_SimpleViewModel_III()
    }
}
