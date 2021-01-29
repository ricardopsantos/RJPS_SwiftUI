//
//  Created by Ricardo Santos on 31/10/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
//
import RJSLibUFBase
/**

 https://nshipster.com/propertywrapper/
 https://medium.com/swlh/easy-dependency-injection-with-property-wrappers-in-swift-886a93c28ed4
*/

/**
__If you’re not familiar with Property Wrappers in Swift, it’s not a big deal:__
* We created a struct;
* Added @propertyWrapper before its declaration;
* Every Property Wrapper has to have wrappedValue. In our case, it has a generic type T;
* init gets one parameter: `key` to the variable in UserDefault;

 ```
 class TheViewModel: ObservableObject {
     let objectWillChange = PassthroughSubject<Void, Never>()
     @UserDefaultsPropertyWrapper("ShowOnStart", defaultValue: true)
     var showOnStart: Bool { willSet { objectWillChange.send() } }
 }

 struct VisualDocs_UserDefaultsWithPropertyWrapper: View {
     @ObservedObject var vm = TheViewModel()
     var body: some View {
         VStack {
             Toggle(isOn: $vm.showOnStart) {
                 Text("Show welcome text")
             }
             if vm.showOnStart {
                 Text("Welcome")
             }
         }.padding()
     }
 }
 ```

*/

@propertyWrapper
public struct UserDefaultsPropertyWrapper<T> {
    public let key: String
    public let defaultValue: T
    public init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    public var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}

// https://medium.com/flawless-app-stories/turning-property-wrappers-into-function-wrappers-2be3a49229f5
// Turning Property Wrappers into Function Wrappers

/**

 __Sample Usage__

 ```
 struct CachedFunctionsPropertyWrapperTest {
     @CachedFunctionsPropertyWrapper static var cachedCos = { (x: Double) in cos(x) }
 }

 private func teste() {
     CachedFunctionsPropertyWrapperTest.cachedCos(.pi * 2) // takes 48.85 µs
     // value of cos for 2π is now cached
     CachedFunctionsPropertyWrapperTest.cachedCos(.pi * 2) // takes 0
 }
 ```

*/
@propertyWrapper
struct CachedFunctionsPropertyWrapper<Input: Hashable, Output> {

    private var cachedFunction: (Input) -> Output

    init(wrappedValue: @escaping (Input) -> Output) {
        self.cachedFunction = Self.addCachingLogic(to: wrappedValue)
    }

    var wrappedValue: (Input) -> Output {
        get { return self.cachedFunction }
        set { self.cachedFunction = Self.addCachingLogic(to: newValue) }
    }

    private static func addCachingLogic(to function: @escaping (Input) -> Output) -> (Input) -> Output {
        var cache: [Input: Output] = [:]

        return { input in
            if let cachedOutput = cache[input] {
                return cachedOutput
            } else {
                let output = function(input)
                cache[input] = output
                return output
            }
        }
    }
}
