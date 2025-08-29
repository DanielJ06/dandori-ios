import SwiftUI

// MARK: - DandoriToast Environment Support

struct DandoriToastAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriToastVariant? = nil
}

extension EnvironmentValues {
    var dandoriToastAppearance: DandoriToastVariant? {
        get { self[DandoriToastAppearanceKey.self] }
        set { self[DandoriToastAppearanceKey.self] = newValue }
    }
}

extension View {
    func dandoriToastAppearance(_ variant: DandoriToastVariant) -> some View {
        environment(\.dandoriToastAppearance, variant)
    }
}
