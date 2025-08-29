import SwiftUI

/// Showcase completo do Design System
/// Demonstra tokens, componentes e exemplos práticos de uso
struct DSShowcase: View {
    @StateObject private var themeProvider = DSThemeProvider()
    @State private var selectedTab = 0
    
    var body: some View {
        DSThemeRoot {
            NavigationView {
                VStack(spacing: 0) {
                    // Tab Selector
                    tabSelector
                    
                    // Content
                    TabView(selection: $selectedTab) {
                        // Tokens & Components
                        tokensAndComponentsView
                            .tag(0)
                        
                        // Theme Examples
                        themeExamplesView
                            .tag(1)
                        
                        // Best Practices
                        bestPracticesView
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .navigationTitle("Design System")
                .background(DS.Colors.Surface.primary)
            }
        }
    }
    
    // MARK: - Tab Selector
    
    private var tabSelector: some View {
        HStack(spacing: 0) {
            ForEach(Array(zip(["Tokens", "Temas", "Práticas"], 0..<3)), id: \.1) { title, index in
                Button(action: { selectedTab = index }) {
                    DS.Text.create(title, variant: .button, 
                                 color: selectedTab == index ? .accent : .secondary)
                        .padding(.vertical, DS.Spacing.elementMD)
                        .frame(maxWidth: .infinity)
                        .background(
                            selectedTab == index ? 
                            DS.Colors.Interactive.secondary : Color.clear
                        )
                }
            }
        }
        .background(DS.Colors.Surface.secondary)
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.medium))
        .padding(.horizontal, DS.Spacing.componentMD)
        .padding(.bottom, DS.Spacing.elementMD)
    }
    
    // MARK: - Tokens and Components View
    
    private var tokensAndComponentsView: some View {
        ScrollView {
            LazyVStack(spacing: DS.Spacing.componentLG) {
                themeSelector
                colorsSection
                typographySection
                spacingSection
                componentsSection
            }
            .dsLayoutPadding()
        }
    }
    
    // MARK: - Theme Examples View
    
    private var themeExamplesView: some View {
        DSThemeExampleView()
            .environmentObject(themeProvider)
    }
    
    // MARK: - Best Practices View
    
    private var bestPracticesView: some View {
        DSThemeBestPracticesDemo()
            .environmentObject(themeProvider)
    }
    
    // MARK: - Theme Selector
    
