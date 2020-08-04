//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//
// VisualDocs_SimpleViewModel_I : Whats going on?
//
// The View TextField is updates [vm.text] when we type, and
// the value is reflected back on the View Text
//

class VisualDocs_SimpleViewModel_I_ViewModel: ObservableObject {
    var placeHolderText: String = "type something...."
    @Published var input: String = ""
}

extension V {
    struct VisualDocs_SimpleViewModel_I: View {
        @ObservedObject var vm = VisualDocs_SimpleViewModel_I_ViewModel()
        var body: some View {
            VStack {
                TextField(vm.placeHolderText, text: $vm.input).padding().border(Color.green, width: 1).padding()
                Text(vm.input)
            }
        }
    }
}

// MARK: - Preview VisualDocs_SimpleViewModel_I

struct VisualDocs_SimpleViewModel_I: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_SimpleViewModel_I()
    }
}

//
// VisualDocs_SimpleViewModel_II : Whats going on?
//
// The View TextField is updates [vm.text] when we type, and
// we are observing that value on [$input.sink] and updating [$output]
// that is binded to View Text
//

public class VisualDocs_SimpleViewModel_II_ViewModel: ObservableObject {
    @Published var input: String = ""
    @Published var output1: String = ""
    @Published var output2: String = ""
    private var disposables = Set<AnyCancellable>()
    public init() {
        $input.sink { [weak self] (value) in
            self?.output1 = value
        }.store(in: &disposables)

        $input.receive(on: DispatchQueue.main).sink(receiveCompletion: { value in
            switch value {
            case .failure: break
            case .finished: break
            }
        }, receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.output2 = value
        }).store(in: &disposables)
    }
}

extension V {
    struct VisualDocs_SimpleViewModel_II: View {
        @ObservedObject private var vm = VisualDocs_SimpleViewModel_II_ViewModel()
        private var disposables = Set<AnyCancellable>()
        var body : some View {
            VStack {
                TextField("type something...", text: $vm.input).padding().border(Color.green, width: 1).padding()
                Text(vm.output1)
                Text(vm.output2)
            }
        }
    }
}

// MARK: - Preview VisualDocs_SimpleViewModel_II

struct VisualDocs_SimpleViewModel_II: PreviewProvider {
    static var previews: some View {
        V.VisualDocs_SimpleViewModel_II()
    }
}
