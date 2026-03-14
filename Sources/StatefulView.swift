import SwiftUI

public struct StatefulView<Data: Sendable, E: Sendable, V: View, EV: View>: View {
    private let state: ViewState<Data, E>
    private let content: (Data) -> V
    private let errorView: (E) -> EV
    
    public init(
        state: ViewState<Data, E>,
        content: @escaping (Data) -> V,
        errorView: @escaping (E)  -> EV
    ) {
        self.state = state
        self.content = content
        self.errorView = errorView
    }
    
    public var body: some View {
        switch state {
        case .initial:
            EmptyView()
        case .loading:
            ProgressView()
        case .dataLoaded(let data):
            content(data)
        case .error(let error):
            errorView(error)
        }
    }
}

public struct ErrorLessStatefulView<Data: Sendable, V: View>: View {
    private let state: ErrorLessViewState<Data>
    private let content: (Data) -> V
    
    public init(
        state: ErrorLessViewState<Data>,
        content: @escaping (Data) -> V,
    ) {
        self.state = state
        self.content = content
    }
    
    public var body: some View {
        switch state {
        case .initial:
            EmptyView()
        case .loading:
            ProgressView()
        case .dataLoaded(let data):
            content(data)
        }
    }
}
