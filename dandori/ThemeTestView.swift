import SwiftUI

struct ThemeTestView: View {
    @StateObject private var themeManager = DSThemeManager.shared
    
    var body: some View {
        VStack(spacing: DS.Spacing.componentLG) {
            Text("Teste de Reatividade do Tema")
                .font(DS.Typography.headingLarge.font)
                .foregroundColor(DS.Colors.Content.primary)
            
            // Test card que deve mudar de cor
            VStack(spacing: DS.Spacing.componentSM) {
                Text("Cor Accent:")
                    .font(DS.Typography.bodyMedium.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                
                Rectangle()
                    .fill(DS.Colors.Accent.base)
                    .frame(height: 60)
                    .cornerRadius(DS.Radius.medium)
                
                Text("Cor Light:")
                    .font(DS.Typography.bodyMedium.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                
                Rectangle()
                    .fill(DS.Colors.Accent.light)
                    .frame(height: 60)
                    .cornerRadius(DS.Radius.medium)
            }
            .padding(DS.Spacing.componentMD)
            .background(DS.Colors.Surface.secondary)
            .cornerRadius(DS.Radius.medium)
            
            // Botões de teste
            VStack(spacing: DS.Spacing.componentSM) {
                DandoriButton("Tema Sage") {
                    themeManager.setTheme(DSSageTheme())
                }
                .dandoriButtonVariant(.primary)
                
                DandoriButton("Tema Teal") {
                    themeManager.setTheme(DSTealTheme())
                }
                .dandoriButtonVariant(.secondary)
                
                DandoriButton("Tema Turquoise") {
                    themeManager.setTheme(DSTurquoiseTheme())
                }
                .dandoriButtonVariant(.ghost)
            }
            
            Spacer()
        }
        .padding(DS.Spacing.componentLG)
        .background(DS.Colors.Surface.primary)
    }
}

#Preview {
    DSThemeRoot(theme: DSSageTheme()) {
        ThemeTestView()
    }
}
