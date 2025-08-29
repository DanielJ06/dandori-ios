import SwiftUI

/// Estrutura com todos os tokens de espaçamento do design system
struct DSSpacing {
    /// Espaçamentos básicos
    static let xs: CGFloat = 4
    static let sm: CGFloat = 8
    static let md: CGFloat = 12
    static let lg: CGFloat = 16
    static let xl: CGFloat = 20
    static let xxl: CGFloat = 24
    static let xxxl: CGFloat = 32
    
    /// Espaçamentos específicos do design
    struct Page {
        static let padding: CGFloat = 80
        static let gap: CGFloat = 64
    }
}

/// Estrutura com todos os tokens de border radius do design system
struct DSRadius {
    static let sm: CGFloat = 6 // rounded-md
    static let md: CGFloat = 8 // rounded-lg
    static let lg: CGFloat = 16 // rounded-2xl
    static let full: CGFloat = 9999 // rounded-full
}

// MARK: - Extensions para facilitar aplicação

extension View {
    /// Aplica padding de página
    func pagePadding() -> some View {
        self.padding(DSSpacing.Page.padding)
    }
}
