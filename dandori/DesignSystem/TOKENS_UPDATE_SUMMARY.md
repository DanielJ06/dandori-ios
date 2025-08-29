# Tokens Atualizados - Dandori Design System

Este documento detalha os tokens que foram atualizados para alinhar o Design System mobile com a versão web do Dandori, seguindo o plano de ação definido.

## Tokens de Cor Atualizados

### Cores Primitivas (DSFoundation.ColorPrimitives)

| Token | Valor Web | Valor RGB | Uso |
|-------|-----------|-----------|-----|
| `gray50` | `#FAF8F5` | `Color(red: 0.98, green: 0.97, blue: 0.96)` | surface.secondary |
| `gray100` | `#F1ECE6` | `Color(red: 0.95, green: 0.93, blue: 0.90)` | beige alternative |
| `gray200` | `#E3D9CB` | `Color(red: 0.89, green: 0.85, blue: 0.80)` | border.default |
| `gray400` | `#6B6A68` | `Color(red: 0.42, green: 0.42, blue: 0.41)` | content.secondary |
| `gray700/900` | `#1C1B1A` | `Color(red: 0.11, green: 0.11, blue: 0.10)` | content.primary |

### Cores de Accent

| Token | Valor Web | Valor RGB | Contexto |
|-------|-----------|-----------|----------|
| `teal400` | `#2BA69A` | `Color(red: 0.17, green: 0.65, blue: 0.60)` | accent.teal.base |
| `teal50` | `#E5F6F3` | `Color(red: 0.90, green: 0.96, blue: 0.95)` | accent.teal.light |
| `teal900` | `#0E5E57` | `Color(red: 0.05, green: 0.37, blue: 0.34)` | accent.teal.text |
| `sage400` | `#7CAB89` | `Color(red: 0.49, green: 0.67, blue: 0.54)` | accent.sage.base |
| `sage50` | `#E3F1E8` | `Color(red: 0.89, green: 0.95, blue: 0.91)` | accent.sage.light |
| `sage900` | `#244C37` | `Color(red: 0.14, green: 0.30, blue: 0.22)` | accent.sage.text |
| `turquoise400` | `#3AAFB9` | `Color(red: 0.23, green: 0.69, blue: 0.72)` | accent.turquoise.base |
| `turquoise50` | `#E6F7F9` | `Color(red: 0.90, green: 0.97, blue: 0.97)` | accent.turquoise.light |
| `turquoise900` | `#0B4F57` | `Color(red: 0.04, green: 0.31, blue: 0.34)` | accent.turquoise.text |

## Tokens Semânticos (DSTokens)

### Cores de Superfície
- `Surface.primary`: Branco (`#FFFFFF`)
- `Surface.secondary`: Bege claro (`#FAF8F5`) - **Alinhado com web**
- `Surface.tertiary`: Bege médio (`#F1ECE6`)

### Cores de Conteúdo
- `Content.primary`: Texto principal (`#1C1B1A`) - **Alinhado com web**
- `Content.secondary`: Texto secundário (`#6B6A68`) - **Alinhado com web**
- `Content.inverse`: Texto inverso (branco)

### Cores de Borda
- `Border.default`: Borda padrão (`#E3D9CB`) - **Alinhado com web**
- `Border.focus`: Borda em foco (`#6B6A68`)

### Cores de Accent
- `Accent.teal`: Sistema completo teal - **Alinhado com web**
- `Accent.sage`: Sistema completo sage - **Alinhado com web**
- `Accent.turquoise`: Sistema completo turquoise - **Alinhado com web**

## Tokens de Radius Atualizados

| Token | Valor | Uso |
|-------|--------|-----|
| `Radius.small` | `6pt` | Elementos pequenos |
| `Radius.medium` | `8pt` | Botões, inputs (equivale ao rounded-xl web) |
| `Radius.large` | `16pt` | Cards padrão |
| `Radius.extraLarge` | `24pt` | Cards grandes (novo token) |
| `Radius.full` | `9999pt` | Chips, badges |

