# SwifUI & Combine

## About

__Imperative__: With imperative programming, we’re directly telling the program (or app) what to do and how to do it.

You’re coding: “Put this button here, then download that piece of data, make a decision with if, and finally assign that value to a text label.”

__Declarative__: With declarative programming, we’re merely telling the program (or app) what to do, but not how.

We’re building the logic of a program, without describing its control flow. The actual implementation is up to the program or its frameworks.

## Combine

__Combine = Publishers + Subscribers + Operators__


### Combine Publisher

Publisher sends sequences of values over time to one or more Subscribers. Combine publishers conform to the following protocol:

```
protocol Publisher {
    associatedtype Output
    associatedtype Failure : Error
    func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input
}
```

A publisher can send values or terminate with either success or error. `Output` defines what kind of values a publisher can send. Failure defines the type of error it may fail with.

The `receive(subscriber:)` method connects a subscriber to a publisher. It defines the contract: publisher’s output must match subscriber’s input, and so do the failure types.

### Combine Subscriber

Subscriber receives values from a publisher. Combine subscribers conform to the following protocol:

```
public protocol Subscriber : CustomCombineIdentifierConvertible {
    associatedtype Input
    associatedtype Failure : Error

    func receive(subscription: Subscription)
    func receive(_ input: Self.Input) -> Subscribers.Demand
    func receive(completion: Subscribers.Completion<Self.Failure>)
}
```

A subscriber can receive a value of type `Input` or a termination event with either success or `Failure`.

The three `receive` methods describe different steps of the subscriber’s life cycle. We’ll get back to that topic in a couple of paragraphs.

### Connecting Publisher to Subscriber

Combine has two built-in subscribers: `Subscribers.Sink` and `Subscribers.Assign`. You can connect them by calling either of these methods on a publisher :

* `sink(receiveCompletion:receiveValue:)` to handle new element or completion event in a closure.
* `assign(to:on:)` to write new element to a property.

```
// 1
let publisher = Just(1)
// 2
publisher.sink(receiveCompletion: { _ in
    print("finished")
}, receiveValue: { value in
    print(value)
})
```

---
### PassthroughSubject

A subject that broadcasts elements to downstream subscribers.

[https://developer.apple.com/documentation/combine/passthroughsubject](https://developer.apple.com/documentation/combine/passthroughsubject)

### `@State`

A persistent value of a given type, through which a view reads and monitors the value.


It is local to the view. It has to be a value-type (e.g., a struct, Int, String, Array, etc) and its storage is managed by the framework.

https://developer.apple.com/documentation/swiftui/state

```
@State private var isShowing: Bool = true // toggle state

var toggleView: some View {
    return Toggle(isOn: $isShowing) {
        if isShowing {
            Text("Toggle On")
        } else {
            Text("Toggle Off")
        }
    }
}
```

### `@EnvironmentObject`

A dynamic view property that uses a bindable object supplied by an ancestor view to invalidate the current view whenever the bindable object changes.

An __EnvironmentObject__ is a data model which, once initialised, can share data to all view’s of your app. The cool thing is, that an__ EnvironmentObject__ is created by supplying a __ObservableObject__, thus we can use our __ViewRouter__ for creating an __EnvironmentObject__!

So, once we declared our ViewRouter as an EnvironmentObject, all views can be bound to it in the same way as a regular ObservableObject but without the need of a initialisation chain downwards the app’s hierarchy! 

As said, an EnvironmentObject needs to already be initialised when referring to it the first time. Since our MotherView as the root view will look into the ViewRouter's currentPage property we need to initialise the EnvironmentObject at the app’s launch. We can then automatically change the EnvironmentObject’s currentPage variable from the ContentView’s which then triggers the MotherView to rerender. 

[How to navigate between views in SwiftUI by using an @EnvironmentObject](https://www.blckbirds.com/post/how-to-navigate-between-views-in-swiftui-by-using-an-environmentobject)

[https://developer.apple.com/documentation/swiftui/environmentobject](https://developer.apple.com/documentation/swiftui/environmentobject)

### `@Published`

### `@ObservedObject`

 `ObjectBinding` was renamed to `ObservedObject` 

It is external to the view, it is a reference value (e.g., a class) and its storage is managed by you, giving you more flexibility to implement your own logic.

[https://developer.apple.com/documentation/swiftui/bindableobject](https://developer.apple.com/documentation/swiftui/bindableobject)

### Considerations

Note that `@State` variables are also great while prototyping your app. For example, if you are working on the layout of your view, you can initially use a `@State` variable to make things easier. Once your view does what you want, you can concentrate on creating your `@BindableObject` and replace your `@State`.

```
  @Published var wasInitialized = false
  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var state = InitAnotherViewState()
  @State var text = ""
```

## SwiftUI References

* [Fucking SwiftUI](https://fuckingswiftui.com)
* [SwiftUI tips and tricks](https://www.hackingwithswift.com/quick-start/swiftui/swiftui-tips-and-tricks)
* [How to Build a Form UI with SwiftUI](https://www.appcoda.com/swiftui-form-ui/)
* [SwiftUI Framework Learning and Usage Guide](https://jinxiansen.github.io/SwiftUI/)
* [How to use UIKit in SwiftUI](https://sarunw.com/posts/uikit-in-swiftui)

## Combine References
* [Data Flow Through SwiftUI
](https://developer.apple.com/videos/play/wwdc2019/226/)
* [Swift Combine Framework Tutorial: Getting Started
](https://www.vadimbulavin.com/swift-combine-framework-tutorial-getting-started/)

