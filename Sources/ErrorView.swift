#if DEBUG
import SwiftUI

public struct ErrorUI: Equatable, Sendable {
    let title: String
    let subtitle: String?
    let image: String
    
    public init(
        title: String,
        subtitle: String? = nil,
        image: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}

public extension ErrorUI {
    static let `default` = ErrorUI(
        title: "Oops! Please try again in a few minutes.",
        subtitle: "We are having some troubles loading your data!",
        image: "exclamationmark.triangle"
    )
}

public struct ErrorView: View {
    
    private let error: ErrorUI
    
    public init(error: ErrorUI = .default) {
        self.error = error
    }
    
    public var body: some View {
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, macCatalyst 17.0, *) {
            ContentUnavailableView {
                errorLabel()
            } description: {
                Text(error.subtitle ?? "")
            }
        } else {
            errorLabel()
        }
    }
    
    
    private func errorLabel() -> Label<Text, Image> {
        Label(
            error.title,
            systemImage: error.image
        )
    }
}

// MARK: - Preview
@available(
    iOS 17.0,
    macOS 14.0,
    tvOS 17.0,
    watchOS 10.0,
    macCatalyst 17.0,
    *
)
#Preview {
    ErrorView()
}
#endif
