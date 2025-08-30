import SwiftUI

// MARK: - DandoriCheckbox Environment Support

struct DandoriCheckboxVariantKey: EnvironmentKey {
    typealias Value = DandoriCheckboxVariant
    static let defaultValue: DandoriCheckboxVariant = .default
}

struct DandoriCheckboxSizeKey: EnvironmentKey {
    typealias Value = DandoriCheckboxSize
    static let defaultValue: DandoriCheckboxSize = .medium
}

extension EnvironmentValues {
    var dandoriCheckboxVariant: DandoriCheckboxVariant {
        get { self[DandoriCheckboxVariantKey.self] }
        set { self[DandoriCheckboxVariantKey.self] = newValue }
    }
    
    var dandoriCheckboxSize: DandoriCheckboxSize {
        get { self[DandoriCheckboxSizeKey.self] }
        set { self[DandoriCheckboxSizeKey.self] = newValue }
    }
}

extension View {
    func dandoriCheckboxVariant(_ variant: DandoriCheckboxVariant) -> some View {
        environment(\.dandoriCheckboxVariant, variant)
    }
    
    func dandoriCheckboxSize(_ size: DandoriCheckboxSize) -> some View {
        environment(\.dandoriCheckboxSize, size)
    }
}
