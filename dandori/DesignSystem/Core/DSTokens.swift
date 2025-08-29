import SwiftUI

/// Tokens semânticos do Design System
/// Mapeia tokens primitivos para contextos de uso específicos
struct DSTokens {
    
    // MARK: - Semantic Colors
    struct Colors {
        
        struct Surface {
            static let primary = DSFoundation.ColorPrimitives.white
            static let secondary = DSFoundation.ColorPrimitives.gray50
            static let tertiary = DSFoundation.ColorPrimitives.gray100
            
            // Dark mode variants
            static let primaryDark = DSFoundation.ColorPrimitives.gray900
            static let secondaryDark = DSFoundation.ColorPrimitives.gray700
            static let tertiaryDark = DSFoundation.ColorPrimitives.gray400
        }
        
        struct Content {
            static let primary = DSFoundation.ColorPrimitives.gray900
            static let secondary = DSFoundation.ColorPrimitives.gray400
            static let inverse = DSFoundation.ColorPrimitives.white
            
            // Dark mode variants
            static let primaryDark = DSFoundation.ColorPrimitives.white
            static let secondaryDark = DSFoundation.ColorPrimitives.gray100
            static let inverseDark = DSFoundation.ColorPrimitives.gray900
        }
        
        struct Border {
            static let `default` = DSFoundation.ColorPrimitives.gray100
            static let focus = DSFoundation.ColorPrimitives.gray400
            
            // Dark mode variants
            static let defaultDark = DSFoundation.ColorPrimitives.gray700
            static let focusDark = DSFoundation.ColorPrimitives.gray400
        }
        
        struct Interactive {
            static let primary = DSFoundation.ColorPrimitives.teal400
            static let primaryHover = DSFoundation.ColorPrimitives.teal900
            static let secondary = DSFoundation.ColorPrimitives.gray100
            static let secondaryHover = DSFoundation.ColorPrimitives.gray400
        }
        
        struct Accent {
            static let teal = AccentColorToken(
                base: DSFoundation.ColorPrimitives.teal400,
                light: DSFoundation.ColorPrimitives.teal50,
                text: DSFoundation.ColorPrimitives.teal900
            )
            
            static let sage = AccentColorToken(
                base: DSFoundation.ColorPrimitives.sage400,
                light: DSFoundation.ColorPrimitives.sage50,
                text: DSFoundation.ColorPrimitives.sage900
            )
            
            static let turquoise = AccentColorToken(
                base: DSFoundation.ColorPrimitives.turquoise400,
                light: DSFoundation.ColorPrimitives.turquoise50,
                text: DSFoundation.ColorPrimitives.turquoise900
            )
        }
    }
    
    // MARK: - Semantic Spacing
    struct Spacing {
        // Element spacing
        static let elementXS = DSFoundation.SpacingPrimitives.space2
        static let elementSM = DSFoundation.SpacingPrimitives.space4
        static let elementMD = DSFoundation.SpacingPrimitives.space8
        static let elementLG = DSFoundation.SpacingPrimitives.space12
        static let elementXL = DSFoundation.SpacingPrimitives.space16
        
        // Component spacing
        static let componentSM = DSFoundation.SpacingPrimitives.space8
        static let componentMD = DSFoundation.SpacingPrimitives.space16
        static let componentLG = DSFoundation.SpacingPrimitives.space24
        static let componentXL = DSFoundation.SpacingPrimitives.space32
        
        // Layout spacing
        static let layoutMD = DSFoundation.SpacingPrimitives.space64
        static let layoutLG = DSFoundation.SpacingPrimitives.space80
    }
    
    // MARK: - Semantic Radius
    struct Radius {
        static let small = DSFoundation.RadiusPrimitives.radius6
        static let medium = DSFoundation.RadiusPrimitives.radius8
        static let large = DSFoundation.RadiusPrimitives.radius16
        static let full = DSFoundation.RadiusPrimitives.radiusFull
    }
    
    // MARK: - Semantic Typography
    struct Typography {
        // Display text
        static let display = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyMerriweather,
            fontSize: DSFoundation.TypographyPrimitives.fontSize30,
            fontWeight: DSFoundation.TypographyPrimitives.weightRegular,
            lineHeight: 1.2
        )
        
        // Headings
        static let headingLarge = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyMerriweather,
            fontSize: DSFoundation.TypographyPrimitives.fontSize24,
            fontWeight: DSFoundation.TypographyPrimitives.weightRegular,
            lineHeight: 1.3
        )
        
        static let headingMedium = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyMerriweather,
            fontSize: DSFoundation.TypographyPrimitives.fontSize20,
            fontWeight: DSFoundation.TypographyPrimitives.weightRegular,
            lineHeight: 1.3
        )
        
        static let headingSmall = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyMerriweather,
            fontSize: DSFoundation.TypographyPrimitives.fontSize18,
            fontWeight: DSFoundation.TypographyPrimitives.weightRegular,
            lineHeight: 1.4
        )
        
        // Body text
        static let bodyLarge = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyInter,
            fontSize: DSFoundation.TypographyPrimitives.fontSize16,
            fontWeight: DSFoundation.TypographyPrimitives.weightRegular,
            lineHeight: 1.5
        )
        
        static let bodyMedium = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyInter,
            fontSize: DSFoundation.TypographyPrimitives.fontSize14,
            fontWeight: DSFoundation.TypographyPrimitives.weightRegular,
            lineHeight: 1.5
        )
        
        static let bodySmall = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyInter,
            fontSize: DSFoundation.TypographyPrimitives.fontSize12,
            fontWeight: DSFoundation.TypographyPrimitives.weightRegular,
            lineHeight: 1.4
        )
        
        // UI elements
        static let button = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyInter,
            fontSize: DSFoundation.TypographyPrimitives.fontSize14,
            fontWeight: DSFoundation.TypographyPrimitives.weightMedium,
            lineHeight: 1.0
        )
        
        static let label = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyInter,
            fontSize: DSFoundation.TypographyPrimitives.fontSize12,
            fontWeight: DSFoundation.TypographyPrimitives.weightMedium,
            lineHeight: 1.0
        )
        
        static let caption = TypographyToken(
            fontFamily: DSFoundation.TypographyPrimitives.fontFamilyInter,
            fontSize: DSFoundation.TypographyPrimitives.fontSize11,
            fontWeight: DSFoundation.TypographyPrimitives.weightMedium,
            lineHeight: 1.0
        )
    }
}

// MARK: - Supporting Types

struct AccentColorToken {
    let base: Color
    let light: Color
    let text: Color
}

struct TypographyToken {
    let fontFamily: String
    let fontSize: CGFloat
    let fontWeight: Font.Weight
    let lineHeight: CGFloat
    
    var font: Font {
        // Para Inter, usa o nome da família e deixa o iOS gerenciar os pesos
        if fontFamily == "Inter" {
            return Font.custom("Inter", size: fontSize).weight(fontWeight)
        }
        // Para Merriweather, usa nomes específicos baseados no peso
        else if fontFamily == "Merriweather-Regular" {
            let fontName = getFontName(fontFamily: fontFamily, weight: fontWeight)
            return Font.custom(fontName, size: fontSize)
        }
        // Fallback
        else {
            return Font.custom(fontFamily, size: fontSize).weight(fontWeight)
        }
    }
    
    private func getFontName(fontFamily: String, weight: Font.Weight) -> String {
        switch fontFamily {
        case "Merriweather-Regular":
            switch weight {
            case .bold:
                return "Merriweather-Bold"
            default:
                return "Merriweather-Regular"
            }
        default:
            return fontFamily
        }
    }
}
