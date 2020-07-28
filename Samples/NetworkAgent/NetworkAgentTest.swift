import Foundation
import Combine

// https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/

struct NetworkAgentTest {
    private init() {}
    
    static func chain() {
        let me = "ricardopsantos"
        let repos = GithubAPI.repos(username: me)
        let firstRepo = repos.compactMap { $0.first }
        let issues = firstRepo.flatMap { repo in
            GithubAPI.issues(repo: repo.name, owner: me)
        }

        let token = issues.sink(receiveCompletion: { _ in }, receiveValue: {
            print("# 1 #####################################")
            print($0)
        })

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 10))

        withExtendedLifetime(token, {})
    }

    // MARK: - Parallel

    static func parallel() {
        let members = GithubAPI.members(org: "apple")
        let repos = GithubAPI.repos(org: "apple")
        let token = Publishers.Zip(members, repos)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { (members, repos) in
                    print("# 2 #####################################")
                    print(members, repos)
            })

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 3))

        withExtendedLifetime(token, {})
    }

}
