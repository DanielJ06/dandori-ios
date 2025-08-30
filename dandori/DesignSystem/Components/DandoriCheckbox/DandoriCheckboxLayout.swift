import SwiftUI

// MARK: - DandoriCheckbox Layout

struct DandoriCheckboxLayout {
    let variant: DandoriCheckboxVariant
    let size: DandoriCheckboxSize
    let isDisabled: Bool
    
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
        
        switch variant {
        case .default:
            return DS.Colors.Border.default
        case .accent:
            return DS.Colors.Accent.base
        }
    }
    
    var borderWidth: CGFloat { DSTokens.Dimensions.borderWidthMedium }
    
    var checkmarkColor: Color {
        if isDisabled {
            return DS.Colors.Content.secondary
        }
        
        switch variant {
        case .default:
            return DS.Colors.Content.primary
        case .accent:
            return DS.Colors.Accent.text
        }
    }
    
    var checkmarkFont: Font {
        switch size {
        case .small:
            return .system(size: 10, weight: .semibold)  // Muito pequeno para usar token padrão
        case .medium:
            return .system(size: 12, weight: .semibold)  // Muito pequeno para usar token padrão
        case .large:
            return .system(size: DSTokens.Dimensions.iconSizeMedium, weight: .semibold)
        }
    }
    
    var labelFont: Font {
        switch size {
        case .small:
            return DSTokens.Typography.label.font
        case .medium:
            return DSTokens.Typography.bodyMedium.font
        case .large:
            return DSTokens.Typography.bodyLarge.font
        }
    }
    
    var labelColor: Color {
        if isDisabled {
            return DS.Colors.Content.secondary
        }
        return DS.Colors.Content.primary
    }
    
    var labelSpacing: CGFloat {
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
            return DSTokens.Radius.small
        case .large:
            return DSTokens.Radius.medium
        }
    }
    
    var checkboxSize: CGFloat {
        switch size {
        case .small:
            return DSTokens.Dimensions.checkboxSizeSmall
        case .medium:
            return DSTokens.Dimensions.checkboxSizeMedium
        case .large:
            return DSTokens.Dimensions.checkboxSizeLarge
        }
    }
    
    var scale: CGFloat {
        isDisabled ? 0.95 : 1.0
    }
    
    var opacity: Double {
        isDisabled ? 0.6 : 1.0
    }
}
