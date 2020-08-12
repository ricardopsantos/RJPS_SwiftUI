import Foundation
import Combine

// https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/

var sampleAPI_I = SampleAPI_I()
var sampleAPI_II = SimpleNetworkAgent_B()

public struct NetworkAgentsTest {
    private init() {}

    public static func test() {
        SimpleNetworkAgent_A.basic()
        //SimpleNetworkAgent_A.chain()
        //SimpleNetworkAgent_A.parallel()
        SimpleNetworkAgent_B.basic()
    }
}

extension NetworkAgentsTest {
    struct SimpleNetworkAgent_B {
        static func basic() {
            let response =  sampleAPI_II.repos(username: "ricardopsantos").sink(receiveCompletion: { _ in }, receiveValue: {
                print("# SimpleNetworkAgent_B.1 #####################################")
                print($0)
            })
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 10))
            withExtendedLifetime(response, {})
        }
    }
}

extension NetworkAgentsTest {
    struct SimpleNetworkAgent_A {
        public static func basic() {
            let response =  sampleAPI_I.repos(username: "ricardopsantos").sink(receiveCompletion: { _ in }, receiveValue: {
                print("# sampleAPI_I.1 #####################################")
                print($0)
            })
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 10))
            withExtendedLifetime(response, {})
        }

        public static func chain() {
            let me = "apple"
            let repos = sampleAPI_I.repos(username: me)
            let firstRepo = repos.compactMap { $0.first }
            let issues = firstRepo.flatMap { repo in
                sampleAPI_I.issues(repo: repo.name, owner: me)
            }

            let token = issues.sink(receiveCompletion: { _ in }, receiveValue: {
                print("# 2 #####################################")
                print($0)
            })

            RunLoop.main.run(until: Date(timeIntervalSinceNow: 10))

            withExtendedLifetime(token, {})
        }

        public static func parallel() {
            let members = sampleAPI_I.members(org: "apple")
            let repos = sampleAPI_I.repos(org: "apple")
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
}
