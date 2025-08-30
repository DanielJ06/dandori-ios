import SwiftUI

// MARK: - Dandori Component Configuration

/**
 * Centralized configuration for Dandori Design System components.
 * 
 * This configuration centralizes constants, limits, and global settings
 * for all components in the design system.
 *
 * ## Usage
 * ```swift
 * // Access global limits
 * let maxTitleLength = DandoriComponentConfig.Limits.maxButtonTitleLength
 * 
 * // Use animation durations
 * withAnimation(.easeInOut(DandoriComponentConfig.Animation.normal)) { ... }
 * 
 * // Check accessibility settings
 * let minTouchTarget = DandoriComponentConfig.Accessibility.minimumTouchTarget
 * ```
 *
 * ## Features
 * - Global limits and constraints
 * - Standardized animation durations
 * - Accessibility guidelines
 * - Performance optimizations
 * - Theme support configuration
 */
struct DandoriComponentConfig {
    
    // MARK: - Global Limits
    
    /**
     * Global limits for component content and behavior.
     * Ensures consistent sizing and prevents UI issues.
     */
    struct Limits {
        static let maxButtonTitleLength = 50
        static let maxBadgeTextLength = 30
        static let maxTextFieldPlaceholderLength = 100
        static let maxCardTitleLength = 100
        static let maxToastMessageLength = 200
    }
    
    // MARK: - Animation Durations
    
    /**
     * Standardized animation durations for consistent user experience.
     * Provides semantic timing values for different interaction types.
     */
    struct Animation {
        static let fast: Double = 0.15
        static let normal: Double = 0.25
        static let slow: Double = 0.35
        
        static let buttonPress: Double = 0.1
        static let focusTransition: Double = 0.2
        static let stateChange: Double = 0.3
    }
    
    // MARK: - Accessibility
    
    /**
     * Accessibility guidelines and requirements for components.
     * Ensures components meet accessibility standards.
     */
    struct Accessibility {
        static let minimumTouchTarget: CGFloat = DSTokens.Dimensions.touchTargetMedium
        static let minimumTextSize: CGFloat = 11.0
        static let minimumContrastRatio: Double = 4.5
        
        static let buttonRole = "button"
        static let cardRole = "group"
        static let textFieldRole = "textbox"
        static let badgeRole = "text"
    }
    
    // MARK: - Performance
    
    /**
     * Performance optimization settings for components.
     * Helps maintain smooth user experience.
     */
    struct Performance {
        static let maxConcurrentAnimations = 3
        static let debounceDelay: TimeInterval = 0.3
        static let throttleDelay: TimeInterval = 0.1
        
        static let shouldUseLazyLoading = true
        static let shouldCacheLayouts = true
    }
    
    // MARK: - Theme Support
    
    /**
     * Theme support configuration for components.
     * Defines supported themes and fallback options.
     */
    struct Theme {
        static let supportsDarkMode = true
        static let supportsHighContrast = true
        static let supportsReducedMotion = true
        
        static let defaultAccentColor = "teal"
        static let fallbackFont = "Inter"
    }
}

// MARK: - Toast Configuration

extension DandoriComponentConfig {
    
    /**
     * Toast-specific configuration settings.
     * These are kept separate as they're not easily configurable via environment.
     */
    struct Toast {
        static let defaultDuration: TimeInterval = 3.0
        static let minDuration: TimeInterval = 1.0
        static let maxDuration: TimeInterval = 10.0
        
        static let maxToastsOnScreen = 3
        static let animationDuration: Double = 0.3
        
        static let autoDismiss = true
        static let dismissOnTap = true
    }
}

// MARK: - Debug Configuration

#if DEBUG
extension DandoriComponentConfig {
    /**
     * Prints current configuration for debugging purposes.
     * Only available in debug builds.
     */
    static func printCurrentConfig() {
        print("🔧 Dandori Component Configuration:")
        print("  Limits: maxButtonTitle=\(Limits.maxButtonTitleLength)")
        print("  Animation: normal=\(Animation.normal)s")
        print("  Accessibility: minTouchTarget=\(Accessibility.minimumTouchTarget)")
        print("  Performance: maxAnimations=\(Performance.maxConcurrentAnimations)")
        print("  Theme: defaultAccent=\(Theme.defaultAccentColor)")
    }
}
#endif
