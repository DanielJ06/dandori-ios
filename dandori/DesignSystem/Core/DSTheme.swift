import SwiftUI

/**
 * # Dandori Theme System
 * 
 * Sistema simplificado de temas que permite infinitos esquemas de cores,
 * mantendo typography, spacing e radius consistentes entre todos os temas.
 * 
 * ## Como usar (Forma Simplificada)
 * 
 * ### 1. Aplicar um tema à aplicação:
 * ```swift
 * DSThemeRoot(theme: DSTealTheme()) {
 *     ContentView()
 * }
 * ```
 * 
 * ### 2. Acessar cores e tokens em uma View (SEM @Environment!):
 * ```swift
 * struct MyView: View {
 *     var body: some View {
 *         Text("Hello")
 *             .foregroundColor(DS.Colors.Accent.text)
 *             .background(DS.Colors.Accent.base)
 *             .font(DS.Typography.headingLarge.font)
 *             .padding(DS.Spacing.componentMD)
 *     }
 * }
 * ```
 * 
 * ### 3. Trocar tema dinamicamente de qualquer lugar:
 * ```swift
 * DSThemeManager.shared.setTheme(DSSageTheme())
 * // ou
 * DSThemeManager.shared.setTheme(withIdentifier: "sage")
 * ```
 * 
 * ## Como criar um novo tema
 * 
 * ### 1. Crie uma struct que implementa DSTheme (apenas cores):
 * ```swift
 * struct DSCustomTheme: DSTheme {
 *     let identifier = "custom"
 *     let displayName = "Custom Theme"
 *     
 *     var colors: DSThemeColors {
 *         DSThemeColors(
 *             accent: DSThemeAccentColors(
 *                 base: Color.purple,
 *                 light: Color.purple.opacity(0.1),
 *                 text: Color.purple
 *             ),
 *             surface: DSThemeSurfaceColors(...),
 *             content: DSThemeContentColors(...),
 *             interactive: DSThemeInteractiveColors(...),
 *             border: DSThemeBorderColors(...)
 *         )
 *     }
 *     // typography, spacing e radius são fornecidos automaticamente
 * }
 * ```
 * 
 * ### 2. Registre o tema no DSThemeRegistry:
 * ```swift
 * static let allThemes: [DSTheme] = [
 *     DSTealTheme(),
 *     DSSageTheme(),
 *     DSTurquoiseTheme(),
 *     DSCustomTheme() // <- Adicione aqui
 * ]
 * ```
 * 
 * ## Vantagens do sistema
 * - ✅ **SEM @Environment necessário** - acesso direto via DS.Colors.Accent
 * - ✅ Temas infinitos possíveis (apenas cores)
 * - ✅ Typography, spacing e radius consistentes
 * - ✅ Fácil adição de novos temas
 * - ✅ Type-safe access aos tokens
 * - ✅ Tema global acessível de qualquer lugar
 * - ✅ Performance otimizada
 * - ✅ SwiftUI reactivity automática
 */

// MARK: - Theme Protocol

/// Protocolo que define a estrutura de um tema
/// Temas apenas definem esquemas de cores - typography, spacing e radius são consistentes
protocol DSTheme: Sendable {
    var identifier: String { get }
    var displayName: String { get }
    var colors: DSThemeColors { get }
}

// MARK: - Theme Components

struct DSThemeColors: Sendable {
    let accent: DSThemeAccentColors
    let surface: DSThemeSurfaceColors
    let content: DSThemeContentColors
    let interactive: DSThemeInteractiveColors
    let border: DSThemeBorderColors
}

struct DSThemeAccentColors: Sendable {
    let base: Color
    let light: Color
    let text: Color
}

struct DSThemeSurfaceColors: Sendable {
    let primary: Color
    let secondary: Color
    let tertiary: Color
}

struct DSThemeContentColors: Sendable {
    let primary: Color
    let secondary: Color
    let inverse: Color
}

struct DSThemeInteractiveColors: Sendable {
    let primary: Color
    let primaryHover: Color
    let secondary: Color
    let secondaryHover: Color
}

struct DSThemeBorderColors: Sendable {
    let `default`: Color
    let focus: Color
}

struct DSThemeTypography: Sendable {
    let displayXL: TypographyToken
    let display: TypographyToken
    let headingLarge: TypographyToken
    let headingMedium: TypographyToken
    let headingSmall: TypographyToken
    let bodyLarge: TypographyToken
    let bodyMedium: TypographyToken
    let bodySmall: TypographyToken
    let button: TypographyToken
    let label: TypographyToken
    let caption: TypographyToken
}

