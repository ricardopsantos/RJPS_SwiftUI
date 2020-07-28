//
//  GoodToGo
//
//  Created by Ricardo P Santos on 2019.
//  Copyright © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = UIHostingController(rootView: V.TabView_View())

        findImages()
        //NetworkAgentTest.chain()
        //NetworkAgentTest.parallel()
        return true
    }
}

// MARK: - Preview

struct AppDelegate_Previews: PreviewProvider {
    static var previews: some View {
        V.TabView_View()
    }
}

func findImages() {

    let letters1: NSString = "abcdefghijklmnopqrstuvwxyz."
    //var letters2 = Array("abcdefghijklmnopqrstuvwxyz.")
    var letters2 = Array("abcdef")

    var array: [String] = []
    func permutations(_ n: Int, _ a: inout Array<Character>) {
        if n == 1 {
            var word = ""
            a.forEach { (some) in
                word = "\(word)\(some)"
            }
            array.append(word)
            return
        }
        for i in 0..<n-1 {
            permutations(n-1, &a)
            a.swapAt(n-1, (n%2 == 1) ? 0 : i)
        }
        permutations(n-1, &a)
    }

    permutations(4, &letters2)
    print(array)

    return;

    func randomString(_ length: Int) -> String {
        let len = UInt32(letters1.length)
        var randomString = ""
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters1.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        return randomString
    }

    var testedWords: [String] = []
    var matchs: [String] = []
    var acc = 0
    var repeatedFails = 0

    for i in 1...6 {
        print("i: \(i)")
        while repeatedFails < (i * 10) {
            acc += 1
            let word = randomString(i)
            if acc % 10000 == 0 {
                print(acc)
            }
            if !testedWords.contains(word) {
                repeatedFails = 0
                testedWords.append(word)
                if let image = UIImage(systemName: word) {
                    print("case: \(word)")
                    matchs.append("\(word)")
                }
            } else {
                repeatedFails += 1
            }
        }
    }

    print(matchs)
    print("end")

}
