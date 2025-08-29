import SwiftUI

// MARK: - DandoriTextField Environment Support

struct DandoriTextFieldAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriTextFieldVariant? = nil
}

extension EnvironmentValues {
    var dandoriTextFieldAppearance: DandoriTextFieldVariant? {
        get { self[DandoriTextFieldAppearanceKey.self] }
        set { self[DandoriTextFieldAppearanceKey.self] = newValue }
    }
}

extension View {
    func dandoriTextFieldAppearance(_ variant: DandoriTextFieldVariant) -> some View {
        environment(\.dandoriTextFieldAppearance, variant)
    }
}
