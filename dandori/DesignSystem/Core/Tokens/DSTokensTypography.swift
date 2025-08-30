import SwiftUI

/**
 * Semantic typography tokens for consistent text styling.
 * Provides font families, sizes, weights, and line heights.
 */
struct DSTokensTypography {
    // Display text
    static let displayXL = TypographyToken(
        fontFamily: DSFoundation.TypographyPrimitives.fontFamilyMerriweather,
        fontSize: DSFoundation.TypographyPrimitives.fontSize36,
        fontWeight: DSFoundation.TypographyPrimitives.weightRegular,
        lineHeight: 1.2
    )
    
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
        lineHeight: 1.2
    )
    
    static let label = TypographyToken(
        fontFamily: DSFoundation.TypographyPrimitives.fontFamilyInter,
        fontSize: DSFoundation.TypographyPrimitives.fontSize12,
        fontWeight: DSFoundation.TypographyPrimitives.weightMedium,
        lineHeight: 1.2
    )
    
    static let caption = TypographyToken(
        fontFamily: DSFoundation.TypographyPrimitives.fontFamilyInter,
        fontSize: DSFoundation.TypographyPrimitives.fontSize11,
        fontWeight: DSFoundation.TypographyPrimitives.weightMedium,
        lineHeight: 1.2
    )
}

// MARK: - Supporting Types

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
