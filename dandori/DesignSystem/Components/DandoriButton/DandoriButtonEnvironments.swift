import SwiftUI

// MARK: - DandoriButton Environment Support

struct DandoriButtonAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriButtonVariant? = nil
}

extension EnvironmentValues {
    var dandoriButtonAppearance: DandoriButtonVariant? {
        get { self[DandoriButtonAppearanceKey.self] }
        set { self[DandoriButtonAppearanceKey.self] = newValue }
    }
}

extension View {
    func dandoriButtonAppearance(_ variant: DandoriButtonVariant) -> some View {
        environment(\.dandoriButtonAppearance, variant)
    }
}
