//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

//swiftlint:disable all

//
// Infinite List Scroll with SwiftUI and Combine
// https://www.vadimbulavin.com/infinite-list-scroll-swiftui-combine/
// Read also : https://www.vadimbulavin.com/modern-mvvm-ios-app-architecture-with-combine-and-swiftui/

struct InfiniteScrollView_API {
    enum WebAPI {
        static let pageSize = 10

        // 1 : Create a publisher that wraps a URL session data task.
        // 2 : Decode the response as GithubSearchResult. This is an intermediate type created for the purpose of parsing JSON.
        // 3 : Receive response on the main thread.
        static func searchRepos(query: String, page: Int) -> AnyPublisher<[Repository], Error> {
            let url = URL(string: "https://api.github.com/search/repositories?q=\(query)&sort=stars&per_page=\(Self.pageSize)&page=\(page)")!
            return URLSession.shared
                .dataTaskPublisher(for: url) // 1
                .tryMap { try JSONDecoder().decode(WebAPIGenericResultDto<InfiniteScrollView_API.Repository>.self, from: $0.data).items } // 2
                .receive(on: DispatchQueue.main) // 3
                .eraseToAnyPublisher()
        }
    }

    //
    // The models are implemented as follows:
    //

    struct WebAPIGenericResultDto<T: Codable>: Codable {
        let items: [T]
    }

    struct Repository: Codable, Identifiable, Equatable {
        let id: Int
        let name: String
        let description: String?
        let stargazers_count: Int
    }
}

//
// Implementing the View
//

struct RepositoryRow: View {
    let repo: InfiniteScrollView_API.Repository
    var body: some View {
        VStack {
            Text(repo.name).font(.title)
            Text("⭐️ \(repo.stargazers_count)")
            repo.description.map(Text.init)?.font(.body)
        }
        // By default, views occupy minimal space on the screen.
        // To expand the views to fill the super view space, we can leverage the frame
        // modifier and set the maxWidth and maxHeight properties in it to infinity
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}

struct InfiniteScrollView_Screen: View {

    // The list accepts an array of repositories to show, a callback that notifies when the list is
    // scrolled to the bottom, and an isLoading flag, that indicates whether a loading animation needs to be shown.
    let repos: [InfiniteScrollView_API.Repository]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void

    // The body contains a list and a loading indicator below it.
    var body: some View {
        List {
            ForEach(repos) { repo in
                // RepositoryRow represents a list entry.
                RepositoryRow(repo: repo).onAppear {
                    // We call onScrolledAtBottom() when the last repository appears on the screen.
                    if self.repos.last == repo {
                        self.onScrolledAtBottom()
                    }
                }
            }
            if isLoading {
                loadingIndicator
            }
        }
    }

    private var loadingIndicator: some View { Text("Loading") }
}

struct InfiniteScrollView: View {
    @ObservedObject var viewModel: RepositoriesViewModel
    var body: some View {
        InfiniteScrollView_Screen(repos: viewModel.state.repos, isLoading: viewModel.state.canLoadNextPage, onScrolledAtBottom: viewModel.fetchNextPageIfPossible)
        .onAppear(perform: viewModel.fetchNextPageIfPossible)
    }
    
}

// To support data binding, the view model must conform to the ObservableObject protocol,
// and provide at least one @Published property. Whenever such a variable is updated,
// SwiftUI re-renders the bound view automatically.

class RepositoriesViewModel: ObservableObject {
    @Published private(set) var state = State()
    var query: String = "swift"
    private var disposables = Set<AnyCancellable>()

    // The fetchNextPageIfPossible() method searches GitHub repositories using the ‘swift’ query.
    // It checks that the next page is available before requesting it.
    func fetchNextPageIfPossible() {
        guard state.canLoadNextPage else { return }
        InfiniteScrollView_API.WebAPI.searchRepos(query: query, page: state.page)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &disposables)
    }

    // The state contains all the information to render a view.
    struct State {
        var repos: [InfiniteScrollView_API.Repository] = []
        var page: Int = 1
        var canLoadNextPage = true
    }

    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished: break
        case .failure: state.canLoadNextPage = false
        }
    }

    private func onReceive(_ batch: [InfiniteScrollView_API.Repository]) {
        state.repos += batch
        state.page += 1
        state.canLoadNextPage = batch.count == InfiniteScrollView_API.WebAPI.pageSize
    }
}

public struct InfiniteScrollView_PreviewProvider: PreviewProvider {
    public static var previews: some View {
        InfiniteScrollView(viewModel: RepositoriesViewModel())
    }
}
