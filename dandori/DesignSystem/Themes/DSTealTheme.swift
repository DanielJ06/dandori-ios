import SwiftUI

/**
 * Teal Theme - Professional and calming
 * 
 * A professional and calming theme using teal as the primary accent color.
 * Perfect for productivity and focus-oriented applications.
 */
struct DSTealTheme: DSTheme {
    let identifier = "teal"
    let displayName = "Teal"
    
    var colors: DSThemeColors {
        DSThemeColors(
            accent: DSThemeAccentColors(
                base: DSFoundation.ColorPrimitives.teal400,
                light: DSFoundation.ColorPrimitives.teal50,
                text: DSFoundation.ColorPrimitives.teal900
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
                primary: DSFoundation.ColorPrimitives.teal400,
                primaryHover: DSFoundation.ColorPrimitives.teal900,
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
