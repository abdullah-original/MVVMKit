import Foundation

/// Conform to this protocol if you don't want to have a single point of entry for actions like in ``ViewModel`` or ``AsyncViewModel``.
@MainActor
public protocol ExtendableViewModel<State>: ObservableObject {
    associatedtype State: Sendable
    
    // Set only allowed to enable bindings. In general, however, it is not recommended to modify the state from outside the ViewModel.
    var state: State { get set }
}

@MainActor
public protocol AsyncViewModel<State, Action>: ExtendableViewModel {
    associatedtype Action: Sendable

    func execute(_ action: Action) async
}

@MainActor
public protocol ViewModel<State, Action>: ExtendableViewModel {
    associatedtype Action: Sendable
    
    func execute(_ action: Action)
}
