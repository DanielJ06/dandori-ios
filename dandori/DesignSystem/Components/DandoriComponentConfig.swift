import SwiftUI

// MARK: - Dandori Component Configuration

/// Configuração centralizada para componentes do Design System Dandori
/// Centraliza constantes, limites e configurações globais
struct DandoriComponentConfig {
    
    // MARK: - Global Limits
    
    struct Limits {
        static let maxButtonTitleLength = 50
        static let maxBadgeTextLength = 30
        static let maxTextFieldPlaceholderLength = 100
        static let maxCardTitleLength = 100
        static let maxToastMessageLength = 200
    }
    
    // MARK: - Animation Durations
    
    struct Animation {
        static let fast: Double = 0.15
        static let normal: Double = 0.25
        static let slow: Double = 0.35
        
        static let buttonPress: Double = 0.1
        static let focusTransition: Double = 0.2
        static let stateChange: Double = 0.3
    }
    
    // MARK: - Accessibility
    
    struct Accessibility {
        static let minimumTouchTarget: CGFloat = 44.0
        static let minimumTextSize: CGFloat = 11.0
        static let minimumContrastRatio: Double = 4.5
        
        static let buttonRole = "button"
        static let cardRole = "group"
        static let textFieldRole = "textbox"
        static let badgeRole = "text"
    }
    
    // MARK: - Performance
    
    struct Performance {
        static let maxConcurrentAnimations = 3
        static let debounceDelay: TimeInterval = 0.3
        static let throttleDelay: TimeInterval = 0.1
        
        static let shouldUseLazyLoading = true
        static let shouldCacheLayouts = true
    }
    
    // MARK: - Theme Support
    
    struct Theme {
        static let supportsDarkMode = true
        static let supportsHighContrast = true
        static let supportsReducedMotion = true
        
        static let defaultAccentColor = "teal"
        static let fallbackFont = "Inter"
    }
}

// MARK: - Component-Specific Configurations

extension DandoriComponentConfig {
    
    // MARK: - Button Configuration
    
    struct Button {
        static let defaultVariant: DandoriButtonVariant = .primary
        static let defaultSize: DandoriButtonSize = .medium
        static let defaultState: DandoriButtonState = .enabled
        
        static let loadingSpinnerSize: CGFloat = 16.0
        static let iconSpacing: CGFloat = 8.0
        
        static let disabledOpacity: Double = 0.6
        static let pressedScale: Double = 0.98
    }
    
    // MARK: - Badge Configuration
    
    struct Badge {
        static let defaultVariant: DandoriBadgeVariant = .default
        static let defaultSize: DandoriBadgeSize = .medium
        
        static let iconSpacing: CGFloat = 4.0
        static let maxIconSize: CGFloat = 20.0
        
        static let pillShapeThreshold = 20 // characters
    }
    
    // MARK: - Card Configuration
    
    struct Card {
        static let defaultVariant: DandoriCardVariant = .default
        static let defaultSize: DandoriCardSize = .standard
        
        static let shadowRadius: CGFloat = 8.0
        static let shadowOpacity: Double = 0.1
        static let borderWidth: CGFloat = 1.0
        
        static let maxElevation: CGFloat = 24.0
    }
    
    // MARK: - TextField Configuration
    
    struct TextField {
        static let defaultVariant: DandoriTextFieldVariant = .default
        static let defaultSize: DandoriTextFieldSize = .medium
        static let defaultState: DandoriTextFieldState = .normal
        
        static let iconSpacing: CGFloat = 12.0
        static let maxIconSize: CGFloat = 24.0
        
        static let focusAnimationDuration: Double = 0.2
        static let errorAnimationDuration: Double = 0.3
    }
    
    // MARK: - Toast Configuration
    
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

// MARK: - Environment Configuration

extension DandoriComponentConfig {
    
    /// Retorna a configuração baseada no ambiente atual
    static func forEnvironment(_ environment: EnvironmentValues) -> EnvironmentAwareConfig {
        var config = EnvironmentAwareConfig()
        
        // Ajusta configurações baseado no ambiente
        if environment.colorScheme == .dark {
            config = config.withDarkMode()
        }
        
        if environment.accessibilityReduceMotion {
            config = config.withReducedMotion()
        }
        
        return config
    }
}

// MARK: - Environment-Aware Configuration

/// Configuração que pode ser modificada baseada no ambiente
struct EnvironmentAwareConfig {
    var supportsDarkMode: Bool = true
    var shouldCacheLayouts: Bool = true
    var minimumContrastRatio: Double = 4.5
    
    /// Aplica configurações para modo escuro
    func withDarkMode() -> EnvironmentAwareConfig {
        var config = self
        config.supportsDarkMode = true
        return config
    }
    
    /// Aplica configurações para movimento reduzido
    func withReducedMotion() -> EnvironmentAwareConfig {
        var config = self
        config.shouldCacheLayouts = false
        return config
    }
    
    /// Aplica configurações para alto contraste
    func withHighContrast() -> EnvironmentAwareConfig {
        var config = self
        config.minimumContrastRatio = 7.0
        return config
    }
}

// MARK: - Debug Configuration

#if DEBUG
extension DandoriComponentConfig {
    /// Imprime a configuração atual para debug
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
