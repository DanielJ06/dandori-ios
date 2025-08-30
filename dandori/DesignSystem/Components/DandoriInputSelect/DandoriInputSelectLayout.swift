import SwiftUI

// MARK: - DandoriInputSelect Layout

struct DandoriInputSelectLayout {
    let variant: DandoriInputSelectVariant
    let size: DandoriInputSelectSize
    let isDisabled: Bool
    let isExpanded: Bool
    
    var backgroundColor: Color {
        if isDisabled {
            return DSTokens.Colors.Surface.tertiary
        }
        
        switch variant {
        case .default:
            return DSTokens.Colors.Surface.primary
        case .accent:
            return DSTokens.Colors.Accent.teal.light
        }
    }
    
    var borderColor: Color {
        if isDisabled {
            return DSTokens.Colors.Border.default
        }
        
        if isExpanded {
            return DSTokens.Colors.Border.focus
        }
        
        switch variant {
        case .default:
            return DSTokens.Colors.Border.default
        case .accent:
            return DSTokens.Colors.Accent.teal.base
        }
    }
    
    var borderWidth: CGFloat { 1.5 }
    
    var textFont: Font {
        switch size {
        case .small:
            return DSTokens.Typography.label.font
        case .medium:
            return DSTokens.Typography.bodyMedium.font
        case .large:
            return DSTokens.Typography.bodyLarge.font
        }
    }
    
    var selectedTextColor: Color {
        if isDisabled {
            return DSTokens.Colors.Content.secondary
        }
        return DSTokens.Colors.Content.primary
    }
    
    var placeholderColor: Color {
        if isDisabled {
            return DSTokens.Colors.Content.secondary
        }
        return DSTokens.Colors.Content.secondary
    }
    
    var iconFont: Font {
        switch size {
        case .small:
            return .system(size: 12, weight: .medium)
        case .medium:
            return .system(size: 14, weight: .medium)
        case .large:
            return .system(size: 16, weight: .medium)
        }
    }
    
    var iconColor: Color {
        if isDisabled {
            return DSTokens.Colors.Content.secondary
        }
        return DSTokens.Colors.Content.secondary
    }
    
    var horizontalPadding: CGFloat {
        switch size {
        case .small:
            return DSTokens.Spacing.elementMD
        case .medium:
            return DSTokens.Spacing.componentMD
        case .large:
            return DSTokens.Spacing.componentLG
        }
    }
    
    var verticalPadding: CGFloat {
        switch size {
        case .small:
            return DSTokens.Spacing.elementSM
        case .medium:
            return DSTokens.Spacing.elementMD
        case .large:
            return DSTokens.Spacing.elementLG
        }
    }
    
    var cornerRadius: CGFloat {
        switch size {
        case .small:
            return DSTokens.Radius.small
        case .medium:
            return DSTokens.Radius.medium
        case .large:
            return DSTokens.Radius.medium
        }
    }
    
    // Dropdown styling
    var dropdownBackgroundColor: Color {
        DSTokens.Colors.Surface.primary
    }
    
    var dropdownBorderColor: Color {
        DSTokens.Colors.Border.default
    }
    
    var dropdownBorderWidth: CGFloat { 1 }
    
    var dropdownCornerRadius: CGFloat {
        DSTokens.Radius.medium
    }
    
    var dropdownShadowColor: Color {
        Color.black.opacity(0.1)
    }
    
    var dropdownShadowRadius: CGFloat { 8 }
    
    var dropdownShadowY: CGFloat { 4 }
    
    // Option styling
    var optionFont: Font {
        switch size {
        case .small:
            return DSTokens.Typography.label.font
        case .medium:
            return DSTokens.Typography.bodyMedium.font
        case .large:
            return DSTokens.Typography.bodyLarge.font
        }
    }
    
    var optionTextColor: Color {
        DSTokens.Colors.Content.primary
    }
    
    var selectedOptionColor: Color {
        switch variant {
        case .default:
            return DSTokens.Colors.Content.primary
        case .accent:
            return DSTokens.Colors.Accent.teal.text
        }
    }
    
    var selectedOptionBackgroundColor: Color {
        switch variant {
        case .default:
            return DSTokens.Colors.Surface.secondary
        case .accent:
            return DSTokens.Colors.Accent.teal.light
        }
    }
    
    var checkmarkFont: Font {
        switch size {
        case .small:
            return .system(size: 12, weight: .semibold)
        case .medium:
            return .system(size: 14, weight: .semibold)
        case .large:
            return .system(size: 16, weight: .semibold)
        }
    }
    
    var optionHorizontalPadding: CGFloat {
        switch size {
        case .small:
            return DSTokens.Spacing.elementMD
        case .medium:
            return DSTokens.Spacing.componentMD
        case .large:
            return DSTokens.Spacing.componentLG
        }
    }
    
    var optionVerticalPadding: CGFloat {
        switch size {
        case .small:
            return DSTokens.Spacing.elementSM
        case .medium:
            return DSTokens.Spacing.elementMD
        case .large:
            return DSTokens.Spacing.elementLG
        }
    }
    
    var dividerColor: Color {
        DSTokens.Colors.Border.default
    }
    
    var dividerPadding: CGFloat {
        DSTokens.Spacing.elementSM
    }
}
