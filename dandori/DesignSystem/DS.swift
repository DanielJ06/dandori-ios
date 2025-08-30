import SwiftUI

/**
 * Main namespace for the Dandori Design System.
 * 
 * This namespace provides a clean interface to all design tokens and utilities,
 * with automatic theme support without requiring @Environment injection.
 *
 * ## Simple Usage (New Way)
 * ```swift
 * // Accent colors automatically use the current theme
 * .background(DS.Colors.Accent.base)
 * .foregroundColor(DS.Colors.Accent.text)
 * 
 * // All colors automatically use current theme
 * .background(DS.Colors.Surface.primary)
 * .foregroundColor(DS.Colors.Content.primary)
 * 
 * // Typography (consistent across themes)
 * Text("Title").font(DS.Typography.headingLarge.font)
 * 
 * // Spacing (consistent across themes)
 * .padding(DS.Spacing.componentMD)
 * 
 * // Radius (consistent across themes)
 * .clipShape(RoundedRectangle(cornerRadius: DS.Radius.medium))
 * ```
 *
 * ## Setup
 * Simply wrap your app with DSThemeRoot:
 * ```swift
 * DSThemeRoot(theme: DSTealTheme()) {
 *     ContentView()
 * }
 * ```
 * 
 * ## Changing Themes
 * ```swift
 * // Globally change theme from anywhere
 * DSThemeManager.shared.setTheme(DSSageTheme())
 * // or
 * DSThemeManager.shared.setTheme(withIdentifier: "sage")
 * ```
 *
 * ## Features
 * - ✅ No @Environment required - access colors directly
 * - ✅ Automatic theme switching across the app
 * - ✅ Organized token structure (Colors, Typography, Spacing, Radius)
 * - ✅ Clean, semantic naming conventions
 * - ✅ View extensions for common styling patterns
 * - ✅ Consistent with Dandori Design System guidelines
 */
struct DS {
    
    // MARK: - Color Tokens
    
    /**
     * Color tokens for various surface and content elements.
     * Provides semantic color names that map to the current active theme.
     */
    struct Colors {
        /**
         * Accent colors from the current active theme.
         * Changes automatically when theme is switched.
         */
        struct Accent {
            static var base: Color {
                getCurrentThemeColors().accent.base
            }
            
            static var light: Color {
                getCurrentThemeColors().accent.light
            }
            
            static var text: Color {
                getCurrentThemeColors().accent.text
            }
        }
        
        /**
         * Surface colors for backgrounds and containers.
         * Uses current theme's surface colors when available, falls back to default tokens.
         */
        struct Surface {
            static var primary: Color {
                getCurrentThemeColors().surface.primary
            }
            
            static var secondary: Color {
                getCurrentThemeColors().surface.secondary
            }
            
            static var tertiary: Color {
                getCurrentThemeColors().surface.tertiary
            }
        }
        
        /**
         * Content colors for text and foreground elements.
         * Uses current theme's content colors when available, falls back to default tokens.
         */
        struct Content {
            static var primary: Color {
                getCurrentThemeColors().content.primary
            }
            
            static var secondary: Color {
                getCurrentThemeColors().content.secondary
            }
            
            static var inverse: Color {
                getCurrentThemeColors().content.inverse
            }
        }
        
        /**
         * Border colors for outlines and dividers.
         * Uses current theme's border colors when available, falls back to default tokens.
         */
        struct Border {
            static var `default`: Color {
                getCurrentThemeColors().border.default
            }
            
            static var focus: Color {
                getCurrentThemeColors().border.focus
            }
        }
        
        /**
         * Interactive colors for buttons and interactive elements.
         * Uses current theme's interactive colors when available, falls back to default tokens.
         */
        struct Interactive {
            static var primary: Color {
                getCurrentThemeColors().interactive.primary
            }
            
            static var primaryHover: Color {
                getCurrentThemeColors().interactive.primaryHover
            }
            
            static var secondary: Color {
                getCurrentThemeColors().interactive.secondary
            }
            
            static var secondaryHover: Color {
                getCurrentThemeColors().interactive.secondaryHover
            }
        }
    }
    
    // MARK: - Typography Tokens
    
    /**
     * Typography tokens for consistent text styling across the app.
     * Provides font styles that map to the design system tokens.
     */
    struct Typography {
        static let displayXL = DSTokens.Typography.displayXL
        static let display = DSTokens.Typography.display
        static let headingLarge = DSTokens.Typography.headingLarge
        static let headingMedium = DSTokens.Typography.headingMedium
        static let headingSmall = DSTokens.Typography.headingSmall
        static let bodyLarge = DSTokens.Typography.bodyLarge
        static let bodyMedium = DSTokens.Typography.bodyMedium
        static let bodySmall = DSTokens.Typography.bodySmall
        static let button = DSTokens.Typography.button
        static let label = DSTokens.Typography.label
        static let caption = DSTokens.Typography.caption
    }
    
    // MARK: - Spacing Tokens
    
    /**
     * Spacing tokens for consistent layout and component spacing.
     * Organized by level: element, component, and layout.
     */
    struct Spacing {
        // Element level
        static let elementXS = DSTokens.Spacing.elementXS
        static let elementSM = DSTokens.Spacing.elementSM
        static let elementMD = DSTokens.Spacing.elementMD
        static let elementLG = DSTokens.Spacing.elementLG
        static let elementXL = DSTokens.Spacing.elementXL
        
        // Component level
        static let componentSM = DSTokens.Spacing.componentSM
        static let componentMD = DSTokens.Spacing.componentMD
        static let componentLG = DSTokens.Spacing.componentLG
        static let componentXL = DSTokens.Spacing.componentXL
        
        // Layout level
        static let layoutMD = DSTokens.Spacing.layoutMD
        static let layoutLG = DSTokens.Spacing.layoutLG
    }
    
    // MARK: - Radius Tokens
    
    /**
     * Radius tokens for consistent corner rounding across the app.
     * Provides semantic radius values for various UI elements.
     */
    struct Radius {
        static let small = DSTokens.Radius.small
        static let medium = DSTokens.Radius.medium
        static let large = DSTokens.Radius.large
        static let extraLarge = DSTokens.Radius.extraLarge
        static let full = DSTokens.Radius.full
    }
}

// MARK: - View Extensions

extension View {
    /**
     * Applies standard layout padding using design system tokens.
     *
     * - Returns: A view with standard layout padding applied
     */
    func dsLayoutPadding() -> some View {
        self.padding(DS.Spacing.layoutLG)
    }
    
    /**
     * Applies standard component padding using design system tokens.
     *
     * - Returns: A view with standard component padding applied
     */
    func dsComponentPadding() -> some View {
        self.padding(DS.Spacing.componentMD)
    }
    
    /**
     * Applies standard card radius using design system tokens.
     *
     * - Returns: A view with standard card radius applied
     */
    func dsCardRadius() -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: DS.Radius.large))
    }
    
    /**
     * Applies standard button radius using design system tokens.
     *
     * - Returns: A view with standard button radius applied
     */
    func dsButtonRadius() -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: DS.Radius.medium))
    }
}
