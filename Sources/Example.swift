#if DEBUG
import SwiftUI

// MARK: - Example

typealias ExampleViewState = ViewState<String, ErrorUI>
protocol ExampleVM: AsyncViewModel<ExampleViewState, Void> { }

final class ExampleViewModel: ExampleVM {

    @Published var state: ExampleViewState
    
    init(state: ExampleViewState = .initial) {
        self.state = state
    }

    func execute(_ action: Void) async { }
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
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, macCatalyst 17.0, *)
#Preview {
    
    @Previewable @ObservedObject var viewModelInitial = ExampleViewModel()
    
    @Previewable @ObservedObject var viewModelLoading = ExampleViewModel(state: .loading)
    
    @Previewable @ObservedObject var viewModelLoaded = ExampleViewModel(state:  .dataLoaded("Hello World!"))
    
    @Previewable @ObservedObject var viewModelError = ExampleViewModel(
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
