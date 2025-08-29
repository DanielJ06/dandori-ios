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
            return DSTokens.Colors.Surface.secondary.opacity(0.5)
        case (.default, _), (.outlined, _):
            return DSTokens.Colors.Surface.primary  // Fundo branco
        case (.filled, _):
            return DSTokens.Colors.Surface.secondary  // Fundo bege claro
        }
    }
    
    var borderColor: Color {
        switch state {
        case .focused:
            return DSTokens.Colors.Accent.teal.base
        case .error:
            return Color.red
        case .disabled:
            return DSTokens.Colors.Border.default.opacity(0.5)
        case .normal:
            return DSTokens.Colors.Border.default  // #E3D9CB
        }
    }
    
    var borderWidth: CGFloat {
        switch state {
        case .focused:
            return 2
        case .error:
            return 2
        case .normal, .disabled:
            return 1
        }
    }
    
    var textColor: Color {
        switch state {
        case .disabled:
            return DSTokens.Colors.Content.secondary
        case .normal, .focused, .error:
            return DSTokens.Colors.Content.primary  // #1C1B1A
        }
    }
    
    var iconColor: Color {
        switch state {
        case .focused:
            return DSTokens.Colors.Accent.teal.base
        case .error:
            return Color.red
        case .disabled:
            return DSTokens.Colors.Content.secondary
        case .normal:
            return DSTokens.Colors.Content.secondary
        }
    }
    
    var helperTextColor: Color {
        DSTokens.Colors.Content.secondary
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
        case .medium: return 44
        case .large: return 52
        }
    }
    
    var iconSize: CGFloat {
        switch size {
        case .medium: return 16
        case .large: return 18
        }
    }
    
    var typography: TypographyToken {
        DSTokens.Typography.bodyMedium  // Inter, 14pt, regular
    }
}
