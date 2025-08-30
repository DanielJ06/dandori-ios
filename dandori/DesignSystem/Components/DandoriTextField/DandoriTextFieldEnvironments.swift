import SwiftUI

// MARK: - DandoriTextField Environment Support

struct DandoriTextFieldVariantKey: EnvironmentKey {
    typealias Value = DandoriTextFieldVariant
    static let defaultValue: DandoriTextFieldVariant = .default
}

struct DandoriTextFieldSizeKey: EnvironmentKey {
    typealias Value = DandoriTextFieldSize
    static let defaultValue: DandoriTextFieldSize = .medium
}

struct DandoriTextFieldStateKey: EnvironmentKey {
    typealias Value = DandoriTextFieldState
    static let defaultValue: DandoriTextFieldState = .normal
}

extension EnvironmentValues {
    var dandoriTextFieldVariant: DandoriTextFieldVariant {
        get { self[DandoriTextFieldVariantKey.self] }
        set { self[DandoriTextFieldVariantKey.self] = newValue }
    }
    
    var dandoriTextFieldSize: DandoriTextFieldSize {
        get { self[DandoriTextFieldSizeKey.self] }
        set { self[DandoriTextFieldSizeKey.self] = newValue }
    }
    
    var dandoriTextFieldState: DandoriTextFieldState {
        get { self[DandoriTextFieldStateKey.self] }
        set { self[DandoriTextFieldStateKey.self] = newValue }
    }
}

extension View {
    func dandoriTextFieldVariant(_ variant: DandoriTextFieldVariant) -> some View {
        environment(\.dandoriTextFieldVariant, variant)
    }
    
    func dandoriTextFieldSize(_ size: DandoriTextFieldSize) -> some View {
        environment(\.dandoriTextFieldSize, size)
    }
    
    func dandoriTextFieldState(_ state: DandoriTextFieldState) -> some View {
        environment(\.dandoriTextFieldState, state)
    }
}
