import Foundation

public enum ViewState<D: Sendable, E: Sendable>: Sendable {
    case initial
    case loading
    case dataLoaded(D)
    case error(E)
}

extension ViewState: Equatable where D: Equatable, E: Equatable { }

public enum ErrorLessViewState<D: Sendable>: Sendable {
    case initial
    case loading
    case dataLoaded(D)
}

extension ErrorLessViewState: Equatable where D: Equatable { }
