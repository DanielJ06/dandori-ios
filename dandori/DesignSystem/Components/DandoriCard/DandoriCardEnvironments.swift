import SwiftUI

// MARK: - DandoriCard Environment Support

struct DandoriCardAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriCardVariant? = nil
}

extension EnvironmentValues {
    var dandoriCardAppearance: DandoriCardVariant? {
        get { self[DandoriCardAppearanceKey.self] }
        set { self[DandoriCardAppearanceKey.self] = newValue }
    }
}

extension View {
    func dandoriCardAppearance(_ variant: DandoriCardVariant) -> some View {
        environment(\.dandoriCardAppearance, variant)
    }
}
