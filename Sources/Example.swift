import SwiftUI

// MARK: - Example
protocol ExampleViewModelProtocol: ViewModel<String, Error, ExampleAction> { }

final class ExampleViewModel: ExampleViewModelProtocol {
    @Published var state: ViewState<String, Error>
    
    init(state: ViewState<String, Error> = .initial) {
        self.state = state
    }
    
    func execute(_ action: ExampleAction) async {
        switch action {
        case .viewDidAppear:
            state = .dataLoaded("Hello World!")
        }
    }
}

enum ExampleAction: Sendable {
    case viewDidAppear
}

@available(iOS 14, macOS 11, tvOS 14, watchOS 7.0, macCatalyst 14, *)
struct ExampleView<VM: ExampleViewModelProtocol>: View {
    @ObservedObject private var viewModel: VM
    
    init(viewModel: VM = ExampleViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        StatefulView(state: viewModel.state) { data in
            Text(data)
        } errorView: { error in
            Text(error.localizedDescription)
        }
    }
}

@available(iOS 15, macOS 12, tvOS 15, watchOS 8, macCatalyst 15, *)
#Preview("Initial"){
    ExampleView()
}

@available(iOS 15, macOS 12, tvOS 15, watchOS 8, macCatalyst 15, *)
#Preview("Loading") {
    ExampleView(viewModel: ExampleViewModel(state: .loading))
}

@available(iOS 15, macOS 12, tvOS 15, watchOS 8, macCatalyst 15, *)
#Preview("Data Loaded") {
    ExampleView(viewModel: ExampleViewModel(state: .dataLoaded("Hello World!")))
}

@available(iOS 15, macOS 12, tvOS 15, watchOS 8, macCatalyst 15, *)
#Preview("Error") {
    ExampleView(
        viewModel: ExampleViewModel(
            state: .error(
                NSError(
                    domain: "something went wrong",
                    code: -9
                )
            )
        )
    )
}
