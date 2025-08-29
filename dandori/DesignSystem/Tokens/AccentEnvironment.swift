import SwiftUI

/// Environment key para o acento dinâmico do app
struct AccentColorEnvironmentKey: EnvironmentKey {
    static let defaultValue: AccentColor = .teal
}

extension EnvironmentValues {
    /// Acesso ao acento dinâmico através do environment
    var accentColor: AccentColor {
        get { self[AccentColorEnvironmentKey.self] }
        set { self[AccentColorEnvironmentKey.self] = newValue }
    }
}

/// Modifier para facilitar aplicação do acento no environment
extension View {
    /// Define o acento dinâmico para a view e suas subviews
    func accentColor(_ accent: AccentColor) -> some View {
        self.environment(\.accentColor, accent)
    }
}

/// Provider que aplica o acento dinâmico em toda a hierarquia de views
struct AccentProvider<Content: View>: View {
    let accent: AccentColor
    let content: () -> Content
    
    init(accent: AccentColor, @ViewBuilder content: @escaping () -> Content) {
        self.accent = accent
        self.content = content
    }
    
    var body: some View {
        content()
            .environment(\.accentColor, accent)
    }
}
