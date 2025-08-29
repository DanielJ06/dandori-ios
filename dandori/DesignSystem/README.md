# Design System Dandori - Tokens

## ✅ Status da Implementação

O Design System Dandori foi reestruturado para focar exclusivamente nos tokens fundamentais, proporcionando uma base sólida e consolidada para futuras implementações de componentes.

---

## 📁 Estrutura de Arquivos

```
dandori/DesignSystem/
├── DS.swift                          # Namespace principal e ThemeManager
├── DSShowcase.swift                  # Showcase interativo dos tokens
└── Tokens/
    ├── AccentColor.swift            # Enum para acentos dinâmicos
    ├── AccentEnvironment.swift      # Environment para acentos
    ├── DSColors.swift               # Cores neutras e de estado
    ├── DSSpacing.swift              # Espaçamentos e radius
    └── DSTypography.swift           # Tipografia e estilos
```

---

## 🎨 Tokens Implementados

### Cores
- **Acentos Dinâmicos**: `teal`, `sage`, `turquoise` com cores base, light e text
- **Cores Neutras**: Background, backgroundSecondary, text, textSecondary, border, borderFocus
- **Estados**: Success, warning, error, info
- **Suporte a Dark Mode**: Cores dinâmicas automáticas

### Tipografia
- **Fontes**: Inter (sans-serif), Merriweather (serif)
- **Estilos Predefinidos**: Button, tag, eyebrow, cardTitle, listText, body, bodySecondary
- **Pesos**: Light, regular, medium, semibold, bold
- **Tamanhos**: XS (12pt) até XXXL (30pt) + eyebrow (11pt)

### Espaçamento
- **Básicos**: XS (4pt) até XXXL (32pt)
- **Page**: Padding e gap específicos para páginas
- **Extensions**: Método `.pagePadding()` para aplicação fácil

### Border Radius
- **Básicos**: SM (6pt), MD (8pt), LG (16pt), Full (9999pt)
- **Uso**: Aplicação direta através de `DS.Radius.sm`, etc.

### Border Radius
- **Tamanhos**: SM (6pt), MD (8pt), LG (16pt), FULL (9999pt)
- **Componentes**: Card, button, tag, chip
---

## 🌈 Sistema de Temas

### AccentColor Environment
```swift
// Aplicar acento globalmente
DS.AccentProvider(accent: .sage) {
    ContentView()
}

// Usar em componentes
@Environment(\.accentColor) private var accent
```

### DSThemeManager
```swift
// Gerenciar tema globalmente
@StateObject private var themeManager = DSThemeManager.shared
themeManager.setAccent(.turquoise)
```

---

## 🚀 Como Usar

### Importação Simples
```swift
import SwiftUI

// Namespace principal para tokens
Text("Título")
    .font(DS.Typography.cardTitle)
    .foregroundColor(DS.Colors.neutral.text)
```

### Extensions Globais
```swift
VStack {
    Text("Conteúdo")
}
.dsPagePadding()
.dsCardRadius()
```

### Tokens Diretos
```swift
.foregroundColor(DS.Colors.neutral.textSecondary)
.font(DS.Typography.cardTitle)
.padding(DS.Spacing.lg)
.cornerRadius(DS.Radius.md)
```

---

## 🎯 DSShowcase

Uma view completa que demonstra todos os tokens organizados por categoria:
- **Colors**: Visualização de cores neutras e de estado
- **Typography**: Exemplos de todos os estilos tipográficos
- **Spacing**: Demonstração visual dos espaçamentos
- **Radius**: Exemplos de border radius

Permite mudança de tema em tempo real para testar diferentes acentos.

---

## ✨ Funcionalidades Especiais

### Responsividade Nativa
- Adaptação automática a diferentes tamanhos de tela
- Suporte a Dynamic Type

### Acessibilidade
- Contraste adequado em dark/light mode
- Suporte a VoiceOver

### Performance
- Tokens otimizados para performance
- Sistema leve e eficiente

### Extensibilidade
- Fácil adição de novos acentos
- Sistema de tokens expansível
- Base sólida para futuros componentes

---

## 📝 Próximos Passos Sugeridos

1. **Fontes Customizadas**: Adicionar Inter e Merriweather ao bundle
2. **Mais Tokens**: Expandir tokens conforme necessidade (shadows, borders, etc.)
3. **Componentes**: Implementar componentes baseados nos tokens consolidados
4. **Testes**: Criar testes unitários para tokens
5. **Documentação**: Expandir com guias de uso específicos

---

## 🎉 Conclusão

O Design System Dandori foi consolidado com foco nos tokens fundamentais:

- ✅ Estrutura limpa e organizadas
- ✅ Tokens bem definidos e consistentes
- ✅ Sistema de temas dinâmicos
- ✅ Base sólida para futura expansão
- ✅ Performance e acessibilidade
- ✅ Fácil manutenção e extensão

O sistema está pronto para servir como base sólida para o desenvolvimento de componentes futuros.
