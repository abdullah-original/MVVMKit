#if DEBUG
import SwiftUI
import Observation

// MARK: - Example

typealias ExampleViewState = ViewState<String, ErrorUI>
protocol ExampleVM: AsyncViewModel<ExampleViewState, Void> { }

@Observable
final class ExampleViewModel: ExampleVM {

    var state: ExampleViewState
    
    init(state: ExampleViewState = .initial) {
        self.state = state
    }

    func execute(_ action: Void) async { }
}

struct ExampleView<VM: ExampleVM>: View {
    
    @State private var viewModel: VM
    
    init(viewModel: VM = ExampleViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        StatefulView(
            state: viewModel.state,
            content: Text.init,
            errorView: ErrorView.init
        )
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, macCatalyst 17.0, *)
#Preview {
    
    @Previewable var viewModelInitial = ExampleViewModel()
    
    @Previewable var viewModelLoading = ExampleViewModel(state: .loading)
    
    @Previewable var viewModelLoaded = ExampleViewModel(state:  .dataLoaded("Hello World!"))
    
    @Previewable var viewModelError = ExampleViewModel(
        state: .error(
            ErrorUI(
                title: "something went wrong",
                subtitle: "please try again",
                image: "exclamationmark.triangle"
            )
        )
    )
    LazyVStack {
        
        ExampleView(viewModel: viewModelInitial)
        
        Spacer()
        
        ExampleView(viewModel: viewModelLoading)
        
        Spacer()
        
        ExampleView(viewModel: viewModelLoaded)
        
        Spacer()
        
        ExampleView(viewModel: viewModelError)
    }
}
#endif