    private var themeSelector: some View {
        DandoriCard(variant: .default, size: .standard) {
            VStack(alignment: .leading, spacing: DS.Spacing.elementLG) {
                DS.Text.create("Tema", variant: .headingSmall)
                
                HStack(spacing: DS.Spacing.elementMD) {
                    ForEach(AccentType.allCases) { accent in
                        Button {
                            themeProvider.setAccent(accent)
                        } label: {
                            Circle()
                                .fill(accent.token.base)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Circle()
                                        .stroke(DS.Colors.Border.focus, lineWidth: themeProvider.currentAccent == accent ? 2 : 0)
                                )
                        }
                    }
                }
            }
        }
        .environmentObject(themeProvider)
    }
    
    // MARK: - Colors Section
    
    private var colorsSection: some View {
        DandoriCard(variant: .default, size: .standard) {
            VStack(alignment: .leading, spacing: DS.Spacing.componentSM) {
                DS.Text.create("Cores", variant: .headingSmall)
                
                colorGroup("Surface", colors: [
                    ("Primary", DS.Colors.Surface.primary),
                    ("Secondary", DS.Colors.Surface.secondary),
                    ("Tertiary", DS.Colors.Surface.tertiary)
                ])
                
                colorGroup("Content", colors: [
                    ("Primary", DS.Colors.Content.primary),
                    ("Secondary", DS.Colors.Content.secondary),
                    ("Inverse", DS.Colors.Content.inverse)
                ])
                
                colorGroup("Border", colors: [
                    ("Default", DS.Colors.Border.default),
                    ("Focus", DS.Colors.Border.focus)
                ])
                
                colorGroup("Interactive", colors: [
                    ("Primary", DS.Colors.Interactive.primary),
                    ("Primary Hover", DS.Colors.Interactive.primaryHover),
                    ("Secondary", DS.Colors.Interactive.secondary),
                    ("Secondary Hover", DS.Colors.Interactive.secondaryHover)
                ])
            }
        }
    }
    
    private func colorGroup(_ title: String, colors: [(String, Color)]) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing.elementSM) {
            DS.Text.create(title, variant: .label, color: .secondary)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: DS.Spacing.elementSM) {
                ForEach(colors, id: \.0) { name, color in
                    HStack {
                        Rectangle()
                            .fill(color)
                            .frame(width: 20, height: 20)
                            .clipShape(RoundedRectangle(cornerRadius: DS.Radius.small))
                        
                        DS.Text.create(name, variant: .bodySmall)
                        
                        Spacer()
                    }
                }
            }
        }
    }
    
    // MARK: - Typography Section
    
    private var typographySection: some View {
        DandoriCard(variant: .default, size: .standard) {
            VStack(alignment: .leading, spacing: DS.Spacing.componentSM) {
                DS.Text.create("Tipografia", variant: .headingSmall)
                
                VStack(alignment: .leading, spacing: DS.Spacing.elementLG) {
                    DS.Text.create("Display XL Hero", variant: .displayXL)
                    DS.Text.create("Display Text", variant: .display)
                    DS.Text.create("Heading Large", variant: .headingLarge)
                    DS.Text.create("Heading Medium", variant: .headingMedium)
                    DS.Text.create("Heading Small", variant: .headingSmall)
                    DS.Text.create("Body Large", variant: .bodyLarge)
                    DS.Text.create("Body Medium", variant: .bodyMedium)
                    DS.Text.create("Body Small", variant: .bodySmall)
                    DS.Text.create("Button Text", variant: .button)
                    DS.Text.create("Label Text", variant: .label)
                    DS.Text.create("Caption Text", variant: .caption)
                }
            }
        }
    }
    
    // MARK: - Spacing Section
    
    private var spacingSection: some View {
        DandoriCard(variant: .default, size: .standard) {
            VStack(alignment: .leading, spacing: DS.Spacing.componentSM) {
                DS.Text.create("Espaçamento", variant: .headingSmall)
                
                VStack(alignment: .leading, spacing: DS.Spacing.elementMD) {
                    spacingExample("Element XS", DS.Spacing.elementXS)
                    spacingExample("Element SM", DS.Spacing.elementSM)
                    spacingExample("Element MD", DS.Spacing.elementMD)
                    spacingExample("Element LG", DS.Spacing.elementLG)
                    spacingExample("Element XL", DS.Spacing.elementXL)
                    spacingExample("Component SM", DS.Spacing.componentSM)
                    spacingExample("Component MD", DS.Spacing.componentMD)
                    spacingExample("Component LG", DS.Spacing.componentLG)
                    spacingExample("Component XL", DS.Spacing.componentXL)
                }
            }
        }
    }
    
    private func spacingExample(_ name: String, _ spacing: CGFloat) -> some View {
        HStack {
            DS.Text.create(name, variant: .bodySmall)
            
            Rectangle()
                .fill(DS.Colors.Interactive.primary)
                .frame(width: spacing, height: 16)
            
            DS.Text.create("\(Int(spacing))pt", variant: .caption, color: .secondary)
            
            Spacer()
        }
    }
    
    // MARK: - Components Section
    
    private var componentsSection: some View {
        DandoriCard(variant: .default, size: .standard) {
            VStack(alignment: .leading, spacing: DS.Spacing.componentSM) {
                DS.Text.create("Componentes", variant: .headingSmall)
                
                VStack(spacing: DS.Spacing.elementLG) {
                    buttonExamples
                    tagExamples
                    cardExample
                }
            }
        }
    }
    
    private var buttonExamples: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.elementMD) {
            DS.Text.create("Botões", variant: .label, color: .secondary)
            
            VStack(spacing: DS.Spacing.elementSM) {
                DandoriButton("Primary Button", variant: .primary) { }
                DandoriButton("Secondary Button", variant: .secondary) { }
                DandoriButton("Tertiary Button", variant: .tertiary) { }
                DandoriButton(
                    title: "Disabled Button",
                    icon: nil,
                    variant: .primary,
                    size: .medium,
                    state: .disabled
                ) { }
            }
        }
    }
    
    private var tagExamples: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.elementMD) {
            DS.Text.create("Tags", variant: .label, color: .secondary)
            
            HStack(spacing: DS.Spacing.elementSM) {
                DS.Tag.create("Accent", variant: .accent)
                DS.Tag.create("Neutral", variant: .neutral)
                DS.Tag.create("Outlined", variant: .outlined)
            }
        }
    }
    
    private var cardExample: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.elementMD) {
            DS.Text.create("Cards", variant: .label, color: .secondary)
            
            DandoriCard(variant: .outlined, size: .standard) {
                VStack(alignment: .leading, spacing: DS.Spacing.elementMD) {
                    DS.Text.create("Card Title", variant: .headingSmall)
                    DS.Text.create("Card content with some text to demonstrate the card component.", variant: .bodyMedium)
                    
                    HStack {
                        DS.Tag.create("Tag 1", variant: .accent)
                        DS.Tag.create("Tag 2", variant: .neutral)
                        Spacer()
                    }
                }
            }
        }
    }
}

