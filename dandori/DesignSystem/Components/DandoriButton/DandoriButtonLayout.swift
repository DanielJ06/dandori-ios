import SwiftUI

// MARK: - DandoriButton Layout

struct DandoriButtonLayout {
    let variant: DandoriButtonVariant
    let size: DandoriButtonSize
    let state: DandoriButtonState
    
    var backgroundColor: Color {
        switch (variant, state) {
        case (.primary, .enabled), (.primary, .loading):
            return DS.Colors.Accent.base  // accent.base
        case (.primary, .disabled):
            return DS.Colors.Interactive.secondary
        case (.secondary, _):
            return DS.Colors.Surface.primary  // Fundo branco
        case (.tertiary, _):
            return DS.Colors.Surface.secondary  // Fundo bege claro
        case (.ghost, _):
            return Color.clear
        }
    }
    
    var foregroundColor: Color {
        switch (variant, state) {
        case (.primary, .enabled), (.primary, .loading):
            return DS.Colors.Content.inverse  // content.inverse (branco)
        case (.primary, .disabled):
            return DS.Colors.Content.secondary
        case (.secondary, _):
            return DS.Colors.Content.primary  // content.primary
        case (.tertiary, _):
            return DS.Colors.Content.primary
        case (.ghost, _):
            return DS.Colors.Accent.base
        }
    }
    
    var borderColor: Color {
        switch variant {
        case .primary:
            return backgroundColor
        case .secondary:
            return DS.Colors.Border.default  // border.default (#E3D9CB)
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
        case .small: return DSTokens.Dimensions.touchTargetSmall
        case .medium, .fullWidth: return DSTokens.Dimensions.touchTargetMedium
        case .large: return DSTokens.Dimensions.touchTargetLarge
        }
    }
    
    var iconSize: CGFloat {
        switch size {
        case .small: return DSTokens.Dimensions.iconSizeSmall
        case .medium, .fullWidth: return DSTokens.Dimensions.iconSizeMedium
        case .large: return DSTokens.Dimensions.iconSizeLarge
        }
    }
    
    var typography: TypographyToken {
        switch size {
        case .small: return DSTokens.Typography.label
        case .medium, .fullWidth, .large: return DSTokens.Typography.button  // Inter, 14pt, medium
        }
    }
}
