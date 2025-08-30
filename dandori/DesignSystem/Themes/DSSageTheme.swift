import SwiftUI

/**
 * Sage Theme - Natural and organic
 * 
 * A natural and organic theme using sage green as the primary accent color.
 * Inspired by nature and wellness, perfect for mindful and balanced applications.
 */
struct DSSageTheme: DSTheme {
    let identifier = "sage"
    let displayName = "Sage"
    
    var colors: DSThemeColors {
        DSThemeColors(
            accent: DSThemeAccentColors(
                base: DSFoundation.ColorPrimitives.sage400,
                light: DSFoundation.ColorPrimitives.sage50,
                text: DSFoundation.ColorPrimitives.sage900
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
                primary: DSFoundation.ColorPrimitives.sage400,
                primaryHover: DSFoundation.ColorPrimitives.sage900,
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
