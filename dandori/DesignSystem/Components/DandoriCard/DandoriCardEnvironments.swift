import SwiftUI

// MARK: - DandoriCard Environment Support

struct DandoriCardVariantKey: EnvironmentKey {
    typealias Value = DandoriCardVariant
    static let defaultValue: DandoriCardVariant = .default
}

struct DandoriCardSizeKey: EnvironmentKey {
    typealias Value = DandoriCardSize
    static let defaultValue: DandoriCardSize = .standard
}

extension EnvironmentValues {
    var dandoriCardVariant: DandoriCardVariant {
        get { self[DandoriCardVariantKey.self] }
        set { self[DandoriCardVariantKey.self] = newValue }
    }
    
    var dandoriCardSize: DandoriCardSize {
        get { self[DandoriCardSizeKey.self] }
        set { self[DandoriCardSizeKey.self] = newValue }
    }
}

extension View {
    func dandoriCardVariant(_ variant: DandoriCardVariant) -> some View {
        environment(\.dandoriCardVariant, variant)
    }
    
    func dandoriCardSize(_ size: DandoriCardSize) -> some View {
        environment(\.dandoriCardSize, size)
    }
}
