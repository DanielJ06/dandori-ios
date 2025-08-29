import SwiftUI

// MARK: - Practical Usage Examples

/// Example app demonstrating proper DSTheme usage
struct DSThemeExampleApp: App {
    @StateObject private var themeProvider = DSThemeProvider(accent: .teal)
    
    var body: some Scene {
        WindowGroup {
            DSThemeExampleView()
                .dsThemeProvider(themeProvider)
        }
    }
}

/// Main example view showing theme integration
struct DSThemeExampleView: View {
    @EnvironmentObject private var themeProvider: DSThemeProvider
    @Environment(\.colorScheme) private var colorScheme
    
    private var theme: DSTheme { themeProvider.currentTheme }
    
    var body: some View {
        NavigationView {
            VStack(spacing: theme.spacing.componentMD) {
                // Header Section
                headerSection
                
                // Theme Controls
                themeControlsSection
                
                // Color Demonstration
                colorDemonstrationSection
                
                // Typography Demonstration
                typographyDemonstrationSection
                
                Spacer()
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
}

// MARK: - Component Usage Examples

/// Example of a custom component using the theme system properly
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

/// Example of a themed card component
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

struct DSThemeExampleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Light mode preview
            DSThemeExampleView()
                .dsThemeProvider(DSThemeProvider(accent: .teal))
                .preferredColorScheme(.light)
                .previewDisplayName("Light Mode")
            
            // Dark mode preview
            DSThemeExampleView()
                .dsThemeProvider(DSThemeProvider(accent: .sage))
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
            
            // Different accent preview
            DSThemeExampleView()
                .dsThemeProvider(DSThemeProvider(accent: .turquoise))
                .preferredColorScheme(.light)
                .previewDisplayName("Turquoise Accent")
        }
    }
}

// MARK: - Usage Best Practices Demo

/// Demonstrates best practices for theme usage
struct DSThemeBestPracticesDemo: View {
    @EnvironmentObject private var themeProvider: DSThemeProvider
    private var theme: DSTheme { themeProvider.currentTheme }
    
    var body: some View {
        VStack(spacing: theme.spacing.componentMD) {
            // ✅ Good: Using theme for all styling
            goodExample
            
            // ❌ Bad: Direct token access (don't do this)
            // badExampleCommented
        }
    }
    
    private var goodExample: some View {
        VStack(alignment: .leading, spacing: theme.spacing.elementMD) {
            Text("✅ Good Practice")
                .font(theme.typography.headingMedium.font)
                .foregroundColor(theme.colors.accent.base)
            
            Text("All styling goes through the theme")
                .font(theme.typography.bodyMedium.font)
                .foregroundColor(theme.colors.content.primary)
            
            DSThemedButton(title: "Themed Button", action: {}, style: .accent)
        }
        .padding(theme.spacing.componentSM)
        .background(theme.colors.surface.secondary)
        .cornerRadius(theme.radius.medium)
    }
    
    // Example of what NOT to do (commented for reference):
    /*
    private var badExample: some View {
        VStack {
            // ❌ Don't access tokens directly
            Text("Bad Practice")
                .foregroundColor(DSTokens.Colors.Content.primary)
            
            // ❌ Don't hardcode colors
            Text("Hardcoded")
                .foregroundColor(.blue)
            
            // ❌ Don't hardcode spacing
            Text("Fixed spacing")
                .padding(16)
        }
    }
    */
}