struct DSThemeSpacing: Sendable {
    let elementXS: CGFloat
    let elementSM: CGFloat
    let elementMD: CGFloat
    let elementLG: CGFloat
    let elementXL: CGFloat
    let componentSM: CGFloat
    let componentMD: CGFloat
    let componentLG: CGFloat
    let componentXL: CGFloat
    let layoutMD: CGFloat
    let layoutLG: CGFloat
}

struct DSThemeRadius: Sendable {
    let small: CGFloat
    let medium: CGFloat
    let large: CGFloat
    let full: CGFloat
}

// MARK: - Theme Registry

/**
 * Registry for all available themes in the application.
 * New themes can be added here to make them available throughout the app.
 */
struct DSThemeRegistry {
    static let allThemes: [DSTheme] = [
        DSSageTheme(),
        DSTealTheme(),
        DSTurquoiseTheme()
    ]
    
    static func theme(with identifier: String) -> DSTheme? {
        return allThemes.first { $0.identifier == identifier }
    }
}

// MARK: - Theme Implementations

// Theme implementations moved to separate files in /Themes folder:
// - DSTealTheme.swift
// - DSSageTheme.swift  
// - DSTurquoiseTheme.swift

// MARK: - Theme Manager (Singleton)

/// Global theme state - simple and thread-safe using actor
actor ThemeState {
    static let shared = ThemeState()
    
    private var currentTheme: DSTheme = DSSageTheme()
    
    var colors: DSThemeColors {
        currentTheme.colors
    }
    
    func setTheme(_ theme: DSTheme) {
        currentTheme = theme
    }
}

/// Global functions for theme access - no cache needed!
func getCurrentThemeColors() -> DSThemeColors {
    // Use a shared variable to store the current theme colors
    // This avoids the async/await complexity for synchronous access
    return ThemeColorCache.shared.currentColors
}

/// Simple cache for theme colors to avoid async complications
final class ThemeColorCache {
    static let shared = ThemeColorCache()
    
    private var _currentColors: DSThemeColors = DSSageTheme().colors
    private let queue = DispatchQueue(label: "theme-cache", attributes: .concurrent)
    
    var currentColors: DSThemeColors {
        queue.sync { _currentColors }
    }
    
    func updateColors(_ colors: DSThemeColors) {
        queue.async(flags: .barrier) {
            self._currentColors = colors
        }
    }
    
    private init() {}
}

func setGlobalTheme(_ theme: DSTheme) {
    // Update cache immediately for synchronous access
    ThemeColorCache.shared.updateColors(theme.colors)
    
    // Update async state for consistency
    Task {
        await ThemeState.shared.setTheme(theme)
    }
}

/// Legacy wrapper for SwiftUI integration
@MainActor
final class DSThemeManager: ObservableObject {
    static let shared = DSThemeManager()
    
    private init() {}
    
    var availableThemes: [DSTheme] {
        DSThemeRegistry.allThemes
    }
    
    var colors: DSThemeColors {
        getCurrentThemeColors()
    }
    
    /// Consistent tokens across all themes - these don't depend on theme state
    nonisolated var typography: DSThemeTypography {
        DSThemeTypography(
            displayXL: DSTokens.Typography.displayXL,
            display: DSTokens.Typography.display,
            headingLarge: DSTokens.Typography.headingLarge,
            headingMedium: DSTokens.Typography.headingMedium,
            headingSmall: DSTokens.Typography.headingSmall,
            bodyLarge: DSTokens.Typography.bodyLarge,
            bodyMedium: DSTokens.Typography.bodyMedium,
            bodySmall: DSTokens.Typography.bodySmall,
            button: DSTokens.Typography.button,
            label: DSTokens.Typography.label,
            caption: DSTokens.Typography.caption
        )
    }
    
    nonisolated var spacing: DSThemeSpacing {
        DSThemeSpacing(
            elementXS: DSTokens.Spacing.elementXS,
            elementSM: DSTokens.Spacing.elementSM,
            elementMD: DSTokens.Spacing.elementMD,
            elementLG: DSTokens.Spacing.elementLG,
            elementXL: DSTokens.Spacing.elementXL,
            componentSM: DSTokens.Spacing.componentSM,
            componentMD: DSTokens.Spacing.componentMD,
            componentLG: DSTokens.Spacing.componentLG,
            componentXL: DSTokens.Spacing.componentXL,
            layoutMD: DSTokens.Spacing.layoutMD,
            layoutLG: DSTokens.Spacing.layoutLG
        )
    }
    
