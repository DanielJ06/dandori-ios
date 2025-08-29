import SwiftUI

/// Namespace principal do Design System Dandori
/// 
/// Este arquivo serve como ponto de entrada para todos os tokens
/// do design system, facilitando importação e uso consistente.
///
/// Exemplo de uso:
/// ```swift
/// import SwiftUI
/// 
/// struct MyView: View {
///     var body: some View {
///         VStack {
///             Text("Hello World")
///                 .font(DS.Typography.cardTitle)
///                 .foregroundColor(DS.Colors.neutral.text)
///                 .dsPagePadding()
///         }
///         .background(DS.Colors.neutral.background)
///         .dsCardRadius()
///         .accentColor(.sage)
///     }
/// }
/// ```

struct DS {
    
    // MARK: - Tokens
    
    /// Namespace para cores do design system
    struct Colors {
        static let neutral = DSColors.Neutral.self
        static let states = DSColors.States.self
    }
    
    /// Namespace para tipografia
    struct Typography {
        static let button = DSTypography.button
        static let tag = DSTypography.tag
        static let eyebrow = DSTypography.eyebrow
        static let cardTitle = DSTypography.cardTitle
        static let listText = DSTypography.listText
        static let body = DSTypography.body
        static let bodySecondary = DSTypography.bodySecondary
        
        static func inter(size: DSTypography.FontSize, weight: DSTypography.FontWeight = .regular) -> Font {
            DSTypography.inter(size: size, weight: weight)
        }
        
        static func merriweather(size: DSTypography.FontSize, weight: DSTypography.FontWeight = .regular) -> Font {
            DSTypography.merriweather(size: size, weight: weight)
        }
    }
    
    /// Namespace para espaçamentos
    struct Spacing {
        static let xs = DSSpacing.xs
        static let sm = DSSpacing.sm
        static let md = DSSpacing.md
        static let lg = DSSpacing.lg
        static let xl = DSSpacing.xl
        static let xxl = DSSpacing.xxl
        static let xxxl = DSSpacing.xxxl
        
        static let page = DSSpacing.Page.self
    }
    
    /// Namespace para border radius
    struct Radius {
        static let sm = DSRadius.sm
        static let md = DSRadius.md
        static let lg = DSRadius.lg
        static let full = DSRadius.full
    }
    
    // MARK: - Environment & Providers
    
    // AccentProvider está disponível globalmente
}

// MARK: - Global Extensions

/// Extension global para facilitar aplicação de padding e radius
extension View {
    func dsPagePadding() -> some View {
        self.pagePadding()
    }
    
    func dsCardRadius() -> some View {
        self.cornerRadius(DS.Radius.lg)
    }
}

// MARK: - Theme Management

/// Gerenciador de tema global da aplicação
@MainActor
class DSThemeManager: ObservableObject {
    @Published var currentAccent: AccentColor = .teal
    
    static let shared = DSThemeManager()
    
    private init() {}
    
    func setAccent(_ accent: AccentColor) {
        currentAccent = accent
    }
}
