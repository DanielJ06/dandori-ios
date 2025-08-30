import SwiftUI

// MARK: - DandoriToast Layout

struct DandoriToastLayout {
    let variant: DandoriToastVariant
    
    var backgroundColor: Color {
        switch variant {
        case .info, .success:
            return DS.Colors.Surface.primary  // Branco
        case .warning:
            return DS.Colors.Accent.light
        case .error:
            return DS.Colors.Surface.secondary
        }
    }
    
    var textColor: Color {
        switch variant {
        case .info, .error:
            return DS.Colors.Content.primary
        case .success, .warning:
            return DS.Colors.Accent.text
        }
    }
    
    var iconColor: Color {
        textColor
    }
    
    var closeButtonColor: Color {
        textColor.opacity(0.7)
    }
    
    var borderColor: Color {
        switch variant {
        case .info, .error:
            return DS.Colors.Border.default
        case .success, .warning:
            return DS.Colors.Accent.base
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
    
    var shadowRadius: CGFloat { DSTokens.Dimensions.shadowRadiusMedium }
    var shadowY: CGFloat { DSTokens.Dimensions.shadowYSmall }
    
    var typography: TypographyToken {
        DSTokens.Typography.bodyMedium  // Inter, 14pt, regular
    }
}
