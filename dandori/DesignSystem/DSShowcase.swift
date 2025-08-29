import SwiftUI

/// Showcase interativo do Design System refatorado
/// Demonstra todos os tokens e componentes organizados
struct DSShowcase: View {
    @StateObject private var themeProvider = DSThemeProvider()
    
    var body: some View {
        DSThemeRoot {
            NavigationView {
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
                .navigationTitle("Design System")
                .background(DS.Colors.Surface.primary)
            }
        }
    }
    
    // MARK: - Theme Selector
    
    private var themeSelector: some View {
        DS.Card.create {
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
        DS.Card.create {
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
        DS.Card.create {
            VStack(alignment: .leading, spacing: DS.Spacing.componentSM) {
                DS.Text.create("Tipografia", variant: .headingSmall)
                
                VStack(alignment: .leading, spacing: DS.Spacing.elementLG) {
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
        DS.Card.create {
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
        DS.Card.create {
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
                DS.Button.create("Primary Button", variant: .primary) { }
                DS.Button.create("Secondary Button", variant: .secondary) { }
                DS.Button.create("Tertiary Button", variant: .tertiary) { }
                DS.Button.create("Disabled Button", variant: .primary, state: .disabled) { }
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
            
            DS.Card.create(variant: .outlined) {
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

#if DEBUG
struct DSShowcase_Previews: PreviewProvider {
    static var previews: some View {
        DSShowcase()
    }
}
#endif