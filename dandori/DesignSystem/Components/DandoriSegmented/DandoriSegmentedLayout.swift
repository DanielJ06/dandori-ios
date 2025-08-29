import SwiftUI

// MARK: - DandoriSegmented Layout

struct DandoriSegmentedLayout {
    let variant: DandoriSegmentedVariant
    
    var backgroundColor: Color {
        DSTokens.Colors.Surface.secondary  // #FAF8F5
    }
    
    var borderColor: Color {
        DSTokens.Colors.Border.default  // #E3D9CB
    }
    
    var borderWidth: CGFloat { 1 }
    
    var selectedBackgroundColor: Color {
        switch variant {
        case .default:
            return DSTokens.Colors.Surface.primary  // Branco
        case .accent:
            return DSTokens.Colors.Accent.teal.light
        }
    }
    
    var selectedForegroundColor: Color {
        switch variant {
        case .default:
            return DSTokens.Colors.Content.primary
        case .accent:
            return DSTokens.Colors.Accent.teal.text
        }
    }
    
    var unselectedForegroundColor: Color {
        DSTokens.Colors.Content.secondary
    }
    
    var cornerRadius: CGFloat {
        DSTokens.Radius.medium  // 8pt equivalente ao rounded-xl do web
    }
    
    var segmentRadius: CGFloat {
        DSTokens.Radius.small  // Radius interno menor
    }
    
    var horizontalPadding: CGFloat {
        DSTokens.Spacing.componentSM
    }
    
    var verticalPadding: CGFloat {
        DSTokens.Spacing.elementMD
    }
    
    var typography: TypographyToken {
        DSTokens.Typography.button  // Inter, 14pt, medium weight
    }
}
