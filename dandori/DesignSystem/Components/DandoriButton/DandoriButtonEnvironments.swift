import SwiftUI

// MARK: - DandoriButton Environment Support

struct DandoriButtonVariantKey: EnvironmentKey {
    typealias Value = DandoriButtonVariant
    static let defaultValue: DandoriButtonVariant = .primary
}

struct DandoriButtonSizeKey: EnvironmentKey {
    typealias Value = DandoriButtonSize
    static let defaultValue: DandoriButtonSize = .medium
}

struct DandoriButtonStateKey: EnvironmentKey {
    typealias Value = DandoriButtonState
    static let defaultValue: DandoriButtonState = .enabled
}

extension EnvironmentValues {
    var dandoriButtonVariant: DandoriButtonVariant {
        get { self[DandoriButtonVariantKey.self] }
        set { self[DandoriButtonVariantKey.self] = newValue }
    }
    
    var dandoriButtonSize: DandoriButtonSize {
        get { self[DandoriButtonSizeKey.self] }
        set { self[DandoriButtonSizeKey.self] = newValue }
    }
    
    var dandoriButtonState: DandoriButtonState {
        get { self[DandoriButtonStateKey.self] }
        set { self[DandoriButtonStateKey.self] = newValue }
    }
}

extension View {
    func dandoriButtonVariant(_ variant: DandoriButtonVariant) -> some View {
        environment(\.dandoriButtonVariant, variant)
    }
    
    func dandoriButtonSize(_ size: DandoriButtonSize) -> some View {
        environment(\.dandoriButtonSize, size)
    }
    
    func dandoriButtonState(_ state: DandoriButtonState) -> some View {
        environment(\.dandoriButtonState, state)
    }
}
