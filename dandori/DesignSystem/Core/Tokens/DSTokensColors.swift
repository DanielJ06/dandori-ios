import SwiftUI

/**
 * Semantic color tokens organized by usage context.
 * Provides meaningful color names that map to primitive values.
 */
struct DSTokensColors {
    
    /**
     * Surface colors for backgrounds and containers.
     */
    struct Surface {
        static let primary = DSFoundation.ColorPrimitives.white
        static let secondary = DSFoundation.ColorPrimitives.gray50
        static let tertiary = DSFoundation.ColorPrimitives.gray100
        static let beigeAlt = DSFoundation.ColorPrimitives.gray100
        
        // Dark mode variants
        static let primaryDark = DSFoundation.ColorPrimitives.gray900
        static let secondaryDark = DSFoundation.ColorPrimitives.gray700
        static let tertiaryDark = DSFoundation.ColorPrimitives.gray400
    }
    
    /**
     * Content colors for text and foreground elements.
     */
    struct Content {
        static let primary = DSFoundation.ColorPrimitives.gray900
        static let secondary = DSFoundation.ColorPrimitives.gray400
        static let inverse = DSFoundation.ColorPrimitives.white
        
        // Dark mode variants
        static let primaryDark = DSFoundation.ColorPrimitives.white
        static let secondaryDark = DSFoundation.ColorPrimitives.gray200
        static let inverseDark = DSFoundation.ColorPrimitives.gray900
    }
    
    /**
     * Border colors for outlines and dividers.
     */
    struct Border {
        static let `default` = DSFoundation.ColorPrimitives.gray200
        static let focus = DSFoundation.ColorPrimitives.gray400
        
        // Dark mode variants
        static let defaultDark = DSFoundation.ColorPrimitives.gray700
        static let focusDark = DSFoundation.ColorPrimitives.gray400
    }
    
    /**
     * Interactive colors for buttons and interactive elements.
     * Uses default teal values - will be overridden by specific themes.
     */
    struct Interactive {
        static let primary = DSFoundation.ColorPrimitives.teal400
        static let primaryHover = DSFoundation.ColorPrimitives.teal900
        static let secondary = DSFoundation.ColorPrimitives.gray100
        static let secondaryHover = DSFoundation.ColorPrimitives.gray400
    }
    
    /**
     * Accent colors for highlighting and emphasis.
     * Uses default teal values - will be overridden by specific themes.
     */
    struct Accent {
        static let base = DSFoundation.ColorPrimitives.teal400
        static let light = DSFoundation.ColorPrimitives.teal50
        static let text = DSFoundation.ColorPrimitives.teal900
    }
}

// MARK: - Supporting Types

// AccentColorToken removed - accent colors are now part of themes directly
