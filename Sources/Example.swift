#if DEBUG
import SwiftUI

// MARK: - Example

typealias ExampleViewState = ViewState<String, ErrorUI>
protocol ExampleVM: ViewModel<ExampleViewState, ExampleAction> { }

final class ExampleViewModel: ExampleVM {

    @Published var state: ExampleViewState
    
    init(state: ExampleViewState = .initial) {
        self.state = state
    }

    func execute(_ action: ExampleAction) async {
        switch action {
        case .viewDidAppear:
            state = .dataLoaded("Hello World!")
        }
    }
}

enum ExampleAction: Sendable, Equatable {
    case viewDidAppear
}

struct ExampleView<VM: ExampleVM>: View {
    
    @ObservedObject private var viewModel: VM
    
    init(viewModel: VM = ExampleViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        StatefulView(
            state: viewModel.state,
            content: Text.init,
            errorView: ErrorView.init
        )
        .onAppear {
            Task {
                await viewModel.execute(.viewDidAppear)
            }
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, macCatalyst 17.0, *)
#Preview {
    ExampleView()
    
    Spacer()
    
    ExampleView(viewModel: ExampleViewModel(state: .loading))
    
    Spacer()
    
    ExampleView(viewModel: ExampleViewModel(state: .dataLoaded("Hello World!")))
    
    Spacer()
    
    ExampleView(
        viewModel: ExampleViewModel(
            state: .error(
                ErrorUI(
                    title: "something went wrong",
                    subtitle: "please try again",
                    image: "exclamationmark.triangle"
                )
            )
        )
    )
    .fixedSize()
}
#endif
