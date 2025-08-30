import SwiftUI

// MARK: - DandoriInputSelect Variants

enum DandoriInputSelectVariant: CaseIterable {
    case `default`
    case accent
}

// MARK: - DandoriInputSelect Sizes

enum DandoriInputSelectSize: CaseIterable {
    case small
    case medium
    case large
}

// MARK: - DandoriSelectOption

struct DandoriSelectOption<T: Hashable> {
    let label: String
    let value: T
    let description: String?
    
    init(label: String, value: T, description: String? = nil) {
        self.label = label
        self.value = value
        self.description = description
    }
}

// MARK: - DandoriInputSelect Appearance Environment

struct DandoriInputSelectAppearance {
    let variant: DandoriInputSelectVariant
    let isDisabled: Bool
    
    init(variant: DandoriInputSelectVariant = .default, isDisabled: Bool = false) {
        self.variant = variant
        self.isDisabled = isDisabled
    }
}

// MARK: - Environment Key

struct DandoriInputSelectAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriInputSelectAppearance? = nil
}

extension EnvironmentValues {
    var dandoriInputSelectAppearance: DandoriInputSelectAppearance? {
        get { self[DandoriInputSelectAppearanceKey.self] }
        set { self[DandoriInputSelectAppearanceKey.self] = newValue }
    }
}

// MARK: - View Modifier

extension View {
    func dandoriInputSelectAppearance(_ appearance: DandoriInputSelectAppearance) -> some View {
        environment(\.dandoriInputSelectAppearance, appearance)
    }
    
    func dandoriInputSelectAppearance(variant: DandoriInputSelectVariant = .default, isDisabled: Bool = false) -> some View {
        dandoriInputSelectAppearance(DandoriInputSelectAppearance(variant: variant, isDisabled: isDisabled))
    }
}
