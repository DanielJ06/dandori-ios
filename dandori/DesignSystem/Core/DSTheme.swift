import SwiftUI

// MARK: - Theme Protocol

/// Protocolo que define a estrutura de um tema
protocol DSTheme {
    var identifier: String { get }
    var displayName: String { get }
    var colors: DSThemeColors { get }
    var typography: DSThemeTypography { get }
    var spacing: DSThemeSpacing { get }
    var radius: DSThemeRadius { get }
}

// MARK: - Theme Components

struct DSThemeColors {
    let accent: DSThemeAccentColors
    let surface: DSThemeSurfaceColors
    let content: DSThemeContentColors
    let interactive: DSThemeInteractiveColors
    let border: DSThemeBorderColors
}

struct DSThemeAccentColors {
    let base: Color
    let light: Color
    let text: Color
}

struct DSThemeSurfaceColors {
    let primary: Color
    let secondary: Color
    let tertiary: Color
}

struct DSThemeContentColors {
    let primary: Color
    let secondary: Color
    let inverse: Color
}

struct DSThemeInteractiveColors {
    let primary: Color
    let primaryHover: Color
    let secondary: Color
    let secondaryHover: Color
}

struct DSThemeBorderColors {
    let `default`: Color
    let focus: Color
}

struct DSThemeTypography {
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

struct DSThemeSpacing {
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

struct DSThemeRadius {
    let small: CGFloat
    let medium: CGFloat
    let large: CGFloat
    let full: CGFloat
}

// MARK: - Accent Type

enum AccentType: String, CaseIterable, Identifiable {
    case teal
    case sage  
    case turquoise
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .teal: return "Teal"
        case .sage: return "Sage"
        case .turquoise: return "Turquoise"
        }
    }
    
    var token: AccentColorToken {
        switch self {
        case .teal: return DSTokens.Colors.Accent.teal
        case .sage: return DSTokens.Colors.Accent.sage
        case .turquoise: return DSTokens.Colors.Accent.turquoise
        }
    }
}

// MARK: - Theme Implementations

struct DSDefaultTheme: DSTheme {
    let identifier: String
    let displayName: String
    let accentType: AccentType
    let colorScheme: ColorScheme
    
    init(accent: AccentType, colorScheme: ColorScheme = .light) {
        self.accentType = accent
        self.colorScheme = colorScheme
        self.identifier = "\(accent.rawValue)-\(colorScheme == .light ? "light" : "dark")"
        self.displayName = "\(accent.displayName) \(colorScheme == .light ? "Light" : "Dark")"
    }
    
    var colors: DSThemeColors {
        DSThemeColors(
            accent: DSThemeAccentColors(
                base: accentType.token.base,
                light: accentType.token.light,
                text: accentType.token.text
            ),
            surface: DSThemeSurfaceColors(
                primary: colorScheme == .light ? DSTokens.Colors.Surface.primary : DSTokens.Colors.Surface.primaryDark,
                secondary: colorScheme == .light ? DSTokens.Colors.Surface.secondary : DSTokens.Colors.Surface.secondaryDark,
                tertiary: colorScheme == .light ? DSTokens.Colors.Surface.tertiary : DSTokens.Colors.Surface.tertiaryDark
            ),
            content: DSThemeContentColors(
                primary: colorScheme == .light ? DSTokens.Colors.Content.primary : DSTokens.Colors.Content.primaryDark,
                secondary: colorScheme == .light ? DSTokens.Colors.Content.secondary : DSTokens.Colors.Content.secondaryDark,
                inverse: colorScheme == .light ? DSTokens.Colors.Content.inverse : DSTokens.Colors.Content.inverseDark
            ),
            interactive: DSThemeInteractiveColors(
                primary: DSTokens.Colors.Interactive.primary,
                primaryHover: DSTokens.Colors.Interactive.primaryHover,
                secondary: DSTokens.Colors.Interactive.secondary,
                secondaryHover: DSTokens.Colors.Interactive.secondaryHover
            ),
            border: DSThemeBorderColors(
                default: colorScheme == .light ? DSTokens.Colors.Border.default : DSTokens.Colors.Border.defaultDark,
                focus: colorScheme == .light ? DSTokens.Colors.Border.focus : DSTokens.Colors.Border.focusDark
            )
        )
    }
    
    var typography: DSThemeTypography {
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
    
    var spacing: DSThemeSpacing {
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
    
    var radius: DSThemeRadius {
        DSThemeRadius(
            small: DSTokens.Radius.small,
            medium: DSTokens.Radius.medium,
            large: DSTokens.Radius.large,
            full: DSTokens.Radius.full
        )
    }
}

// MARK: - Theme Provider Protocol

@MainActor
protocol DSThemeProviding: ObservableObject {
    var currentAccent: AccentType { get set }
    var currentTheme: DSTheme { get }
    var availableAccents: [AccentType] { get }
    
    func setAccent(_ accent: AccentType)
    func setColorScheme(_ colorScheme: ColorScheme)
}

/// Implementação concreta do theme provider
@MainActor
final class DSThemeProvider: DSThemeProviding {
    @Published var currentAccent: AccentType
    @Published private var colorScheme: ColorScheme = .light
    
    init(accent: AccentType = .teal, colorScheme: ColorScheme = .light) {
        self.currentAccent = accent
        self.colorScheme = colorScheme
    }
    
    var currentTheme: DSTheme {
        DSDefaultTheme(accent: currentAccent, colorScheme: colorScheme)
    }
    
    var availableAccents: [AccentType] {
        AccentType.allCases
    }
    
    func setAccent(_ accent: AccentType) {
        currentAccent = accent
    }
    
    func setColorScheme(_ colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
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
struct DSThemeRoot<Content: View>: View {
    @StateObject private var themeProvider: DSThemeProvider
    let content: () -> Content
    
    init(accent: AccentType = .teal, @ViewBuilder content: @escaping () -> Content) {
        self._themeProvider = StateObject(wrappedValue: DSThemeProvider(accent: accent))
        self.content = content
    }
    
    var body: some View {
        content()
            .dsThemeProvider(themeProvider)
    }
}
