import SwiftUI

@available(iOS 14, macOS 11, tvOS 14, watchOS 7.0, macCatalyst 14, *)
public struct StatefulView<Data: Sendable, E: Error, V: View, EV: View>: View {
    private let state: ViewState<Data, E>
    private let content: (Data) -> V
    private let errorView: ((E) -> EV)?
    
    public init(
        state: ViewState<Data, E>,
        content: @escaping (Data) -> V,
        errorView: ((E) -> EV)?
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
            if let errorView = errorView {
                errorView(error)
            } else if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, macCatalyst 17.0, *) {
                ContentUnavailableView {
                    errorLabel()
                } description: {
                    Text("Please try again in a few minutes.")
                }
            } else {
                errorLabel()
            }
        }
    }
    
    private func errorLabel() -> Label<Text, Image> {
        Label(
            "Oops, we are having some troubles loading your data!",
            systemImage: "exclamationmark.triangle"
        )
    }
}
