import SwiftUI

/**
 * Semantic dimension tokens for consistent sizing.
 * Provides height, icon size, and other dimensional values.
 */
struct DSTokensDimensions {
    // Touch target heights (following HIG guidelines)
    static let touchTargetSmall: CGFloat = 36
    static let touchTargetMedium: CGFloat = 44
    static let touchTargetLarge: CGFloat = 52
    
    // Icon sizes by component size
    static let iconSizeSmall: CGFloat = 14
    static let iconSizeMedium: CGFloat = 16
    static let iconSizeLarge: CGFloat = 18
    
    // Checkbox sizes
    static let checkboxSizeSmall: CGFloat = 16
    static let checkboxSizeMedium: CGFloat = 20
    static let checkboxSizeLarge: CGFloat = 24
    
    // Shadow values
    static let shadowRadiusSmall: CGFloat = 4
    static let shadowRadiusMedium: CGFloat = 8
    static let shadowRadiusLarge: CGFloat = 12
    
    static let shadowYSmall: CGFloat = 2
    static let shadowYMedium: CGFloat = 4
    static let shadowYLarge: CGFloat = 6
    
    // Border widths
    static let borderWidthThin: CGFloat = 1
    static let borderWidthMedium: CGFloat = 1.5
    static let borderWidthThick: CGFloat = 2
}
