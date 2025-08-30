import SwiftUI

// MARK: - DandoriSegmented Layout

struct DandoriSegmentedLayout {
    let variant: DandoriSegmentedVariant
    
    var containerBackgroundColor: Color {
        DS.Colors.Surface.secondary  // #FAF8F5
    }
    
    var containerBorderColor: Color {
        DS.Colors.Border.default  // #E3D9CB
    }
    
    var borderWidth: CGFloat { DSTokens.Dimensions.borderWidthThin }
    
    func segmentBackgroundColor(isSelected: Bool) -> Color {
        switch isSelected {
        case true:
            return DS.Colors.Surface.primary  // Branco
        case false:
            return DS.Colors.Accent.light
        }
    }
    
    func segmentTextColor(isSelected: Bool) -> Color {
        switch isSelected {
        case true:
            return DS.Colors.Content.primary
        case false:
            return DS.Colors.Accent.text
        }
    }
    
    var helperTextColor: Color {
        DS.Colors.Content.secondary
    }
    
    var cornerRadius: CGFloat {
        DSTokens.Radius.medium  // 8pt equivalente ao rounded-xl do web
    }
    
    var segmentRadius: CGFloat {
        DSTokens.Radius.small  // Radius interno menor
    }
    
    var horizontalPadding: CGFloat {
        DSTokens.Spacing.componentMD  // Increased from componentSM for better touch targets
    }
    
    var verticalPadding: CGFloat {
        DSTokens.Spacing.elementLG  // Increased from elementMD for better visual balance
    }
    
    var typography: TypographyToken {
        DSTokens.Typography.button  // Inter, 14pt, medium weight
    }
}
