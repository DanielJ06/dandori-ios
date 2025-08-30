import SwiftUI

// MARK: - DS Showcase

/**
 * Design System Showcase - Demonstração interativa do Dandori DS
 * 
 * Interface limpa e organizada para demonstrar tokens, componentes e temas.
 * 
 * ## ✨ Sistema de Temas Moderno (Swift Concurrency)
 * - ❌ Não precisa mais de @Environment(\.dsTheme)
 * - ✅ Acesso direto via DS.Colors.Accent.base
 * - ✅ Thread-safe com Swift Actor
 * - ✅ Zero cache - simplicidade máxima
 * - ✅ Reactivity automática do SwiftUI
 * 
 * ### Exemplos de uso:
 * ```swift
 * .foregroundColor(DS.Colors.Accent.text)
 * .background(DS.Colors.Accent.base) 
 * 
 * // Mudança de tema - duas formas
 * DSThemeManager.shared.setTheme(DSSageTheme())
 * setGlobalTheme(DSSageTheme()) // Função global
 * ```
 * 
 * ### Arquitetura interna:
 * - `ThemeState` actor - estado global thread-safe
 * - `getCurrentThemeColors()` - acesso sem cache
 * - `DSThemeManager` - wrapper para SwiftUI
 */
struct DSShowcase: View {
    @StateObject private var themeManager = DSThemeManager.shared
    @State private var selectedSection: ShowcaseSection = .tokens
    @State private var selectedThemeId: String = "sage"
    
    enum ShowcaseSection: String, CaseIterable {
        case tokens = "Tokens"
        case components = "Componentes"
        case themes = "Temas"
        
        var icon: String {
            switch self {
            case .tokens: return "paintpalette"
            case .components: return "square.grid.2x2"
            case .themes: return "slider.horizontal.3"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: .zero) {
                headerSection
                sectionSelector
                contentArea
            }
            .background(DS.Colors.Surface.primary)
        }
        .onAppear {
            // Set initial theme
            if let initialTheme = themeManager.availableThemes.first(where: { $0.identifier == selectedThemeId }) {
                themeManager.setTheme(initialTheme)
            }
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: DS.Spacing.componentMD) {
            HStack {
                VStack(alignment: .leading, spacing: DS.Spacing.elementSM) {
                    Text("Dandori Design System")
                        .font(DS.Typography.headingLarge.font)
                        .foregroundColor(DS.Colors.Content.primary)
                    
                    Text("Sistema de design interativo")
                        .font(DS.Typography.bodyMedium.font)
                        .foregroundColor(DS.Colors.Content.secondary)
                }
                
                Spacer()
                
                // Current theme indicator
                VStack(alignment: .trailing, spacing: DS.Spacing.elementSM) {
                    HStack(spacing: DS.Spacing.elementSM) {
                        Circle()
                            .fill(DS.Colors.Accent.base)
                            .frame(width: DS.Spacing.componentMD, height: DS.Spacing.componentMD)
                        
                        Text("Tema Atual")
                            .font(DS.Typography.caption.font)
                            .foregroundColor(DS.Colors.Content.secondary)
                    }
                }
            }
        }
        .padding(DS.Spacing.componentMD)
        .background(DS.Colors.Surface.secondary)
    }
    
    // MARK: - Section Selector
    
    private var sectionSelector: some View {
        HStack(spacing: DS.Spacing.componentSM) {
            ForEach(ShowcaseSection.allCases, id: \.rawValue) { section in
                Button(action: {
                    selectedSection = section
                }) {
                    HStack(spacing: DS.Spacing.elementSM) {
                        Image(systemName: section.icon)
                            .font(.system(size: DS.Typography.bodyMedium.fontSize))
                        
                        Text(section.rawValue)
                            .font(DS.Typography.bodyMedium.font)
                    }
                    .foregroundColor(selectedSection == section 
                        ? DS.Colors.Accent.text 
                        : DS.Colors.Content.secondary)
                    .padding(.horizontal, DS.Spacing.componentMD)
                    .padding(.vertical, DS.Spacing.componentSM)
                    .background(
                        RoundedRectangle(cornerRadius: DS.Radius.medium)
                            .fill(selectedSection == section 
                                ? DS.Colors.Accent.light 
                                : Color.clear)
                    )
                }
                .buttonStyle(.plain)
            }
            
            Spacer()
        }
        .padding(DS.Spacing.componentMD)
        .background(DS.Colors.Surface.primary)
    }
    
    // MARK: - Content Area
    
