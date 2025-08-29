import SwiftUI

// MARK: - DandoriChip Layout

struct DandoriChipLayout {
    let variant: DandoriChipVariant
    let size: DandoriChipSize
    
    var backgroundColor: Color {
        switch variant {
        case .accent:
            return DSTokens.Colors.Accent.teal.light
        case .neutral:
            return DSTokens.Colors.Surface.secondary  // #FAF8F5
        case .outlined:
            return DSTokens.Colors.Surface.primary
        }
    }
    
    var foregroundColor: Color {
        switch variant {
        case .accent:
            return DSTokens.Colors.Accent.teal.text
        case .neutral, .outlined:
            return DSTokens.Colors.Content.primary  // #1C1B1A
        }
    }
    
    var borderColor: Color {
        switch variant {
        case .outlined:
            return DSTokens.Colors.Border.default  // #E3D9CB
        case .accent, .neutral:
            return Color.clear
        }
    }
    
    var borderWidth: CGFloat {
        variant == .outlined ? 1 : 0
    }
    
    var cornerRadius: CGFloat {
        DSTokens.Radius.full
    }
    
    var horizontalPadding: CGFloat {
        switch size {
        case .small: return DSTokens.Spacing.elementMD
        case .medium: return DSTokens.Spacing.elementLG
        }
    }
    
    var verticalPadding: CGFloat {
        switch size {
        case .small: return DSTokens.Spacing.elementXS
        case .medium: return DSTokens.Spacing.elementSM
        }
    }
    
    var typography: TypographyToken {
        switch size {
        case .small: return DSTokens.Typography.caption
        case .medium: return DSTokens.Typography.label
        }
    }
}
