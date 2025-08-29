import SwiftUI

// MARK: - DandoriChip Environment Support

struct DandoriChipAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriChipVariant? = nil
}

extension EnvironmentValues {
    var dandoriChipAppearance: DandoriChipVariant? {
        get { self[DandoriChipAppearanceKey.self] }
        set { self[DandoriChipAppearanceKey.self] = newValue }
    }
}

extension View {
    func dandoriChipAppearance(_ variant: DandoriChipVariant) -> some View {
        environment(\.dandoriChipAppearance, variant)
    }
}
