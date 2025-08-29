import SwiftUI

/// Foundation layer do Design System
/// Contém apenas tokens primitivos (não semânticos)
struct DSFoundation {
    
    // MARK: - Color Primitives
    struct ColorPrimitives {
        // Neutral scale
        static let white = Color(red: 1.0, green: 1.0, blue: 1.0)
        static let black = Color(red: 0.0, green: 0.0, blue: 0.0)
        static let gray50 = Color(red: 0.98, green: 0.98, blue: 0.98)
        static let gray100 = Color(red: 0.89, green: 0.85, blue: 0.80)
        static let gray400 = Color(red: 0.42, green: 0.42, blue: 0.41)
        static let gray700 = Color(red: 0.11, green: 0.11, blue: 0.10)
        static let gray900 = Color(red: 0.04, green: 0.04, blue: 0.04)
        
        // Accent primitives
        static let teal400 = Color(red: 0.17, green: 0.65, blue: 0.60)
        static let teal50 = Color(red: 0.90, green: 0.96, blue: 0.95)
        static let teal900 = Color(red: 0.05, green: 0.37, blue: 0.34)
        
        static let sage400 = Color(red: 0.49, green: 0.67, blue: 0.54)
        static let sage50 = Color(red: 0.89, green: 0.95, blue: 0.91)
        static let sage900 = Color(red: 0.14, green: 0.30, blue: 0.22)
        
        static let turquoise400 = Color(red: 0.23, green: 0.69, blue: 0.72)
        static let turquoise50 = Color(red: 0.90, green: 0.97, blue: 0.97)
        static let turquoise900 = Color(red: 0.04, green: 0.31, blue: 0.34)
    }
    
    // MARK: - Spacing Primitives
    struct SpacingPrimitives {
        static let space2: CGFloat = 2
        static let space4: CGFloat = 4
        static let space8: CGFloat = 8
        static let space12: CGFloat = 12
        static let space16: CGFloat = 16
        static let space20: CGFloat = 20
        static let space24: CGFloat = 24
        static let space32: CGFloat = 32
        static let space64: CGFloat = 64
        static let space80: CGFloat = 80
    }
    
    // MARK: - Radius Primitives
    struct RadiusPrimitives {
        static let radius2: CGFloat = 2
        static let radius4: CGFloat = 4
        static let radius6: CGFloat = 6
        static let radius8: CGFloat = 8
        static let radius16: CGFloat = 16
        static let radiusFull: CGFloat = 9999
    }
    
    // MARK: - Typography Primitives
    struct TypographyPrimitives {
        // Font sizes
        static let fontSize11: CGFloat = 11
        static let fontSize12: CGFloat = 12
        static let fontSize14: CGFloat = 14
        static let fontSize16: CGFloat = 16
        static let fontSize18: CGFloat = 18
        static let fontSize20: CGFloat = 20
        static let fontSize24: CGFloat = 24
        static let fontSize30: CGFloat = 30
        
        // Font families
        static let fontFamilyInter = "Inter"
        static let fontFamilyMerriweather = "Merriweather-Regular"
        
        // Font weights
        static let weightLight = Font.Weight.light
        static let weightRegular = Font.Weight.regular
        static let weightMedium = Font.Weight.medium
        static let weightSemibold = Font.Weight.semibold
        static let weightBold = Font.Weight.bold
    }
}
