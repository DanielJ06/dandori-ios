import SwiftUI

// MARK: - DandoriCard Layout

struct DandoriCardLayout {
    let variant: DandoriCardVariant
    let size: DandoriCardSize
    
    var backgroundColor: Color {
        switch variant {
        case .default:
            return DS.Colors.Surface.secondary  // #FAF8F5 (bege claro)
        case .surface:
            return DS.Colors.Surface.primary    // Branco
        case .outlined:
            return Color.clear
        case .elevated:
            return DS.Colors.Surface.primary    // Branco com sombra
        }
    }
    
    var borderColor: Color {
        switch variant {
        case .outlined:
            return DS.Colors.Border.default  // #E3D9CB
        case .default, .surface, .elevated:
            return Color.clear
        }
    }
    
    var borderWidth: CGFloat {
        variant == .outlined ? 1 : 0
    }
    
    var cornerRadius: CGFloat {
        switch variant {
        case .default, .surface, .outlined:
            return DSTokens.Radius.large           // 16pt
        case .elevated:
            return DSTokens.Radius.extraLarge // 24pt
        }
    }
    
    var horizontalPadding: CGFloat {
        switch size {
        case .compact:
            return DSTokens.Spacing.elementLG      // 12pt
        case .standard:
            return DSTokens.Spacing.componentSM    // 16pt
        case .comfortable:
            return DSTokens.Spacing.componentMD    // 18pt (aumentado ligeiramente)
        }
    }
    
    var verticalPadding: CGFloat {
        switch size {
        case .compact:
            return DSTokens.Spacing.elementLG      // 12pt
        case .standard:
            return DSTokens.Spacing.componentSM    // 16pt
        case .comfortable:
            return DSTokens.Spacing.componentMD    // 18pt (aumentado ligeiramente)
        }
    }
    
    var shadowColor: Color {
        switch variant {
        case .elevated:
            return Color.black.opacity(0.12)
        case .default, .surface:
            return Color.black.opacity(0.04)
        case .outlined:
            return Color.clear
        }
    }
    
    var shadowRadius: CGFloat {
        switch variant {
        case .elevated: return DSTokens.Dimensions.shadowRadiusLarge
        case .default, .surface: return DSTokens.Dimensions.shadowRadiusSmall
        case .outlined: return 0
        }
    }
    
    var shadowY: CGFloat {
        switch variant {
        case .elevated: return DSTokens.Dimensions.shadowYMedium
        case .default, .surface: return DSTokens.Dimensions.shadowYSmall
        case .outlined: return 0
        }
    }
}
