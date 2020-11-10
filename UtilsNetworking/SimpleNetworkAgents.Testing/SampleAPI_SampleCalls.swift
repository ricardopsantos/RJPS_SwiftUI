import Foundation
import Combine
//
import BaseDomain

public struct SampleAPI_SampleCalls {
    private init() {}

    public static func test() {

        let cachePolicy: CachePolicy = .cacheAndLoad
        
        func basic(api: TestingAPIProtocol, identifier: String) {
            let response =  api.repos(username: "ricardopsantos", cache: cachePolicy).sink(receiveCompletion: { _ in }, receiveValue: {
                print("# \(identifier) : basic #####################################")
                print($0)
            })
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 3))
            withExtendedLifetime(response, {})
        }

        func chain(api: TestingAPIProtocol, identifier: String) {
            let repos = api.repos(username: "apple", cache: cachePolicy)
            let firstRepo = repos.compactMap { $0.first }
            let issues = firstRepo.flatMap { repo in
                api.issues(repo: repo.name, owner: "apple", cache: cachePolicy)
            }
            let token = issues.sink(receiveCompletion: { _ in }, receiveValue: {
                print("# \(identifier) : chain #####################################")
                print($0)
            })
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 3))
            withExtendedLifetime(token, {})
        }

        func parallel(api: TestingAPIProtocol, identifier: String) {
            let members = api.members(org: "apple", cache: cachePolicy)
            let repos = api.repos(org: "apple", cache: cachePolicy)
            let token = Publishers.Zip(members, repos)
                .sink(receiveCompletion: { _ in },
                      receiveValue: { (members, repos) in
                        print("# \(identifier) : parallel #####################################")
                        print(members, repos)
                })
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 3))
            withExtendedLifetime(token, {})
        }

        let sampleAPI_A = TestingAPI_VersionA()
        let sampleAPI_B = TestingAPI_VersionB()

        //basic(api: sampleAPI_A, identifier: "sampleAPI_A")
        basic(api: sampleAPI_B, identifier: "sampleAPI_B")

        //chain(api: sampleAPI_A, identifier: "sampleAPI_A")
        //chain(api: sampleAPI_B, identifier: "sampleAPI_B")

        //parallel(api: sampleAPI_A, identifier: "sampleAPI_A")
        //parallel(api: sampleAPI_B, identifier: "sampleAPI_B")

    }
}
