import SwiftUI

// MARK: - DandoriBadge Layout

struct DandoriBadgeLayout {
    let variant: DandoriBadgeVariant
    let size: DandoriBadgeSize
    
    var backgroundColor: Color {
        switch variant {
        case .default:
            return DSTokens.Colors.Surface.primary  // Fundo branco
        case .filled:
            return DSTokens.Colors.Surface.secondary  // #FAF8F5
        case .accent:
            return DSTokens.Colors.Accent.teal.light
        case .status:
            return DSTokens.Colors.Accent.teal.light
        case .subtle:
            return DSTokens.Colors.Surface.secondary.opacity(0.7)
        }
    }
    
    var foregroundColor: Color {
        switch variant {
        case .default, .filled, .subtle:
            return DSTokens.Colors.Content.primary  // #1C1B1A
        case .accent:
            return DSTokens.Colors.Accent.teal.text
        case .status:
            return DSTokens.Colors.Accent.teal.text
        }
    }
    
    var borderColor: Color {
        switch variant {
        case .default:
            return DSTokens.Colors.Border.default       // #E3D9CB borda bege
        case .filled, .accent, .status, .subtle:
            return Color.clear
        }
    }
    
    var borderWidth: CGFloat {
        variant == .default ? 1 : 0
    }
    
    var cornerRadius: CGFloat {
        switch size {
        case .small, .medium:
            return DSTokens.Radius.full                 // rounded-full
        case .large:
            return DSTokens.Radius.medium               // radius menor para badges maiores
        }
    }
    
    var horizontalPadding: CGFloat {
        switch size {
        case .small: return DSTokens.Spacing.elementMD    // 8pt
        case .medium: return DSTokens.Spacing.elementLG   // 12pt (equivale a px-3 do web)
        case .large: return DSTokens.Spacing.componentSM  // 16pt
        }
    }
    
    var verticalPadding: CGFloat {
        switch size {
        case .small: return DSTokens.Spacing.elementXS    // 2pt
        case .medium: return DSTokens.Spacing.elementSM   // 4pt (equivale a py-1 do web)
        case .large: return DSTokens.Spacing.elementMD    // 8pt
        }
    }
    
    var iconSize: CGFloat {
        switch size {
        case .small: return 10
        case .medium: return 12
        case .large: return 14
        }
    }
    
    var typography: TypographyToken {
        switch size {
        case .small: return DSTokens.Typography.caption       // 11pt
        case .medium: return DSTokens.Typography.label        // 12pt (text-xs do web)
        case .large: return DSTokens.Typography.bodyMedium    // 14pt
        }
    }
}
