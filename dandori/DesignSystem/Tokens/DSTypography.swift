import SwiftUI

/// Estrutura com todos os estilos tipográficos do design system
struct DSTypography {
    
    /// Enum para as fontes customizadas
    enum FontFamily: String {
        case inter = "Inter"
        case merriweather = "Merriweather"
        
        var name: String { rawValue }
    }
    
    /// Enum para os pesos de fonte
    enum FontWeight {
        case light
        case regular
        case medium
        case semibold
        case bold
        
        var weight: Font.Weight {
            switch self {
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            case .semibold: return .semibold
            case .bold: return .bold
            }
        }
    }
    
    /// Enum para tamanhos de fonte
    enum FontSize: CGFloat {
        case xs = 12
        case sm = 14
        case base = 16
        case lg = 18
        case xl = 20
        case xxl = 24
        case xxxl = 30
        
        /// Tamanho específico para eyebrow
        case eyebrow = 11
    }
    
    // MARK: - Estilos Predefinidos
    
    /// Estilo para botões
    static let button = Font.custom(FontFamily.inter.name, size: FontSize.sm.rawValue)
        .weight(FontWeight.medium.weight)
    
    /// Estilo para tags/chips
    static let tag = Font.custom(FontFamily.inter.name, size: FontSize.xs.rawValue)
        .weight(FontWeight.medium.weight)
    
    /// Estilo para eyebrow
    static let eyebrow = Font.custom(FontFamily.inter.name, size: FontSize.eyebrow.rawValue)
        .weight(FontWeight.medium.weight)
    
    /// Estilo para título de cards
    static let cardTitle = Font.custom(FontFamily.merriweather.name, size: FontSize.lg.rawValue)
        .weight(FontWeight.regular.weight)
    
    /// Estilo para texto de listas
    static let listText = Font.custom(FontFamily.inter.name, size: FontSize.sm.rawValue)
        .weight(FontWeight.regular.weight)
    
    /// Estilo para corpo de texto
    static let body = Font.custom(FontFamily.inter.name, size: FontSize.base.rawValue)
        .weight(FontWeight.regular.weight)
    
    /// Estilo para texto secundário
    static let bodySecondary = Font.custom(FontFamily.inter.name, size: FontSize.sm.rawValue)
        .weight(FontWeight.regular.weight)
    
    // MARK: - Funções auxiliares para criar fontes customizadas
    
    /// Cria uma fonte Inter com tamanho e peso específicos
    static func inter(size: FontSize, weight: FontWeight = .regular) -> Font {
        Font.custom(FontFamily.inter.name, size: size.rawValue)
            .weight(weight.weight)
    }
    
    /// Cria uma fonte Merriweather com tamanho e peso específicos
    static func merriweather(size: FontSize, weight: FontWeight = .regular) -> Font {
        Font.custom(FontFamily.merriweather.name, size: size.rawValue)
            .weight(weight.weight)
    }
}

// MARK: - Extensions para facilitar uso

extension Text {
    /// Aplica o estilo de botão
    func buttonStyle() -> some View {
        self.font(DSTypography.button)
    }
    
    /// Aplica o estilo de tag
    func tagStyle() -> some View {
        self.font(DSTypography.tag)
    }
    
    /// Aplica o estilo de eyebrow com transformações
    func eyebrowStyle() -> some View {
        self.font(DSTypography.eyebrow)
            .textCase(.uppercase)
            .kerning(0.5)
            .foregroundColor(DSColors.Neutral.textSecondary)
    }
    
    /// Aplica o estilo de título de card
    func cardTitleStyle() -> some View {
        self.font(DSTypography.cardTitle)
            .lineSpacing(-2)
            .kerning(-0.5)
    }
    
    /// Aplica o estilo de texto de lista
    func listTextStyle() -> some View {
        self.font(DSTypography.listText)
            .lineSpacing(3)
            .kerning(-0.14)
    }
}