// MARK: - Theme Examples View

/// View principal mostrando integração de temas
struct DSThemeExampleView: View {
    @EnvironmentObject private var themeProvider: DSThemeProvider
    @Environment(\.colorScheme) private var colorScheme
    
    private var theme: DSTheme { themeProvider.currentTheme }
    
    var body: some View {
        ScrollView {
            VStack(spacing: theme.spacing.componentMD) {
                // Header Section
                headerSection
                
                // Theme Controls
                themeControlsSection
                
                // Color Demonstration
                colorDemonstrationSection
                
                // Typography Demonstration
                typographyDemonstrationSection
                
                // Custom Components Examples
                customComponentsSection
            }
            .padding(theme.spacing.componentMD)
            .background(theme.colors.surface.primary)
            .onChange(of: colorScheme) { _, newColorScheme in
                themeProvider.setColorScheme(newColorScheme)
            }
        }
    }
    
    // MARK: - View Sections
    
    private var headerSection: some View {
        VStack(spacing: theme.spacing.elementMD) {
            Text("Design System Theme")
                .font(theme.typography.display.font)
                .foregroundColor(theme.colors.content.primary)
            
            Text("Demonstração do sistema de temas refatorado")
                .font(theme.typography.bodyLarge.font)
                .foregroundColor(theme.colors.content.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.accent.light)
        .cornerRadius(theme.radius.medium)
    }
    
    private var themeControlsSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementLG) {
            Text("Theme Controls")
                .font(theme.typography.headingMedium.font)
                .foregroundColor(theme.colors.content.primary)
            
            // Accent Selector
            VStack(alignment: .leading, spacing: theme.spacing.elementSM) {
                Text("Accent Color")
                    .font(theme.typography.label.font)
                    .foregroundColor(theme.colors.content.secondary)
                
                Picker("Accent Color", selection: $themeProvider.currentAccent) {
                    ForEach(themeProvider.availableAccents) { accent in
                        Text(accent.displayName)
                            .tag(accent)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            // Current Theme Info
            themeInfoSection
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.surface.secondary)
        .cornerRadius(theme.radius.medium)
    }
    
    private var themeInfoSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementSM) {
            Text("Current Theme Info")
                .font(theme.typography.label.font)
                .foregroundColor(theme.colors.content.secondary)
            
            HStack {
                infoItem("ID", value: theme.identifier)
                Spacer()
                infoItem("Name", value: theme.displayName)
                Spacer()
                infoItem("Accent", value: themeProvider.currentAccent.displayName)
            }
        }
    }
    
