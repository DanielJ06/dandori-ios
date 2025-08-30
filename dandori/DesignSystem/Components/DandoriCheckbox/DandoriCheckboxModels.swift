import SwiftUI

// MARK: - DandoriCheckbox Variants

enum DandoriCheckboxVariant: CaseIterable {
    case `default`
    case accent
}

// MARK: - DandoriCheckbox Sizes

enum DandoriCheckboxSize: CaseIterable {
    case small
    case medium
    case large
}

// MARK: - DandoriCheckbox Appearance Environment

struct DandoriCheckboxAppearance {
    let variant: DandoriCheckboxVariant
    let isDisabled: Bool
    
    init(variant: DandoriCheckboxVariant = .default, isDisabled: Bool = false) {
        self.variant = variant
        self.isDisabled = isDisabled
    }
}

// MARK: - Environment Key

struct DandoriCheckboxAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriCheckboxAppearance? = nil
}

extension EnvironmentValues {
    var dandoriCheckboxAppearance: DandoriCheckboxAppearance? {
        get { self[DandoriCheckboxAppearanceKey.self] }
        set { self[DandoriCheckboxAppearanceKey.self] = newValue }
    }
}

// MARK: - View Modifier

extension View {
    func dandoriCheckboxAppearance(_ appearance: DandoriCheckboxAppearance) -> some View {
        environment(\.dandoriCheckboxAppearance, appearance)
    }
    
    func dandoriCheckboxAppearance(variant: DandoriCheckboxVariant = .default, isDisabled: Bool = false) -> some View {
        dandoriCheckboxAppearance(DandoriCheckboxAppearance(variant: variant, isDisabled: isDisabled))
    }
}
