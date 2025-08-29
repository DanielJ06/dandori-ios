import SwiftUI

// MARK: - DandoriBadge Environment Support

struct DandoriBadgeAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriBadgeVariant? = nil
}

extension EnvironmentValues {
    var dandoriBadgeAppearance: DandoriBadgeVariant? {
        get { self[DandoriBadgeAppearanceKey.self] }
        set { self[DandoriBadgeAppearanceKey.self] = newValue }
    }
}

extension View {
    func dandoriBadgeAppearance(_ variant: DandoriBadgeVariant) -> some View {
        environment(\.dandoriBadgeAppearance, variant)
    }
}
