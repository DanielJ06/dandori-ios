import SwiftUI

/**
 * Semantic tokens for the Design System.
 * 
 * Maps primitive tokens to specific usage contexts, providing semantic meaning
 * to design values throughout the application.
 *
 * ## Usage
 * ```swift
 * // Colors
 * Color(DSTokens.Colors.Surface.primary)
 * Color(DSTokens.Colors.Accent.base)
 * 
 * // Spacing
 * .padding(DSTokens.Spacing.componentMD)
 * 
 * // Typography
 * .font(DSTokens.Typography.headingLarge.font)
 * ```
 *
 * ## Features
 * - Semantic color mapping
 * - Consistent spacing system
 * - Typography scale
 * - Radius values
 * - Dark mode support
 * - Accent color system
 */
struct DSTokens {
    
    // MARK: - Semantic Colors
    
    /**
     * Semantic color tokens organized by usage context.
     * Provides meaningful color names that map to primitive values.
     */
    typealias Colors = DSTokensColors
    
    // MARK: - Semantic Spacing
    
    /**
     * Semantic spacing tokens organized by scale level.
     * Provides consistent spacing values for elements, components, and layouts.
     */
    typealias Spacing = DSTokensSpacing
    
    // MARK: - Semantic Radius
    
    /**
     * Semantic radius tokens for consistent corner rounding.
     * Provides radius values for various UI element sizes.
     */
    typealias Radius = DSTokensRadius
    
    // MARK: - Semantic Typography
    
    /**
     * Semantic typography tokens for consistent text styling.
     * Provides font families, sizes, weights, and line heights.
     */
    typealias Typography = DSTokensTypography
    
    // MARK: - Semantic Dimensions
    
    /**
     * Semantic dimension tokens for consistent sizing.
     * Provides height, icon size, and other dimensional values.
     */
    typealias Dimensions = DSTokensDimensions
}
