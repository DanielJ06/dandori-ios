import SwiftUI

// MARK: - DandoriToast Environment Support

struct DandoriToastVariantKey: EnvironmentKey {
    typealias Value = DandoriToastVariant
    static let defaultValue: DandoriToastVariant = .info
}

extension EnvironmentValues {
    var dandoriToastVariant: DandoriToastVariant {
        get { self[DandoriToastVariantKey.self] }
        set { self[DandoriToastVariantKey.self] = newValue }
    }
}

extension View {
    func dandoriToastVariant(_ variant: DandoriToastVariant) -> some View {
        environment(\.dandoriToastVariant, variant)
    }
}
