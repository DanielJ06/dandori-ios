import SwiftUI

// MARK: - DandoriInputSelect Environment Support

struct DandoriInputSelectVariantKey: EnvironmentKey {
    typealias Value = DandoriInputSelectVariant
    static let defaultValue: DandoriInputSelectVariant = .default
}

struct DandoriInputSelectSizeKey: EnvironmentKey {
    typealias Value = DandoriInputSelectSize
    static let defaultValue: DandoriInputSelectSize = .medium
}

extension EnvironmentValues {
    var dandoriInputSelectVariant: DandoriInputSelectVariant {
        get { self[DandoriInputSelectVariantKey.self] }
        set { self[DandoriInputSelectVariantKey.self] = newValue }
    }
    
    var dandoriInputSelectSize: DandoriInputSelectSize {
        get { self[DandoriInputSelectSizeKey.self] }
        set { self[DandoriInputSelectSizeKey.self] = newValue }
    }
}

extension View {
    func dandoriInputSelectVariant(_ variant: DandoriInputSelectVariant) -> some View {
        environment(\.dandoriInputSelectVariant, variant)
    }
    
    func dandoriInputSelectSize(_ size: DandoriInputSelectSize) -> some View {
        environment(\.dandoriInputSelectSize, size)
    }
}
