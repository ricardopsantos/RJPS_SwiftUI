import Foundation
import Combine

// https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/

public struct SimpleNetworkAgentTest {
    private init() {}

    public static func basic() {
        let response =  SampleAPI_I.repos(username: "ricardopsantos").sink(receiveCompletion: { _ in }, receiveValue: {
            print("# 1 #####################################")
            print($0)
        })
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 10))
        withExtendedLifetime(response, {})
    }

    public static func chain() {
        let me = "apple"
        let repos = SampleAPI_I.repos(username: me)
        let firstRepo = repos.compactMap { $0.first }
        let issues = firstRepo.flatMap { repo in
            SampleAPI_I.issues(repo: repo.name, owner: me)
        }

        let token = issues.sink(receiveCompletion: { _ in }, receiveValue: {
            print("# 2 #####################################")
            print($0)
        })

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 10))

        withExtendedLifetime(token, {})
    }

    // MARK: - Parallel

    public static func parallel() {
        let members = SampleAPI_I.members(org: "apple")
        let repos = SampleAPI_I.repos(org: "apple")
        let token = Publishers.Zip(members, repos)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { (members, repos) in
                    print("# 3 #####################################")
                    print(members, repos)
            })

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 3))

        withExtendedLifetime(token, {})
    }

}
