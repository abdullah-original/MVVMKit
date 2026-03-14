import Foundation

@MainActor
public protocol AsyncViewModel<State, Action>: ObservableObject {
    associatedtype State: Sendable
    associatedtype Action: Sendable
    
    var state: State { get }

    func execute(_ action: Action) async
}

@MainActor
public protocol ViewModel<State, Action>: ObservableObject {
    associatedtype State: Sendable
    associatedtype Action: Sendable
    
    var state: State { get }
    
    func execute(_ action: Action)
}

@MainActor
public protocol ActionLessViewModel<State>: ObservableObject {
    associatedtype State: Sendable
    
    var state: State { get }
}
