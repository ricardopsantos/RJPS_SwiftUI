//
//  Created by Ricardo Santos on 13/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import Combine

private enum XError: Error {
    case parsing(description: String)
    case generic
    case ok
}

extension UserDefaults {
    @objc var myStoredUserDefaultsValue: Float {
        get {
            return float(forKey: "myStoredUserDefaultsValue")
        }
        set {
            set(newValue, forKey: "myStoredUserDefaultsValue")
        }
    }
}

public class CombineTesting {

    private init() { }
    public static var shared = CombineTesting()
    var subscriptions: Set<AnyCancellable> = []

    public func test_AnyPublisher() {
        func somethingOK() -> AnyPublisher<String, XError> {
            let allCool = arc4random_uniform(2) == 0
            if allCool {
                return Just("Hi").mapError { _ in .ok }.eraseToAnyPublisher()
            } else {
                return Fail(error: XError.generic).eraseToAnyPublisher()
            }
        }

        func somethingNotOK() -> AnyPublisher<String, XError> {
            return Fail(error: XError.generic).eraseToAnyPublisher()
        }

        let responseOK = somethingOK()
        responseOK.sink(receiveCompletion: { (result) in
            switch result {
            case .finished: _ = ()
            case .failure(let error): _ = error
            }
        }, receiveValue: { (some) in
            print(some)
        }).store(in: &subscriptions)

    }
    // CurrentValueSubject
    // https://developer.apple.com/documentation/combine/currentvaluesubject
    // A subject that wraps a single value and publishes a new element whenever the value changes.
    public func testing_CurrentValueSubject() {

        // DECLARE

        let var1 = CurrentValueSubject<[String], Never>([])
        let var2 = CurrentValueSubject<Int, Never>(0)
        let var3 = CurrentValueSubject<Date?, Never>(nil)

        // OBSERVE Single

        var1.sink { print("# var1 : \($0)") }.store(in: &subscriptions)
        var2.sink { print("# var2 : \($0)") }.store(in: &subscriptions)
        var3.sink { print("# var3 : \(String(describing: $0))") }.store(in: &subscriptions)

        // OBSERVE Combine 2

        var combineLatestCount = 0
        Publishers.CombineLatest(var1, var2).sink(receiveValue: { var1, var2 in
            combineLatestCount += 1
            print("# \(combineLatestCount) - CombineLatest : \(var1), \(var2)")
        }).store(in: &subscriptions)

        // OBSERVE Combine 3

        var combineLatestCount3 = 0
        Publishers.CombineLatest3(var1, var2, var3).sink(receiveValue: { var1, var2, var3 in
            combineLatestCount3 += 1
            print("# \(combineLatestCount3) - CombineLatest3 : \(var1), \(var2), \(String(describing: var3))")
        }).store(in: &subscriptions)

        // OBSERVE Zip 2

        var zipCount = 0
        Publishers.Zip(var1, var2).sink(receiveValue: { var1, var2 in
            zipCount += 1
            print("# \(zipCount) - Zip : \(var1), \(var2)")
        }).store(in: &subscriptions)

        // OBSERVE Zip 3

        var zip3Count = 0
        Publishers.Zip3(var1, var2, var3).sink(receiveValue: { var1, var2, var3 in
            zip3Count += 1
            print("# \(zip3Count) - Zip3 : \(var1), \(var2), \(String(describing: var3))")
        }).store(in: &subscriptions)

        // CHANGE STATE

        var1.send(["test", "test1"])
        var2.send(1)
        var3.send(Date())
    }

    public func testing_AnyPublisher() {
        // let x = AnyPublisher<String, Never>("")
    }

    public func observe_UserDefaults() {

        //https://medium.com/better-programming/observe-userdefaults-using-combine-in-swift-5-4177ae62360d

        UserDefaults.standard
            .publisher(for: \.myStoredUserDefaultsValue)
            .handleEvents(receiveOutput: { musicVolume in
                print("Music volume is now: \(musicVolume)")
            })
            .sink { _ in }
            .store(in: &subscriptions)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let randomInteger = (0...100).randomElement()!
            UserDefaults.standard.myStoredUserDefaultsValue = Float(randomInteger)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            let randomInteger = (0...100).randomElement()!
            UserDefaults.standard.myStoredUserDefaultsValue = Float(randomInteger)
        }
    }

    // https://developer.apple.com/documentation/combine/publisher/handleevents(receivesubscription:receiveoutput:receivecompletion:receivecancel:receiverequest:)
    public func testing_handleEvents() {
        let integers = (0...2)
        _ = integers.publisher
            .handleEvents(receiveSubscription: { subs in
                print("Subscription: \(subs.combineIdentifier)")
            }, receiveOutput: { anInt in
                print("in output handler, received \(anInt)")
            }, receiveCompletion: { _ in
                print("in completion handler")
            }, receiveCancel: {
                print("received cancel")
            }, receiveRequest: { (demand) in
                print("received demand: \(demand.description)")
            })
            .sink { _ in return }
    }
}