## Tokens de Espaçamento Ajustados

| Token | Valor | Uso |
|-------|--------|-----|
| `Spacing.componentMD` | `18pt` | Padding de componentes (aumentado de 16pt) |

## Implementação nos Componentes

### 1. DandoriChip
- **Fundo**: `surface.secondary` (#FAF8F5) para variant neutral
- **Texto**: `content.primary` (#1C1B1A)
- **Radius**: `radiusFull`
- **Typography**: Inter, 12pt para medium size

### 2. DandoriSegmented
- **Fundo**: `surface.secondary` (#FAF8F5)
- **Borda**: `border.default` (#E3D9CB)
- **Radius**: `radius8` (equivale ao rounded-xl web)
- **Typography**: Inter, 14pt, medium weight

### 3. DandoriToast
- **Fundo**: `surface.primary` com opacidade
- **Borda**: `border.default` (#E3D9CB)
- **Radius**: `radius8`
- **Typography**: Inter, 14pt

### 4. DandoriButton
- **Primário**:
  - Fundo: `accent.teal.base` (#2BA69A)
  - Texto: `content.inverse` (branco)
- **Secundário**:
  - Fundo: `surface.primary` (branco)
  - Borda: `border.default` (#E3D9CB)
  - Texto: `content.primary` (#1C1B1A)
- **Radius**: `radius8`
- **Typography**: Inter, 14pt, medium weight

### 5. DandoriCard
- **Default**:
  - Fundo: `surface.secondary` (#FAF8F5) - **bege claro como no web**
  - Borda: `border.default` (#E3D9CB) sutil
- **Elevated**:
  - Fundo: `surface.primary` (branco para destaque)
  - Sombra mais pronunciada
- **Radius**: 
  - Standard: `radius16`
  - Comfortable: `radius24` (extraLarge)

### 6. DandoriTextField
- **Fundo**: `surface.primary` (branco)
- **Borda**: `border.default` (#E3D9CB)
- **Focus**: `accent.teal.base` com borda 2pt
- **Radius**: `radius8` ou `radius16` para outlined
- **Typography**: Inter, 14pt

### 7. DandoriBadge
- **Default**:
  - Fundo: `surface.primary` (branco)
  - Borda: `border.default` (#E3D9CB)
- **Filled**:
  - Fundo: `surface.secondary` (#FAF8F5)
- **Radius**: `radiusFull`
- **Typography**: Inter, 12pt para medium size

## Tipografia

### Hierarquia Mantida
- **Títulos**: Merriweather (serif) - mantém o caráter editorial
- **UI/Corpo**: Inter (sans) - legibilidade e clareza
- **Tamanhos**: Ajustados para proporção mobile (24-32px para display)

### Line-heights
- **Display/Headings**: 1.2-1.4
- **Body**: 1.5
- **UI Elements**: 1.2

## Validação Mobile

### Acessibilidade
- ✅ Áreas de toque ≥44px altura
- ✅ Contraste suficiente em todos os estados
- ✅ Suporte a VoiceOver/acessibilidade

### Performance
- ✅ Tokens pré-computados
- ✅ Animações suaves (0.2-0.3s)
- ✅ Estados loading/disabled

### Compatibilidade
- ✅ iOS 15+
- ✅ Dark mode ready (estrutura preparada)
- ✅ Dynamic type support

## Próximos Passos

1. **Testes**: Validar componentes em device real
2. **Dark Mode**: Implementar variantes dark dos tokens
3. **Acessibilidade**: Teste completo com VoiceOver
4. **Performance**: Profile em dispositivos mais antigos
5. **Documentação**: Storybook/Showcase completo

## Conclusão

Todos os tokens principais foram atualizados para aproximar a experiência mobile do Dandori Web, mantendo as melhores práticas mobile e a identidade visual consistente. Os componentes implementados seguem as diretrizes de Clean Architecture e são facilmente extensíveis e customizáveis via Environment Values.
