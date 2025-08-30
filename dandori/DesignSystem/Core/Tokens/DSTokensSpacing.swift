import SwiftUI

/**
 * Semantic spacing tokens organized by scale level.
 * Provides consistent spacing values for elements, components, and layouts.
 */
struct DSTokensSpacing {
    // Element spacing
    static let elementXS = DSFoundation.SpacingPrimitives.space2
    static let elementSM = DSFoundation.SpacingPrimitives.space4
    static let elementMD = DSFoundation.SpacingPrimitives.space8
    static let elementLG = DSFoundation.SpacingPrimitives.space12
    static let elementXL = DSFoundation.SpacingPrimitives.space16
    
    // Component spacing - Adjusted for better web alignment
    static let componentSM = DSFoundation.SpacingPrimitives.space8
    static let componentMD: CGFloat = 18 // Increased from 16 to better match web proportions
    static let componentLG = DSFoundation.SpacingPrimitives.space24
    static let componentXL = DSFoundation.SpacingPrimitives.space32
    
    // Layout spacing
    static let layoutMD = DSFoundation.SpacingPrimitives.space20
    static let layoutLG = DSFoundation.SpacingPrimitives.space24
}
