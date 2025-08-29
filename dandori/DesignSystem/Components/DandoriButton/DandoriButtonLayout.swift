import SwiftUI

// MARK: - DandoriButton Layout

struct DandoriButtonLayout {
    let variant: DandoriButtonVariant
    let size: DandoriButtonSize
    let state: DandoriButtonState
    
    var backgroundColor: Color {
        switch (variant, state) {
        case (.primary, .enabled), (.primary, .loading):
            return DSTokens.Colors.Accent.teal.base  // accent.base
        case (.primary, .disabled):
            return DSTokens.Colors.Interactive.secondary
        case (.secondary, _):
            return DSTokens.Colors.Surface.primary  // Fundo branco
        case (.tertiary, _):
            return DSTokens.Colors.Surface.secondary  // Fundo bege claro
        case (.ghost, _):
            return Color.clear
        }
    }
    
    var foregroundColor: Color {
        switch (variant, state) {
        case (.primary, .enabled), (.primary, .loading):
            return DSTokens.Colors.Content.inverse  // content.inverse (branco)
        case (.primary, .disabled):
            return DSTokens.Colors.Content.secondary
        case (.secondary, _):
            return DSTokens.Colors.Content.primary  // content.primary
        case (.tertiary, _):
            return DSTokens.Colors.Content.primary
        case (.ghost, _):
            return DSTokens.Colors.Accent.teal.base
        }
    }
    
    var borderColor: Color {
        switch variant {
        case .primary:
            return backgroundColor
        case .secondary:
            return DSTokens.Colors.Border.default  // border.default (#E3D9CB)
        case .tertiary:
            return Color.clear
        case .ghost:
            return Color.clear
        }
    }
    
    var borderWidth: CGFloat {
        switch variant {
        case .primary, .tertiary, .ghost:
            return 0
        case .secondary:
            return 1
        }
    }
    
    var cornerRadius: CGFloat {
        DSTokens.Radius.medium  // radius8
    }
    
    var horizontalPadding: CGFloat {
        switch size {
        case .small: return DSTokens.Spacing.elementMD
        case .medium, .fullWidth: return DSTokens.Spacing.componentSM
        case .large: return DSTokens.Spacing.componentMD
        }
    }
    
    var verticalPadding: CGFloat {
        switch size {
        case .small: return DSTokens.Spacing.elementSM
        case .medium, .fullWidth: return DSTokens.Spacing.elementMD
        case .large: return DSTokens.Spacing.elementLG
        }
    }
    
    var minHeight: CGFloat {
        // Garantir área de toque ≥44px conforme HIG
        switch size {
        case .small: return 36
        case .medium, .fullWidth: return 44
        case .large: return 52
        }
    }
    
    var iconSize: CGFloat {
        switch size {
        case .small: return 14
        case .medium, .fullWidth: return 16
        case .large: return 18
        }
    }
    
    var typography: TypographyToken {
        switch size {
        case .small: return DSTokens.Typography.label
        case .medium, .fullWidth, .large: return DSTokens.Typography.button  // Inter, 14pt, medium
        }
    }
}
