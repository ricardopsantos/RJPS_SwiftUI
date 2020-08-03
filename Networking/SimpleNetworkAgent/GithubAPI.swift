import Foundation
import Combine

// https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/

/*
 The first endpoint that we implement is list user repositories:

 1 - Create a URLRequest instance, which describes the request. It doesn’t need any additional set up, since the HTTP method defaults to GET.
 2 - Agent executes the request and passes forward the repositories, skipping the response object. We skip response code validation to focus on the happy path.
*/

struct GithubAPIResponseModel {
    private init() { }
    struct User: Codable {
        let id: Int
    }

    struct Repository: Codable {
        let id: Int
        let name: String
        let description: String?
    }

    struct Issue: Codable {
        let id: Int
    }
}

enum GithubAPI {
    static let agent = SimpleNetworkAgent()
    static let base = URL(string: "https://api.github.com")!
}

extension GithubAPI {

    // 1
    static func repos(username: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], Error> {
        return run(URLRequest(url: base.appendingPathComponent("users/\(username)/repos")))
    }

    // 2
    static func issues(repo: String, owner: String) -> AnyPublisher<[GithubAPIResponseModel.Issue], Error> {
        return run(URLRequest(url: base.appendingPathComponent("repos/\(owner)/\(repo)/issues")))
    }
    
    static func repos(org: String) -> AnyPublisher<[GithubAPIResponseModel.Repository], Error> {
        return run(URLRequest(url: base.appendingPathComponent("orgs/\(org)/repos")))
    }
    
    static func members(org: String) -> AnyPublisher<[GithubAPIResponseModel.User], Error> {
        return run(URLRequest(url: base.appendingPathComponent("orgs/\(org)/members")))
    }
}

extension GithubAPI {
    static func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
