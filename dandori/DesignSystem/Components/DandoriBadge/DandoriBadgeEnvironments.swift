import SwiftUI

// MARK: - DandoriBadge Environment Support

struct DandoriBadgeVariantKey: EnvironmentKey {
    typealias Value = DandoriBadgeVariant
    static let defaultValue: DandoriBadgeVariant = .default
}

struct DandoriBadgeSizeKey: EnvironmentKey {
    typealias Value = DandoriBadgeSize
    static let defaultValue: DandoriBadgeSize = .medium
}

extension EnvironmentValues {
    var dandoriBadgeVariant: DandoriBadgeVariant {
        get { self[DandoriBadgeVariantKey.self] }
        set { self[DandoriBadgeVariantKey.self] = newValue }
    }
    
    var dandoriBadgeSize: DandoriBadgeSize {
        get { self[DandoriBadgeSizeKey.self] }
        set { self[DandoriBadgeSizeKey.self] = newValue }
    }
}

extension View {
    func dandoriBadgeVariant(_ variant: DandoriBadgeVariant) -> some View {
        environment(\.dandoriBadgeVariant, variant)
    }
    
    func dandoriBadgeSize(_ size: DandoriBadgeSize) -> some View {
        environment(\.dandoriBadgeSize, size)
    }
}
