import SwiftUI

// MARK: - DandoriToast Layout

struct DandoriToastLayout {
    let variant: DandoriToastVariant
    
    var backgroundColor: Color {
        switch variant {
        case .info:
            return DSTokens.Colors.Surface.primary  // Branco
        case .success:
            return DSTokens.Colors.Accent.teal.light
        case .warning:
            return DSTokens.Colors.Surface.secondary
        case .error:
            return Color.red.opacity(0.1)
        }
    }
    
    var foregroundColor: Color {
        switch variant {
        case .info:
            return DSTokens.Colors.Content.primary
        case .success:
            return DSTokens.Colors.Accent.teal.text
        case .warning:
            return Color.orange
        case .error:
            return Color.red
        }
    }
    
    var iconColor: Color {
        foregroundColor
    }
    
    var closeButtonColor: Color {
        foregroundColor.opacity(0.7)
    }
    
    var borderColor: Color {
        switch variant {
        case .info:
            return DSTokens.Colors.Border.default
        case .success:
            return DSTokens.Colors.Accent.teal.base
        case .warning:
            return Color.orange
        case .error:
            return Color.red
        }
    }
    
    var borderWidth: CGFloat { 1 }
    
    var cornerRadius: CGFloat {
        DSTokens.Radius.medium
    }
    
    var horizontalPadding: CGFloat {
        DSTokens.Spacing.componentSM
    }
    
    var verticalPadding: CGFloat {
        DSTokens.Spacing.elementLG
    }
    
    var shadowColor: Color {
        Color.black.opacity(0.08)
    }
    
    var shadowRadius: CGFloat { 8 }
    var shadowY: CGFloat { 2 }
    
    var typography: TypographyToken {
        DSTokens.Typography.bodyMedium  // Inter, 14pt, regular
    }
}
