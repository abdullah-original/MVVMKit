import Foundation

@MainActor
public protocol ViewModel<D, E, Action>: ObservableObject {
    associatedtype D: Sendable
    associatedtype E: Error
    associatedtype Action: Sendable
    
    var state: ViewState<D, E> { get }

    func execute(_ action: Action) async
}
