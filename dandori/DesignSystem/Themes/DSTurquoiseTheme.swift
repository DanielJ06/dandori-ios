import SwiftUI

/**
 * Turquoise Theme - Vibrant and energetic
 * 
 * A vibrant and energetic theme using turquoise as the primary accent color.
 * Brings energy and creativity, perfect for dynamic and innovative applications.
 */
struct DSTurquoiseTheme: DSTheme {
    let identifier = "turquoise"
    let displayName = "Turquoise"
    
    var colors: DSThemeColors {
        DSThemeColors(
            accent: DSThemeAccentColors(
                base: DSFoundation.ColorPrimitives.turquoise400,
                light: DSFoundation.ColorPrimitives.turquoise50,
                text: DSFoundation.ColorPrimitives.turquoise900
            ),
            surface: DSThemeSurfaceColors(
                primary: DSTokens.Colors.Surface.primary,
                secondary: DSTokens.Colors.Surface.secondary,
                tertiary: DSTokens.Colors.Surface.tertiary
            ),
            content: DSThemeContentColors(
                primary: DSTokens.Colors.Content.primary,
                secondary: DSTokens.Colors.Content.secondary,
                inverse: DSTokens.Colors.Content.inverse
            ),
            interactive: DSThemeInteractiveColors(
                primary: DSFoundation.ColorPrimitives.turquoise400,
                primaryHover: DSFoundation.ColorPrimitives.turquoise900,
                secondary: DSTokens.Colors.Interactive.secondary,
                secondaryHover: DSTokens.Colors.Interactive.secondaryHover
            ),
            border: DSThemeBorderColors(
                default: DSTokens.Colors.Border.default,
                focus: DSTokens.Colors.Border.focus
            )
        )
    }
}