    private var contentArea: some View {
        ScrollView {
            VStack(spacing: DS.Spacing.componentLG) {
                switch selectedSection {
                case .tokens:
                    tokensContent
                case .components:
                    componentsContent
                case .themes:
                    themesContent
                }
            }
            .padding(DS.Spacing.componentMD)
        }
    }
    
    // MARK: - Tokens Content
    
    private var tokensContent: some View {
        VStack(spacing: DS.Spacing.componentLG) {
            // Colors
            DSShowcaseSection(title: "Cores", icon: "paintbrush") {
                colorTokensGrid
            }
            
            // Typography
            DSShowcaseSection(title: "Tipografia", icon: "textformat") {
                typographyTokens
            }
            
            // Spacing
            DSShowcaseSection(title: "Espaçamento", icon: "ruler") {
                spacingTokens
            }
            
            // Radius
            DSShowcaseSection(title: "Bordas", icon: "rectangle.roundedtop") {
                radiusTokens
            }
        }
    }
    
    private var colorTokensGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: DS.Spacing.componentSM), count: 3), 
                  spacing: DS.Spacing.componentSM) {
            // Theme colors (dynamic - now using simplified access)
            ColorTokenCard(name: "Accent", color: DS.Colors.Accent.base)
            ColorTokenCard(name: "Accent Light", color: DS.Colors.Accent.light)
            ColorTokenCard(name: "Accent Text", color: DS.Colors.Accent.text)
            
            // Surface colors (static)
            ColorTokenCard(name: "Surface Primary", color: DS.Colors.Surface.primary)
            ColorTokenCard(name: "Surface Secondary", color: DS.Colors.Surface.secondary)
            ColorTokenCard(name: "Surface Tertiary", color: DS.Colors.Surface.tertiary)
            
            // Content colors (static)
            ColorTokenCard(name: "Content Primary", color: DS.Colors.Content.primary)
            ColorTokenCard(name: "Content Secondary", color: DS.Colors.Content.secondary)
            ColorTokenCard(name: "Content Inverse", color: DS.Colors.Content.inverse)
        }
    }
    
    private var typographyTokens: some View {
        VStack(spacing: DS.Spacing.componentSM) {
            TypographyTokenCard(name: "Display XL", token: DS.Typography.displayXL)
            TypographyTokenCard(name: "Display", token: DS.Typography.display)
            TypographyTokenCard(name: "Heading Large", token: DS.Typography.headingLarge)
            TypographyTokenCard(name: "Heading Medium", token: DS.Typography.headingMedium)
            TypographyTokenCard(name: "Body Large", token: DS.Typography.bodyLarge)
            TypographyTokenCard(name: "Body Medium", token: DS.Typography.bodyMedium)
            TypographyTokenCard(name: "Caption", token: DS.Typography.caption)
        }
    }
    
    private var spacingTokens: some View {
        VStack(spacing: DS.Spacing.componentSM) {
            SpacingTokenCard(name: "Element XS", value: DS.Spacing.elementXS)
            SpacingTokenCard(name: "Element SM", value: DS.Spacing.elementSM)
            SpacingTokenCard(name: "Element MD", value: DS.Spacing.elementMD)
            SpacingTokenCard(name: "Component SM", value: DS.Spacing.componentSM)
            SpacingTokenCard(name: "Component MD", value: DS.Spacing.componentMD)
            SpacingTokenCard(name: "Component LG", value: DS.Spacing.componentLG)
        }
    }
    
    private var radiusTokens: some View {
        HStack(spacing: DS.Spacing.componentMD) {
            RadiusTokenCard(name: "Small", value: DS.Radius.small)
            RadiusTokenCard(name: "Medium", value: DS.Radius.medium)
            RadiusTokenCard(name: "Large", value: DS.Radius.large)
            RadiusTokenCard(name: "Full", value: DS.Radius.full)
        }
    }
    
    // MARK: - Components Content
    
    private var componentsContent: some View {
        VStack(spacing: DS.Spacing.componentLG) {
            DSShowcaseSection(title: "Botões", icon: "button.programmable") {
                buttonsDemo
            }
            
            DSShowcaseSection(title: "Badges", icon: "tag") {
                badgesDemo
            }
            
            DSShowcaseSection(title: "Cards", icon: "rectangle") {
                cardsDemo
            }
        }
    }
    
    private var buttonsDemo: some View {
        VStack(spacing: DS.Spacing.componentMD) {
            HStack(spacing: DS.Spacing.componentSM) {
                DandoriButton("Primary") {}
                    .dandoriButtonVariant(.primary)
                    .dandoriButtonSize(.medium)
                
                DandoriButton("Secondary") {}
                    .dandoriButtonVariant(.secondary)
                    .dandoriButtonSize(.medium)
                
                DandoriButton("Ghost") {}
                    .dandoriButtonVariant(.ghost)
                    .dandoriButtonSize(.medium)
            }
            
            HStack(spacing: DS.Spacing.componentSM) {
                DandoriButton("Small") {}
                    .dandoriButtonVariant(.primary)
                    .dandoriButtonSize(.small)
                
                DandoriButton("Medium") {}
                    .dandoriButtonVariant(.primary)
                    .dandoriButtonSize(.medium)
                
                DandoriButton("Large") {}
                    .dandoriButtonVariant(.primary)
                    .dandoriButtonSize(.large)
            }
        }
    }
    
    private var badgesDemo: some View {
        HStack(spacing: DS.Spacing.componentSM) {
            DandoriBadge("Badge", variant: .filled, size: .medium)
            DandoriBadge("Outlined", variant: .default, size: .medium)
            DandoriBadge("Small", variant: .filled, size: .small)
        }
    }
    
    private var cardsDemo: some View {
        VStack(spacing: DS.Spacing.componentMD) {
            DandoriCard(variant: .elevated, size: .standard) {
                VStack(alignment: .leading, spacing: DS.Spacing.componentSM) {
                    Text("Card Title")
                        .font(DS.Typography.headingMedium.font)
                        .foregroundColor(DS.Colors.Content.primary)
                    
                    Text("Card description with some content to demonstrate how it looks.")
                        .font(DS.Typography.bodyMedium.font)
                        .foregroundColor(DS.Colors.Content.secondary)
                }
            }
        }
    }
    
    // MARK: - Themes Content
    
    private var themesContent: some View {
        VStack(spacing: DS.Spacing.componentLG) {
            DSShowcaseSection(title: "Temas Disponíveis", icon: "paintpalette") {
                themesGrid
            }
            
            DSShowcaseSection(title: "Preview do Tema", icon: "eye") {
                themePreview
            }
            
            DSShowcaseSection(title: "Novo vs Antigo", icon: "arrow.triangle.2.circlepath") {
                comparisonDemo
            }
            
            DSShowcaseSection(title: "API Global", icon: "globe") {
                globalApiDemo
            }
        }
    }
    
    private var themesGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: DS.Spacing.componentMD), count: 2), 
                  spacing: DS.Spacing.componentMD) {
            ForEach(themeManager.availableThemes, id: \.identifier) { theme in
                ThemeCard(theme: theme, isSelected: selectedThemeId == theme.identifier) {
                    selectedThemeId = theme.identifier
                    themeManager.setTheme(theme)
                }
            }
        }
    }
    
    private var themePreview: some View {
        VStack(spacing: DS.Spacing.componentMD) {
            HStack(spacing: DS.Spacing.componentSM) {
                DandoriButton("Primary") {}
                    .dandoriButtonVariant(.primary)
                    .dandoriButtonSize(.medium)
                
                DandoriButton("Secondary") {}
                    .dandoriButtonVariant(.secondary)
                    .dandoriButtonSize(.medium)
            }
            
            DandoriCard(variant: .elevated, size: .standard) {
                VStack(alignment: .leading, spacing: DS.Spacing.componentSM) {
                    Text("Preview Card")
                        .font(DS.Typography.headingMedium.font)
                        .foregroundColor(DS.Colors.Content.primary)
                    
                    Text("Este card mostra como os componentes ficam com o tema atual.")
                        .font(DS.Typography.bodyMedium.font)
                        .foregroundColor(DS.Colors.Content.secondary)
                }
            }
        }
    }
    
    private var comparisonDemo: some View {
        VStack(spacing: DS.Spacing.componentMD) {
            // Implementação anterior
            CodeComparisonCard(
                title: "❌ Implementação Anterior",
                code: """
@Environment(\\.dsTheme) var theme

.foregroundColor(Color(theme.colors.accent.text))
.background(Color(theme.colors.accent.base))

// + Cache complexo + nonisolated(unsafe)
""",
                backgroundColor: DS.Colors.Surface.tertiary
            )
            
            // Nova implementação
            CodeComparisonCard(
                title: "✅ Nova Implementação (Actor)",
                code: """
// Sem @Environment! Sem cache!

.foregroundColor(DS.Colors.Accent.text)
.background(DS.Colors.Accent.base)

// ThemeState actor + getCurrentThemeColors()
""",
                backgroundColor: DS.Colors.Accent.light
            )
            
            // Exemplo visual lado a lado
            HStack(spacing: DS.Spacing.componentMD) {
                // Resultado é o mesmo!
                VStack(spacing: DS.Spacing.elementSM) {
                    Text("Resultado")
                        .font(DS.Typography.bodyMedium.font)
                        .foregroundColor(DS.Colors.Content.secondary)
                    
                    Text("Mesmo resultado")
                        .font(DS.Typography.button.font)
                        .foregroundColor(DS.Colors.Accent.text)
                        .padding(DS.Spacing.componentSM)
                        .background(DS.Colors.Accent.base)
                        .cornerRadius(DS.Radius.medium)
                }
                
                VStack(spacing: DS.Spacing.elementSM) {
                    Text("Código")
                        .font(DS.Typography.bodyMedium.font)
                        .foregroundColor(DS.Colors.Content.secondary)
                    
                    Text("Muito mais simples!")
                        .font(DS.Typography.button.font)
                        .foregroundColor(DS.Colors.Accent.text)
                        .padding(DS.Spacing.componentSM)
                        .background(DS.Colors.Accent.light)
                        .cornerRadius(DS.Radius.medium)
                }
            }
        }
    }
    
    private var globalApiDemo: some View {
        VStack(spacing: DS.Spacing.componentMD) {
            // Demonstração da API global
            VStack(alignment: .leading, spacing: DS.Spacing.elementMD) {
                Text("🌍 Acesso Global Simplificado")
                    .font(DS.Typography.headingMedium.font)
                    .foregroundColor(DS.Colors.Content.primary)
                
                VStack(alignment: .leading, spacing: DS.Spacing.elementSM) {
                    SimpleCodeCard(text: "getCurrentThemeColors().accent.base")
                    SimpleCodeCard(text: "setGlobalTheme(DSTealTheme())")
                    SimpleCodeCard(text: "DS.Colors.Accent.base // Usa getCurrentThemeColors()")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(DS.Spacing.componentMD)
            .background(DS.Colors.Surface.secondary)
            .cornerRadius(DS.Radius.medium)
            
            // Botões de teste da API global
            VStack(spacing: DS.Spacing.elementMD) {
                Text("🧪 Teste da API Global")
                    .font(DS.Typography.headingMedium.font)
                    .foregroundColor(DS.Colors.Content.primary)
                
                HStack(spacing: DS.Spacing.elementMD) {
                    Button("Função Global") {
                        setGlobalTheme(DSTurquoiseTheme())
                        selectedThemeId = "turquoise"
                    }
                    .font(DS.Typography.button.font)
                    .foregroundColor(DS.Colors.Content.inverse)
                    .padding(.horizontal, DS.Spacing.elementMD)
                    .padding(.vertical, DS.Spacing.elementSM)
                    .background(DS.Colors.Interactive.primary)
                    .cornerRadius(DS.Radius.medium)
                    
                    Button("Manager.shared") {
                        themeManager.setTheme(DSSageTheme())
                        selectedThemeId = "sage"
                    }
                    .font(DS.Typography.button.font)
                    .foregroundColor(DS.Colors.Accent.text)
                    .padding(.horizontal, DS.Spacing.elementMD)
                    .padding(.vertical, DS.Spacing.elementSM)
                    .background(DS.Colors.Accent.light)
                    .cornerRadius(DS.Radius.medium)
                }
            }
            .padding(DS.Spacing.componentMD)
            .background(DS.Colors.Surface.secondary)
            .cornerRadius(DS.Radius.medium)
        }
    }
}

// MARK: - Supporting Views

struct DSShowcaseSection<Content: View>: View {
    let title: String
    let icon: String
    let content: () -> Content
    
    init(title: String, icon: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: DS.Spacing.componentMD) {
            HStack {
                HStack(spacing: DS.Spacing.elementSM) {
                    Image(systemName: icon)
                        .foregroundColor(DS.Colors.Accent.base)
                        .font(.system(size: DS.Typography.headingMedium.fontSize))
                    
                    Text(title)
                        .font(DS.Typography.headingMedium.font)
                        .foregroundColor(DS.Colors.Content.primary)
                }
                
                Spacer()
            }
            
            content()
        }
        .padding(DS.Spacing.componentMD)
        .background(DS.Colors.Surface.secondary)
        .cornerRadius(DS.Radius.medium)
    }
}

