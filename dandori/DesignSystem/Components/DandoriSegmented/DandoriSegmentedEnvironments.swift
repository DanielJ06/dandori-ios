import SwiftUI

// MARK: - DandoriSegmented Environment Support

struct DandoriSegmentedAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriSegmentedVariant? = nil
}

extension EnvironmentValues {
    var dandoriSegmentedAppearance: DandoriSegmentedVariant? {
        get { self[DandoriSegmentedAppearanceKey.self] }
        set { self[DandoriSegmentedAppearanceKey.self] = newValue }
    }
}

extension View {
    func dandoriSegmentedAppearance(_ variant: DandoriSegmentedVariant) -> some View {
        environment(\.dandoriSegmentedAppearance, variant)
    }
}
