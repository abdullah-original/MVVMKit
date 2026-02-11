import Foundation

public enum ViewState<D: Sendable, E: Error>: Sendable {
    case initial
    case loading
    case dataLoaded(D)
    case error(E)
}

extension ViewState: Equatable where D: Equatable, E: Equatable { }
