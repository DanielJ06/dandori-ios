# Guia para Criação de Componentes SwiftUI Escaláveis e Clean (Dandori)

Este guia define o padrão recomendado para construção de **componentes UI puros** em SwiftUI, alinhados com as melhores práticas Apple e Clean Code, considerando as seguintes diretrizes:

- **Componentes são puramente UI:** Não possuem ViewModel ou lógica de negócio; recebem apenas props/bindings necessários.
- **Ações e estados são gerenciados na tela (View/ViewModel)**, nunca dentro do componente.
- **Estilização global via EnvironmentValues:** Permite alterar estilos de vários componentes ao mesmo tempo (ex: `.dandoriButtonAppearance(.outline)`).
- **Layout centralizado:** Cada componente pode ter um arquivo `Layout` (ex: `DandoriButtonLayout.swift`) para centralizar toda a lógica visual (colors, spacings, fontes, etc), deixando o arquivo principal da view mais clean.
- **Escalabilidade e Clean Code**: Modularidade, clareza, preview, testabilidade, acessibilidade.

---

## 1. Estrutura Básica do Componente

```swift
import SwiftUI

struct DandoriButton: View {
    let title: String
    let icon: Image?
    let action: () -> Void
    var style: DandoriButtonStyle = .filled

    @Environment(\.dandoriButtonAppearance) private var envStyle

    private var layout: DandoriButtonLayout {
        DandoriButtonLayout(style: envStyle ?? style)
    }

    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon { icon }
                Text(title)
            }
            .padding(.vertical, layout.verticalPadding)
            .padding(.horizontal, layout.horizontalPadding)
            .background(layout.backgroundColor)
            .foregroundColor(layout.foregroundColor)
            .cornerRadius(layout.cornerRadius)
        }
        .buttonStyle(.plain)
        .modifier(layout.modifier)
        .accessibilityLabel(Text(title))
    }
}
```

---

## 2. Arquivo de Layout (Exemplo: `DandoriButtonLayout.swift`)

```swift
import SwiftUI

struct DandoriButtonLayout {
    let style: DandoriButtonStyle

    var backgroundColor: Color {
        switch style {
        case .filled: return DSTokens.Colors.accent
        case .outline: return DSTokens.Colors.surfacePrimary
        }
    }

    var foregroundColor: Color {
        switch style {
        case .filled: return DSTokens.Colors.onAccent
        case .outline: return DSTokens.Colors.accent
        }
    }

    var verticalPadding: CGFloat { DSTokens.Spacing.md }
    var horizontalPadding: CGFloat { DSTokens.Spacing.lg }
    var cornerRadius: CGFloat { DSTokens.Radius.xl }

    var modifier: some ViewModifier {
        // Adicione aqui outros modificadores padrão para o botão, se necessário
        EmptyModifier()
    }
}

private struct EmptyModifier: ViewModifier {
    func body(content: Content) -> some View { content }
}
```

---

## 3. Environment Values para Estilo Global

Defina EnvironmentKey para customizar estilos globalmente:

```swift
struct DandoriButtonAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriButtonStyle? = nil
}

extension EnvironmentValues {
    var dandoriButtonAppearance: DandoriButtonStyle? {
        get { self[DandoriButtonAppearanceKey.self] }
        set { self[DandoriButtonAppearanceKey.self] = newValue }
    }
}

extension View {
    func dandoriButtonAppearance(_ style: DandoriButtonStyle) -> some View {
        environment(\.dandoriButtonAppearance, style)
    }
}
```

---

## 4. Best Practices para Componentização

- **Props são simples (data, binding, action).**
- **Não inclua lógica de estado interno além do necessário para UI (ex: animação local).**
- **Exponha Bindings para interatividade, nunca lógica de negócio.**
- **Acessibilidade:** sempre use `.accessibilityLabel` e outros modifers.
- **Preview:** sempre forneça Preview com vários estados.
- **Tokens:** use sempre tokens centralizados para cor, tipografia, radius, spacing.
- **Estilização via Environment:** permita customização global, mas mantenha defaults razoáveis.
- **Centralize toda lógica visual de cor, padding, fontes, etc no arquivo Layout do componente.**
- **O arquivo principal do componente deve consumir apenas propriedades do layout.**

---

## 5. Checklist para Novo Componente

- [ ] Sem ViewModel, sem lógica de negócio.
- [ ] Props claros, bindings para estado externo.
- [ ] Tokens do DS para cor, fonte, radius, spacing.
- [ ] Preview funcional, cobrindo variações de estilo (EnvironmentValues).
- [ ] Suporte a .modifier/.appearance global via Environment.
- [ ] Arquivo de Layout implementado, consumido pela View.
- [ ] Acessibilidade implementada.
- [ ] Código limpo, bem comentado e documentado.

---

## 6. Resumo/Dicas Finais

- Componentes são composables, não containers de lógica.
- Use EnvironmentValues para estilos globais e overrides contextuais.
- Mantenha o código declarativo e enxuto.
- Prefira ViewModifiers para aplicar estilos complexos, se necessário.
- Centralize lógica visual em arquivos Layout para manter Views simples.
- Documente o componente e seu contracto (props, bindings, estilos).

---

> **Recomenda-se revisar periodicamente as Human Interface Guidelines da Apple e as novidades do SwiftUI a cada release para sempre refinar este padrão.**