    private func infoItem(_ label: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(label)
                .font(theme.typography.caption.font)
                .foregroundColor(theme.colors.content.secondary)
            
            Text(value)
                .font(theme.typography.bodySmall.font)
                .foregroundColor(theme.colors.content.primary)
        }
    }
    
    private var colorDemonstrationSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementLG) {
            Text("Color System")
                .font(theme.typography.headingMedium.font)
                .foregroundColor(theme.colors.content.primary)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: theme.spacing.elementMD) {
                colorSample("Accent Base", color: theme.colors.accent.base)
                colorSample("Accent Light", color: theme.colors.accent.light)
                colorSample("Content Primary", color: theme.colors.content.primary)
                colorSample("Surface Primary", color: theme.colors.surface.primary)
                colorSample("Surface Secondary", color: theme.colors.surface.secondary)
                colorSample("Interactive Primary", color: theme.colors.interactive.primary)
            }
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.surface.secondary)
        .cornerRadius(theme.radius.medium)
    }
    
    private func colorSample(_ name: String, color: Color) -> some View {
        VStack(spacing: theme.spacing.elementSM) {
            RoundedRectangle(cornerRadius: theme.radius.small)
                .fill(color)
                .frame(height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: theme.radius.small)
                        .stroke(theme.colors.border.default, lineWidth: 1)
                )
            
            Text(name)
                .font(theme.typography.caption.font)
                .foregroundColor(theme.colors.content.secondary)
                .multilineTextAlignment(.center)
        }
    }
    
    private var typographyDemonstrationSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementLG) {
            Text("Typography System")
                .font(theme.typography.headingMedium.font)
                .foregroundColor(theme.colors.content.primary)
            
            VStack(alignment: .leading, spacing: theme.spacing.elementMD) {
                typographySample("Display XL", font: theme.typography.displayXL.font)
                typographySample("Display", font: theme.typography.display.font)
                typographySample("Heading Large", font: theme.typography.headingLarge.font)
                typographySample("Heading Medium", font: theme.typography.headingMedium.font)
                typographySample("Body Large", font: theme.typography.bodyLarge.font)
                typographySample("Body Medium", font: theme.typography.bodyMedium.font)
                typographySample("Button Text", font: theme.typography.button.font)
                typographySample("Caption", font: theme.typography.caption.font)
            }
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.surface.secondary)
        .cornerRadius(theme.radius.medium)
    }
    
    private func typographySample(_ name: String, font: Font) -> some View {
        HStack {
            Text(name)
                .font(theme.typography.label.font)
                .foregroundColor(theme.colors.content.secondary)
                .frame(width: 120, alignment: .leading)
            
            Text("Sample Text")
                .font(font)
                .foregroundColor(theme.colors.content.primary)
            
            Spacer()
        }
    }
    
    private var customComponentsSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementLG) {
            Text("Custom Components")
                .font(theme.typography.headingMedium.font)
                .foregroundColor(theme.colors.content.primary)
            
            VStack(spacing: theme.spacing.elementLG) {
                // Themed Buttons
                HStack(spacing: theme.spacing.elementMD) {
                    DSThemedButton(title: "Primary", action: {}, style: .primary)
                    DSThemedButton(title: "Secondary", action: {}, style: .secondary)
                    DSThemedButton(title: "Accent", action: {}, style: .accent)
                }
                
                // Themed Card
                DSThemedCard {
                    VStack(alignment: .leading, spacing: theme.spacing.elementMD) {
                        Text("Themed Card")
                            .font(theme.typography.headingSmall.font)
                            .foregroundColor(theme.colors.content.primary)
                        
                        Text("This card uses the theme system properly for all styling decisions.")
                            .font(theme.typography.bodyMedium.font)
                            .foregroundColor(theme.colors.content.secondary)
                    }
                }
            }
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.surface.secondary)
        .cornerRadius(theme.radius.medium)
    }
}

// MARK: - Best Practices Demo

/// Demonstra boas práticas para uso do tema
struct DSThemeBestPracticesDemo: View {
    @EnvironmentObject private var themeProvider: DSThemeProvider
    private var theme: DSTheme { themeProvider.currentTheme }
    
