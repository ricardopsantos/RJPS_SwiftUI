import Foundation
import Combine

public struct SampleAPI_Testing {
    private init() {}

    public static func test() {

        func basic(api: SampleAPIProtocol, identifier: String) {
            let response =  api.repos(username: "ricardopsantos").sink(receiveCompletion: { _ in }, receiveValue: {
                print("# \(identifier) : basic #####################################")
                print($0)
            })
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 3))
            withExtendedLifetime(response, {})
        }

        func chain(api: SampleAPIProtocol, identifier: String) {
            let repos = api.repos(username: "apple")
            let firstRepo = repos.compactMap { $0.first }
            let issues = firstRepo.flatMap { repo in
                api.issues(repo: repo.name, owner: "apple")
            }
            let token = issues.sink(receiveCompletion: { _ in }, receiveValue: {
                print("# \(identifier) : chain #####################################")
                print($0)
            })
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 3))
            withExtendedLifetime(token, {})
        }

        func parallel(api: SampleAPIProtocol, identifier: String) {
            let members = api.members(org: "apple")
            let repos = api.repos(org: "apple")
            let token = Publishers.Zip(members, repos)
                .sink(receiveCompletion: { _ in },
                      receiveValue: { (members, repos) in
                        print("# \(identifier) : parallel #####################################")
                        print(members, repos)
                })
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 3))
            withExtendedLifetime(token, {})
        }

        let sampleAPI_A = SampleAPI_A()
        let sampleAPI_B = SampleAPI_B()

        //basic(api: sampleAPI_A, identifier: "sampleAPI_A")
        //basic(api: sampleAPI_B, identifier: "sampleAPI_B")

        //chain(api: sampleAPI_A, identifier: "sampleAPI_A")
        //chain(api: sampleAPI_B, identifier: "sampleAPI_B")

        parallel(api: sampleAPI_A, identifier: "sampleAPI_A")
        parallel(api: sampleAPI_B, identifier: "sampleAPI_B")
    }
}
