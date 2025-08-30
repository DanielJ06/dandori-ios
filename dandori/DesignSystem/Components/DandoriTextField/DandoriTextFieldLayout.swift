import SwiftUI

// MARK: - DandoriTextField Layout

struct DandoriTextFieldLayout {
    let variant: DandoriTextFieldVariant
    let size: DandoriTextFieldSize
    let state: DandoriTextFieldState
    let isFocused: Bool
    
    var backgroundColor: Color {
        switch (variant, state) {
        case (_, .disabled):
            return DS.Colors.Surface.secondary.opacity(0.5)
        case (.filled, _), (.default, _):
            return DS.Colors.Surface.primary  // Fundo branco
        case (.outlined, _):
            return DS.Colors.Surface.secondary  // Fundo bege claro
        }
    }
    
    var borderColor: Color {
        switch state {
        case .focused:
            return DS.Colors.Accent.base
        case .error:
            return Color.red
        case .disabled:
            return DS.Colors.Border.default.opacity(0.5)
        case .normal:
            return DS.Colors.Border.default  // #E3D9CB
        }
    }
    
    var borderWidth: CGFloat {
        switch state {
        case .focused:
            return DSTokens.Dimensions.borderWidthThick
        case .error:
            return DSTokens.Dimensions.borderWidthThick
        case .normal, .disabled:
            return DSTokens.Dimensions.borderWidthThin
        }
    }
    
    var textColor: Color {
        switch state {
        case .disabled:
            return DS.Colors.Content.secondary
        case .normal, .focused, .error:
            return DS.Colors.Content.primary  // #1C1B1A
        }
    }
    
    var iconColor: Color {
        switch state {
        case .focused:
            return DS.Colors.Accent.base
        case .error:
            return Color.red
        case .disabled:
            return DS.Colors.Content.secondary
        case .normal:
            return DS.Colors.Content.secondary
        }
    }
    
    var helperTextColor: Color {
        DS.Colors.Content.secondary
    }
    
    var errorTextColor: Color {
        Color.red
    }
    
    var cornerRadius: CGFloat {
        switch variant {
        case .default, .filled:
            return DSTokens.Radius.medium  // 8pt
        case .outlined:
            return DSTokens.Radius.large   // 16pt para destaque
        }
    }
    
    var horizontalPadding: CGFloat {
        switch size {
        case .medium: return DSTokens.Spacing.elementLG    // 12pt
        case .large: return DSTokens.Spacing.componentSM   // 16pt
        }
    }
    
    var verticalPadding: CGFloat {
        switch size {
        case .medium: return DSTokens.Spacing.elementLG    // 12pt  
        case .large: return DSTokens.Spacing.componentSM   // 16pt
        }
    }
    
    var minHeight: CGFloat {
        // Garantir área touch-friendly ≥44px
        switch size {
        case .medium: return DSTokens.Dimensions.touchTargetMedium
        case .large: return DSTokens.Dimensions.touchTargetLarge
        }
    }
    
    var iconSize: CGFloat {
        switch size {
        case .medium: return DSTokens.Dimensions.iconSizeMedium
        case .large: return DSTokens.Dimensions.iconSizeLarge
        }
    }
    
    var typography: TypographyToken {
        DSTokens.Typography.bodyMedium  // Inter, 14pt, regular
    }
}
