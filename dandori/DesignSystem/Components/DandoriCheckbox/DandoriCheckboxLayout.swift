import SwiftUI

// MARK: - DandoriCheckbox Layout

struct DandoriCheckboxLayout {
    let variant: DandoriCheckboxVariant
    let size: DandoriCheckboxSize
    let isDisabled: Bool
    
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
        
        switch variant {
        case .default:
            return DSTokens.Colors.Border.default
        case .accent:
            return DSTokens.Colors.Accent.teal.base
        }
    }
    
    var borderWidth: CGFloat { 1.5 }
    
    var checkmarkColor: Color {
        if isDisabled {
            return DSTokens.Colors.Content.secondary
        }
        
        switch variant {
        case .default:
            return DSTokens.Colors.Content.primary
        case .accent:
            return DSTokens.Colors.Accent.teal.text
        }
    }
    
    var checkmarkFont: Font {
        switch size {
        case .small:
            return .system(size: 10, weight: .semibold)
        case .medium:
            return .system(size: 12, weight: .semibold)
        case .large:
            return .system(size: 14, weight: .semibold)
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
            return DSTokens.Colors.Content.secondary
        }
        return DSTokens.Colors.Content.primary
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
            return 16
        case .medium:
            return 20
        case .large:
            return 24
        }
    }
    
    var scale: CGFloat {
        isDisabled ? 0.95 : 1.0
    }
    
    var opacity: Double {
        isDisabled ? 0.6 : 1.0
    }
}