    var body: some View {
        ScrollView {
            VStack(spacing: theme.spacing.componentMD) {
                // Header
                headerSection
                
                // Good Example
                goodExample
                
                // Bad Example (for reference)
                badExampleReference
                
                // Guidelines
                guidelinesSection
            }
            .padding(theme.spacing.componentMD)
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: theme.spacing.elementMD) {
            Text("Boas Práticas")
                .font(theme.typography.display.font)
                .foregroundColor(theme.colors.content.primary)
            
            Text("Como usar o sistema de temas corretamente")
                .font(theme.typography.bodyLarge.font)
                .foregroundColor(theme.colors.content.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.accent.light)
        .cornerRadius(theme.radius.medium)
    }
    
    private var goodExample: some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementMD) {
            Text("✅ Boa Prática")
                .font(theme.typography.headingMedium.font)
                .foregroundColor(theme.colors.accent.base)
            
            Text("Sempre use o theme para styling:")
                .font(theme.typography.bodyMedium.font)
                .foregroundColor(theme.colors.content.primary)
            
            VStack(alignment: .leading, spacing: theme.spacing.elementSM) {
                Text("• theme.colors.content.primary")
                Text("• theme.typography.bodyMedium.font")
                Text("• theme.spacing.componentMD")
                Text("• theme.radius.medium")
            }
            .font(theme.typography.bodySmall.font)
            .foregroundColor(theme.colors.content.secondary)
            
            DSThemedButton(title: "Themed Button", action: {}, style: .accent)
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.surface.secondary)
        .cornerRadius(theme.radius.medium)
    }
    
    private var badExampleReference: some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementMD) {
            Text("❌ Má Prática")
                .font(theme.typography.headingMedium.font)
                .foregroundColor(Color.red)
            
            Text("Evite:")
                .font(theme.typography.bodyMedium.font)
                .foregroundColor(theme.colors.content.primary)
            
            VStack(alignment: .leading, spacing: theme.spacing.elementSM) {
                Text("• DSTokens.Colors.Content.primary")
                Text("• Color.blue (hardcoded)")
                Text("• .padding(16) (hardcoded)")
                Text("• Acessar tokens diretamente")
            }
            .font(theme.typography.bodySmall.font)
            .foregroundColor(theme.colors.content.secondary)
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.surface.secondary)
        .cornerRadius(theme.radius.medium)
    }
    
    private var guidelinesSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementLG) {
            Text("Diretrizes")
                .font(theme.typography.headingMedium.font)
                .foregroundColor(theme.colors.content.primary)
            
            VStack(alignment: .leading, spacing: theme.spacing.elementMD) {
                guidelineItem("1. Sempre injete DSThemeProvider", 
                            "Use @EnvironmentObject private var themeProvider")
                
                guidelineItem("2. Acesse tema via computed property", 
                            "private var theme: DSTheme { themeProvider.currentTheme }")
                
                guidelineItem("3. Use theme para todos os estilos", 
                            "theme.colors, theme.typography, theme.spacing")
                
                guidelineItem("4. Responda a mudanças de tema", 
                            "O sistema atualiza automaticamente")
            }
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.surface.secondary)
        .cornerRadius(theme.radius.medium)
    }
    
    private func guidelineItem(_ title: String, _ description: String) -> some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementSM) {
            Text(title)
                .font(theme.typography.bodyMedium.font)
                .foregroundColor(theme.colors.content.primary)
            
            Text(description)
                .font(theme.typography.bodySmall.font)
                .foregroundColor(theme.colors.content.secondary)
        }
    }
}

// MARK: - Custom Themed Components

/// Exemplo de botão customizado usando o sistema de temas
struct DSThemedButton: View {
    let title: String
    let action: () -> Void
    let style: ButtonStyle
    
    @EnvironmentObject private var themeProvider: DSThemeProvider
    private var theme: DSTheme { themeProvider.currentTheme }
    
    enum ButtonStyle {
        case primary
        case secondary
        case accent
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(theme.typography.button.font)
                .foregroundColor(foregroundColor)
                .padding(.horizontal, theme.spacing.elementLG)
                .padding(.vertical, theme.spacing.elementMD)
                .background(backgroundColor)
                .cornerRadius(theme.radius.medium)
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .primary:
            return theme.colors.interactive.primary
        case .secondary:
            return theme.colors.surface.secondary
        case .accent:
            return theme.colors.accent.base
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .primary:
            return theme.colors.content.inverse
        case .secondary:
            return theme.colors.content.primary
        case .accent:
            return theme.colors.accent.text
        }
    }
}

/// Exemplo de card customizado usando o sistema de temas
struct DSThemedCard<Content: View>: View {
    let content: Content
    
    @EnvironmentObject private var themeProvider: DSThemeProvider
    private var theme: DSTheme { themeProvider.currentTheme }
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(theme.spacing.componentSM)
            .background(theme.colors.surface.primary)
            .cornerRadius(theme.radius.large)
            .shadow(
                color: theme.colors.content.primary.opacity(0.1),
                radius: theme.spacing.elementSM,
                x: 0,
                y: theme.spacing.elementXS
            )
    }
}

// MARK: - Preview

#if DEBUG
struct DSShowcase_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Light mode preview
            DSShowcase()
                .preferredColorScheme(.light)
                .previewDisplayName("Light Mode")
            
            // Dark mode preview
            DSShowcase()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
#endif