struct ColorTokenCard: View {
    let name: String
    let color: Color
    
    var body: some View {
        VStack(spacing: DS.Spacing.elementSM) {
            RoundedRectangle(cornerRadius: DS.Radius.small)
                .fill(color)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: DS.Radius.small)
                        .stroke(DS.Colors.Border.default, lineWidth: 1)
                )
            
            Text(name)
                .font(DS.Typography.caption.font)
                .foregroundColor(DS.Colors.Content.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

struct TypographyTokenCard: View {
    let name: String
    let token: TypographyToken
    
    var body: some View {
        HStack {
            Text(name)
                .font(DS.Typography.bodySmall.font)
                .foregroundColor(DS.Colors.Content.secondary)
                .frame(width: 120, alignment: .leading)
            
            Text("Sample Text")
                .font(token.font)
                .foregroundColor(DS.Colors.Content.primary)
            
            Spacer()
        }
        .padding(DS.Spacing.componentSM)
        .background(DS.Colors.Surface.primary)
        .cornerRadius(DS.Radius.small)
    }
}

struct SpacingTokenCard: View {
    let name: String
    let value: CGFloat
    
    var body: some View {
        HStack {
            Text(name)
                .font(DS.Typography.bodySmall.font)
                .foregroundColor(DS.Colors.Content.secondary)
                .frame(width: 100, alignment: .leading)
            
            Rectangle()
                .fill(DS.Colors.Accent.base)
                .frame(width: value, height: DS.Spacing.elementLG)
                .cornerRadius(DS.Radius.small)
            
            Text("\(Int(value))pt")
                .font(DS.Typography.caption.font)
                .foregroundColor(DS.Colors.Content.secondary)
            
            Spacer()
        }
        .padding(DS.Spacing.componentSM)
        .background(DS.Colors.Surface.primary)
        .cornerRadius(DS.Radius.small)
    }
}

struct RadiusTokenCard: View {
    let name: String
    let value: CGFloat
    
    var body: some View {
        VStack(spacing: DS.Spacing.elementSM) {
            RoundedRectangle(cornerRadius: value)
                .fill(DS.Colors.Surface.primary)
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: value)
                        .stroke(DS.Colors.Border.default, lineWidth: 2)
                )
            
            Text(name)
                .font(DS.Typography.caption.font)
                .foregroundColor(DS.Colors.Content.secondary)
        }
    }
}

