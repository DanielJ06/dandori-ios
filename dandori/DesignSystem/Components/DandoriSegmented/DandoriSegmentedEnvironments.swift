import SwiftUI

// MARK: - DandoriSegmented Environment Support

struct DandoriSegmentedVariantKey: EnvironmentKey {
    typealias Value = DandoriSegmentedVariant
    static let defaultValue: DandoriSegmentedVariant = .default
}

extension EnvironmentValues {
    var dandoriSegmentedVariant: DandoriSegmentedVariant {
        get { self[DandoriSegmentedVariantKey.self] }
        set { self[DandoriSegmentedVariantKey.self] = newValue }
    }
}

extension View {
    func dandoriSegmentedVariant(_ variant: DandoriSegmentedVariant) -> some View {
        environment(\.dandoriSegmentedVariant, variant)
    }
}
