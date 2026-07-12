## MVVMKit

This package contains simple, yet sensible templates you can adopt for your ViewModels to get you started with an MVVM based iOS project. Following a consistent pattern will keep your project healthy and clean. 
   
A ViewModel protocol (with async and sync variants) is defined which should be adopted by your view model implementations to introduce consistency in your project, and a generic definition of ViewState is available to prevent duplication in your code. 

See [`Example.swift`](https://github.com/abdullah-original/MVVMKit/blob/master/Sources/Example.swift) for usage examples.

There are two branches, `master` contains [ObservableObject](https://developer.apple.com/documentation/combine/observableobject) based protocols if your deployment target is below iOS 17, otherwise you can use preferred [Observable](https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro) based protocols from [`observable`](https://github.com/abdullah-original/MVVMKit/tree/observable) branch.