struct ThemeCard: View {
    let theme: DSTheme
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: DS.Spacing.componentSM) {
                HStack(spacing: DS.Spacing.elementSM) {
                    Circle()
                        .fill(Color(theme.colors.accent.base))
                        .frame(width: DS.Spacing.componentMD, height: DS.Spacing.componentMD)
                    
                    Text(theme.displayName)
                        .font(DS.Typography.bodyMedium.font)
                        .foregroundColor(DS.Colors.Content.primary)
                    
                    Spacer()
                    
                    if isSelected {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color(theme.colors.accent.base))
                    }
                }
                
                // Color preview
                HStack(spacing: DS.Spacing.elementXS) {
                    Rectangle()
                        .fill(Color(theme.colors.accent.base))
                        .frame(height: DS.Spacing.elementLG)
                    Rectangle()
                        .fill(Color(theme.colors.accent.light))
                        .frame(height: DS.Spacing.elementLG)
                    Rectangle()
                        .fill(Color(theme.colors.accent.text))
                        .frame(height: DS.Spacing.elementLG)
                }
                .cornerRadius(DS.Radius.small)
            }
            .padding(DS.Spacing.componentMD)
            .background(
                RoundedRectangle(cornerRadius: DS.Radius.medium)
                    .fill(DS.Colors.Surface.primary)
                    .overlay(
                        RoundedRectangle(cornerRadius: DS.Radius.medium)
                            .stroke(isSelected ? Color(theme.colors.accent.base) : DS.Colors.Border.default, 
                                   lineWidth: isSelected ? 2 : 1)
                    )
            )
        }
        .buttonStyle(.plain)
    }
}

struct CodeComparisonCard: View {
    let title: String
    let code: String
    let backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.elementMD) {
            Text(title)
                .font(DS.Typography.headingSmall.font)
                .foregroundColor(DS.Colors.Content.primary)
            
            Text(code)
                .font(.system(.caption, design: .monospaced))
                .foregroundColor(DS.Colors.Content.primary)
                .padding(DS.Spacing.componentSM)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(backgroundColor)
                .cornerRadius(DS.Radius.small)
        }
        .padding(DS.Spacing.componentSM)
        .background(DS.Colors.Surface.primary)
        .cornerRadius(DS.Radius.medium)
    }
}

struct SimpleCodeCard: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(.caption, design: .monospaced))
            .foregroundColor(DS.Colors.Accent.text)
            .padding(.horizontal, DS.Spacing.elementSM)
            .padding(.vertical, DS.Spacing.elementXS)
            .background(DS.Colors.Accent.light)
            .clipShape(RoundedRectangle(cornerRadius: DS.Radius.small))
    }
}

// MARK: - Preview

#Preview {
    DSThemeRoot(theme: DSSageTheme()) {
        DSShowcase()
    }
}
