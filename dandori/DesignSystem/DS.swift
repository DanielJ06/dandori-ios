import SwiftUI

/// Namespace principal do Design System refatorado
/// Segue princípios de Clean Architecture e Single Responsibility
struct DS {
    
    // MARK: - Color Tokens
    struct Colors {
        struct Surface {
            static let primary = DSTokens.Colors.Surface.primary
            static let secondary = DSTokens.Colors.Surface.secondary  
            static let tertiary = DSTokens.Colors.Surface.tertiary
        }
        
        struct Content {
            static let primary = DSTokens.Colors.Content.primary
            static let secondary = DSTokens.Colors.Content.secondary
            static let inverse = DSTokens.Colors.Content.inverse
        }
        
        struct Border {
            static let `default` = DSTokens.Colors.Border.default
            static let focus = DSTokens.Colors.Border.focus
        }
        
        struct Interactive {
            static let primary = DSTokens.Colors.Interactive.primary
            static let primaryHover = DSTokens.Colors.Interactive.primaryHover
            static let secondary = DSTokens.Colors.Interactive.secondary
            static let secondaryHover = DSTokens.Colors.Interactive.secondaryHover
        }
    }
    
    // MARK: - Typography Tokens
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
    /// Aplica padding de layout padrão
    func dsLayoutPadding() -> some View {
        self.padding(DS.Spacing.layoutLG)
    }
    
    /// Aplica padding de componente padrão
    func dsComponentPadding() -> some View {
        self.padding(DS.Spacing.componentMD)
    }
    
    /// Aplica radius de card padrão
    func dsCardRadius() -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: DS.Radius.large))
    }
    
    /// Aplica radius de botão padrão
    func dsButtonRadius() -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: DS.Radius.medium))
    }
}