    nonisolated var radius: DSThemeRadius {
        DSThemeRadius(
            small: DSTokens.Radius.small,
            medium: DSTokens.Radius.medium,
            large: DSTokens.Radius.large,
            full: DSTokens.Radius.full
        )
    }
    
    /// Set theme - delegates to global function
    func setTheme(_ theme: DSTheme) {
        setGlobalTheme(theme)
        
        // Force UI update on main thread
        DispatchQueue.main.async {
            self.objectWillChange.send()
        }
    }
    
    /// Set theme by identifier - convenience method
    func setTheme(withIdentifier identifier: String) {
        if let theme = DSThemeRegistry.theme(with: identifier) {
            setTheme(theme)
        }
    }
    
    /// Async method for setting theme from nonisolated context
    nonisolated func setThemeAsync(_ theme: DSTheme) {
        Task { @MainActor in
            setTheme(theme)
        }
    }
    
    /// Get current theme colors asynchronously - for when you need guaranteed fresh data
    func getCurrentColors() async -> DSThemeColors {
        await ThemeState.shared.colors
    }
}

// MARK: - Theme Provider Protocol (Legacy)

@MainActor
protocol DSThemeProviding: ObservableObject {
    var availableThemes: [DSTheme] { get }
    
    // Direct access to theme colors
    var colors: DSThemeColors { get }
    
    // Consistent tokens across all themes
    var typography: DSThemeTypography { get }
    var spacing: DSThemeSpacing { get }
    var radius: DSThemeRadius { get }
    
    func setTheme(_ theme: DSTheme)
    func setTheme(withIdentifier identifier: String)
}

/// Implementação concreta do theme provider (Legacy wrapper)
/// Agora usa o DSThemeManager internamente para compatibilidade
@MainActor
final class DSThemeProvider: DSThemeProviding {
    private let themeManager = DSThemeManager.shared
    
    init(theme: DSTheme? = nil) {
        if let theme = theme {
            themeManager.setTheme(theme)
        }
    }
    
    var availableThemes: [DSTheme] {
        themeManager.availableThemes
    }
    
    // Direct access to theme colors
    var colors: DSThemeColors {
        themeManager.colors
    }
    
    // Consistent tokens across all themes
    var typography: DSThemeTypography {
        themeManager.typography
    }
    
    var spacing: DSThemeSpacing {
        themeManager.spacing
    }
    
    var radius: DSThemeRadius {
        themeManager.radius
    }
    
    func setTheme(_ theme: DSTheme) {
        themeManager.setTheme(theme)
    }
    
    func setTheme(withIdentifier identifier: String) {
        themeManager.setTheme(withIdentifier: identifier)
    }
}

// MARK: - Environment Integration

@preconcurrency
struct DSThemeProviderKey: @preconcurrency EnvironmentKey {
    @MainActor
    static let defaultValue: DSThemeProvider = DSThemeProvider()
}

extension EnvironmentValues {
    var dsTheme: DSThemeProvider {
        get { self[DSThemeProviderKey.self] }
        set { self[DSThemeProviderKey.self] = newValue }
    }
}

// MARK: - View Extensions

extension View {
    func dsThemeProvider(_ provider: DSThemeProvider) -> some View {
        self.environmentObject(provider)
            .environment(\.dsTheme, provider)
    }
}

/// Root provider que deve envolver toda a aplicação
/// Agora simplesmente configura o tema global no DSThemeManager
struct DSThemeRoot<Content: View>: View {
    @StateObject private var themeManager = DSThemeManager.shared
    @StateObject private var themeProvider: DSThemeProvider
    let content: () -> Content
    
    init(theme: DSTheme? = nil, @ViewBuilder content: @escaping () -> Content) {
        self._themeProvider = StateObject(wrappedValue: DSThemeProvider(theme: theme))
        self.content = content
        
        // Configura o tema global se fornecido
        if let theme = theme {
            // Initialize cache with the initial theme
            ThemeColorCache.shared.updateColors(theme.colors)
            DSThemeManager.shared.setTheme(theme)
        }
    }
    
    var body: some View {
        content()
            .dsThemeProvider(themeProvider)
            .environmentObject(themeManager)
    }
}
