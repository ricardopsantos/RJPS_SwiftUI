

Based on https://www.raywenderlich.com/4161005-mvvm-with-combine-tutorial-for-ios

#  MVVM

* The View has a reference to the ViewModel, but not vice-versa.
* The ViewModel has a reference to the Model, but not vice-versa.
* The View has no reference to the Model or vice-versa.
* If you break these rules, you’re doing MVVM wrong!

## MVVM and Data Binding

Data Binding is what allows you to connect a View to its ViewModel. Before this year’s WWDC, you would have to use something akin to RxSwift (via RxCocoa) or ReactiveSwift (via ReactiveCocoa). In this tutorial, you’ll explore how you can achieve this connection using SwiftUI and Combine.

## MVVM With Combine

Combine is not actually necessary for bindings to happen, but this doesn’t mean you can’t harness its power. You can use SwiftUI on its own to create bindings. But using Combine allows more power. As you’ll see throughout the tutorial, once you are on the ViewModel side, using Combine becomes the natural choice. It allows you to cleanly define a chain that starts in your UI, way down to a network call. You can achieve all this power easily by combining (pun intended) SwiftUI and Combine. It’s possible to use another communication pattern (e.g. delegation), but by doing so you are trading the declarative approach set by SwiftUI, and its bindings, for an imperative one.
