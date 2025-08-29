# Lista de Tokens do Design System (DS) - Atualizado para Dandori Web

Este documento lista todos os tokens definidos no Design System, organizados por categoria, incluindo os valores dos tokens atualizados para alinhar com o Dandori Web.

---

## ✅ Cores Semânticas (Atualizadas)

### Surface
- `primary`: DSFoundation.ColorPrimitives.white (#FFFFFF)
- `secondary`: DSFoundation.ColorPrimitives.gray50 (#FAF8F5) - ✅ Alinhado com Dandori Web
- `tertiary`: DSFoundation.ColorPrimitives.gray100 (#F1ECE6) - ✅ Tom bege atualizado
- `beigeAlt`: DSFoundation.ColorPrimitives.gray100 (#F1ECE6) - ✅ Token bege alternativo
- `primaryDark`: DSFoundation.ColorPrimitives.gray900 (#1C1B1A) - ✅ Atualizado
- `secondaryDark`: DSFoundation.ColorPrimitives.gray700 (#1C1B1A) - ✅ Atualizado
- `tertiaryDark`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - ✅ Atualizado

### Content
- `primary`: DSFoundation.ColorPrimitives.gray900 (#1C1B1A) - ✅ Alinhado com Dandori Web
- `secondary`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - ✅ Alinhado com Dandori Web
- `inverse`: DSFoundation.ColorPrimitives.white (#FFFFFF)
- `primaryDark`: DSFoundation.ColorPrimitives.white (#FFFFFF)
- `secondaryDark`: DSFoundation.ColorPrimitives.gray200 (#E3D9CB) - ✅ Melhor contraste
- `inverseDark`: DSFoundation.ColorPrimitives.gray900 (#1C1B1A) - ✅ Atualizado

### Border
- `default`: DSFoundation.ColorPrimitives.gray200 (#E3D9CB) - ✅ Alinhado com Dandori Web
- `focus`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - ✅ Atualizado
- `defaultDark`: DSFoundation.ColorPrimitives.gray700 (#1C1B1A) - ✅ Atualizado
- `focusDark`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - ✅ Atualizado

### Interactive
- `primary`: DSFoundation.ColorPrimitives.teal400 (#2BA69A) - ✅ Alinhado com Dandori Web
- `primaryHover`: DSFoundation.ColorPrimitives.teal900 (#0E5E57) - ✅ Alinhado com Dandori Web
- `secondary`: DSFoundation.ColorPrimitives.gray100 (#F1ECE6) - ✅ Atualizado
- `secondaryHover`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - ✅ Atualizado

### Accent (Completamente alinhado com Dandori Web)
- `teal`: base (#2BA69A), light (#E5F6F3), text (#0E5E57) - ✅ Alinhado com Dandori Web
- `sage`: base (#7CAB89), light (#E3F1E8), text (#244C37) - ✅ Alinhado com Dandori Web
- `turquoise`: base (#3AAFB9), light (#E6F7F9), text (#0B4F57) - ✅ Alinhado com Dandori Web

---

## Espaçamento Semântico

### Element
- `elementXS`: DSFoundation.SpacingPrimitives.space2 (2)
- `elementSM`: DSFoundation.SpacingPrimitives.space4 (4)
- `elementMD`: DSFoundation.SpacingPrimitives.space8 (8)
- `elementLG`: DSFoundation.SpacingPrimitives.space12 (12)
- `elementXL`: DSFoundation.SpacingPrimitives.space16 (16)

### Component
- `componentSM`: DSFoundation.SpacingPrimitives.space8 (8)
- `componentMD`: 18 - ✅ Atualizado para melhor alinhamento web (de 16pt → 18pt)
- `componentLG`: DSFoundation.SpacingPrimitives.space24 (24)
- `componentXL`: DSFoundation.SpacingPrimitives.space32 (32)

### Layout
- `layoutMD`: DSFoundation.SpacingPrimitives.space64 (64)
- `layoutLG`: DSFoundation.SpacingPrimitives.space80 (80)

---

## ✅ Raio Semântico (Atualizado)
- `small`: DSFoundation.RadiusPrimitives.radius6 (6)
- `medium`: DSFoundation.RadiusPrimitives.radius8 (8) - ✅ Equivale ao rounded-xl do web
- `large`: DSFoundation.RadiusPrimitives.radius16 (16) - ✅ Para cards padrão
- `extraLarge`: DSFoundation.RadiusPrimitives.radius24 (24) - ✅ Novo token para cards grandes
- `full`: DSFoundation.RadiusPrimitives.radiusFull (9999) - ✅ Para chips e badges

---

## Tipografia Semântica

### Display
- `displayXL`: Merriweather, 36, Regular, 1.2 - Reduzido para proporção mobile
- `display`: Merriweather, 30, Regular, 1.2 - Reduzido para proporção mobile

### Headings (Merriweather - Editorial)
- `headingLarge`: Merriweather, 24, Regular, 1.3 - ✅ Proporção mobile adequada
- `headingMedium`: Merriweather, 20, Regular, 1.3
- `headingSmall`: Merriweather, 18, Regular, 1.4

### Body (Inter - UI/Legibilidade)
- `bodyLarge`: Inter, 16, Regular, 1.5
- `bodyMedium`: Inter, 14, Regular, 1.5 - ✅ Padrão para inputs/UI
- `bodySmall`: Inter, 12, Regular, 1.4

### UI (Inter - Controles)
- `button`: Inter, 14, Medium, 1.2 - ✅ Touch-friendly, weight medium
- `label`: Inter, 12, Medium, 1.2 - ✅ Para chips/badges medium
- `caption`: Inter, 11, Medium, 1.2 - ✅ Para chips/badges small

---

## Primitivos (DSFoundation) - Completamente Alinhados

### Cores (✅ Todos atualizados para Dandori Web)
- `white` (#FFFFFF), `black` (#000000)
- `gray50` (#FAF8F5) - ✅ Surface secondary
- `gray100` (#F1ECE6) - ✅ Bege alternativo
- `gray200` (#E3D9CB) - ✅ Border default
- `gray300` (#A6A196), `gray400` (#6B6A68) - ✅ Content secondary
- `gray700` (#1C1B1A), `gray900` (#1C1B1A) - ✅ Content primary
- `teal400` (#2BA69A), `teal50` (#E5F6F3), `teal900` (#0E5E57) - ✅ Sistema teal completo
- `sage400` (#7CAB89), `sage50` (#E3F1E8), `sage900` (#244C37) - ✅ Sistema sage completo
- `turquoise400` (#3AAFB9), `turquoise50` (#E6F7F9), `turquoise900` (#0B4F57) - ✅ Sistema turquoise completo

### Espaçamento
- `space2` (2), `space4` (4), `space8` (8), `space12` (12), `space16` (16), `space20` (20), `space24` (24), `space32` (32), `space64` (64), `space80` (80)

### Raio
- `radius2` (2), `radius4` (4), `radius6` (6), `radius8` (8), `radius16` (16), `radius24` (24) - ✅ Novo, `radiusFull` (9999)

### Tipografia
- Tamanhos: `fontSize11` (11), `fontSize12` (12), `fontSize14` (14), `fontSize16` (16), `fontSize18` (18), `fontSize20` (20), `fontSize24` (24), `fontSize30` (30), `fontSize36` (36)
- Famílias: `fontFamilyInter` ("Inter"), `fontFamilyMerriweather` ("Merriweather-Regular")
- Pesos: `weightLight` (light), `weightRegular` (regular), `weightMedium` (medium), `weightSemibold` (semibold), `weightBold` (bold)

---

## 🆕 Novos Componentes Implementados

### DandoriChip
- Variants: accent, neutral, outlined
- Sizes: small, medium
- ✅ Environment appearance support

### DandoriSegmented
- Variants: default, accent
- ✅ Animações suaves
- ✅ Estado ativo/inativo claro

### DandoriToast
- Variants: info, success, warning, error
- ✅ Toast manager integrado
- ✅ Auto-dismiss configurável

### DandoriButton (Enhanced)
- Variants: primary, secondary, tertiary, ghost
- Sizes: small, medium, large, fullWidth
- States: enabled, disabled, loading
- ✅ Touch-friendly (≥44px altura)

### DandoriCard (Enhanced)
- Variants: default, surface, outlined, elevated
- Sizes: compact, standard, comfortable
- ✅ Especializações: TaskCard, PlanCard, SummaryCard

### DandoriTextField
- Variants: default, filled, outlined
- Sizes: medium, large
- ✅ Estados focus/error com animação
- ✅ Especializações: SearchField, EmailField

### DandoriBadge
- Variants: default, filled, accent, status, subtle
- Sizes: small, medium, large
- ✅ Especializações: TimeBadge, StatusBadge, CategoryBadge

---

> 📝 **Status da Implementação**: ✅ Concluída  
> 📅 **Última atualização**: 29 de agosto de 2025  
> 🎯 **Objetivo**: Alinhamento completo com Dandori Web mantendo boas práticas mobile  
> 🚀 **Próximos passos**: Testes em device, dark mode, documentação showcase
