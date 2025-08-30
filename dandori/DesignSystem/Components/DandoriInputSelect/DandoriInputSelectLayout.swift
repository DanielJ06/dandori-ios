import SwiftUI

// MARK: - DandoriInputSelect Layout

struct DandoriInputSelectLayout {
    let variant: DandoriInputSelectVariant
    let size: DandoriInputSelectSize
    let isDisabled: Bool
    let isExpanded: Bool
    
    var backgroundColor: Color {
        if isDisabled {
            return DS.Colors.Surface.tertiary
        }
        
        switch variant {
        case .default:
            return DS.Colors.Surface.primary
        case .accent:
            return DS.Colors.Accent.light
        }
    }
    
    var borderColor: Color {
        if isDisabled {
            return DS.Colors.Border.default
        }
        
        if isExpanded {
            return DS.Colors.Border.focus
        }
        
        switch variant {
        case .default:
            return DS.Colors.Border.default
        case .accent:
            return DS.Colors.Accent.base
        }
    }
    
    var borderWidth: CGFloat { DSTokens.Dimensions.borderWidthMedium }
    
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
            return DS.Colors.Content.secondary
        }
        return DS.Colors.Content.primary
    }
    
    var placeholderColor: Color {
        if isDisabled {
            return DS.Colors.Content.secondary
        }
        return DS.Colors.Content.secondary
    }
    
    var iconFont: Font {
        switch size {
        case .small:
            return .system(size: 12, weight: .medium)  // Muito pequeno para usar token padrão
        case .medium:
            return .system(size: DSTokens.Dimensions.iconSizeMedium, weight: .medium)
        case .large:
            return .system(size: DSTokens.Dimensions.iconSizeLarge, weight: .medium)
        }
    }
    
    var iconColor: Color {
        if isDisabled {
            return DS.Colors.Content.secondary
        }
        return DS.Colors.Content.secondary
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
        DS.Colors.Surface.primary
    }
    
    var dropdownBorderColor: Color {
        DS.Colors.Border.default
    }
    
    var dropdownBorderWidth: CGFloat { DSTokens.Dimensions.borderWidthThin }
    
    var dropdownCornerRadius: CGFloat {
        DSTokens.Radius.medium
    }
    
    var dropdownShadowColor: Color {
        Color.black.opacity(0.1)
    }
    
    var dropdownShadowRadius: CGFloat { DSTokens.Dimensions.shadowRadiusMedium }
    
    var dropdownShadowY: CGFloat { DSTokens.Dimensions.shadowYMedium }
    
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
        DS.Colors.Content.primary
    }
    
    var selectedOptionColor: Color {
        switch variant {
        case .default:
            return DS.Colors.Content.primary
        case .accent:
            return DS.Colors.Accent.text
        }
    }
    
    var selectedOptionBackgroundColor: Color {
        switch variant {
        case .default:
            return DS.Colors.Surface.secondary
        case .accent:
            return DS.Colors.Accent.light
        }
    }
    
    var checkmarkFont: Font {
        switch size {
        case .small:
            return .system(size: 12, weight: .semibold)  // Muito pequeno para usar token padrão
        case .medium:
            return .system(size: DSTokens.Dimensions.iconSizeMedium, weight: .semibold)
        case .large:
            return .system(size: DSTokens.Dimensions.iconSizeLarge, weight: .semibold)
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
        DS.Colors.Border.default
    }
    
    var dividerPadding: CGFloat {
        DSTokens.Spacing.elementSM
    }
}
