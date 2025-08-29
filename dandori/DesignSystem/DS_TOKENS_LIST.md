# Lista de Tokens do Design System (DS)

Este documento lista todos os tokens definidos no seu Design System, organizados por categoria, incluindo os valores dos tokens entre parênteses.

---

## Cores Semânticas

### Surface
- `primary`: DSFoundation.ColorPrimitives.white (#FFFFFF)
- `secondary`: DSFoundation.ColorPrimitives.gray50 (#FAFAFA)
- `tertiary`: DSFoundation.ColorPrimitives.gray100 (#EBEAE1) - Tom mais neutro
- `primaryDark`: DSFoundation.ColorPrimitives.gray900 (#0A0A09)
- `secondaryDark`: DSFoundation.ColorPrimitives.gray700 (#1C1C19)
- `tertiaryDark`: DSFoundation.ColorPrimitives.gray400 (#6B6B69)

### Content
- `primary`: DSFoundation.ColorPrimitives.gray900 (#0A0A09)
- `secondary`: DSFoundation.ColorPrimitives.gray400 (#6B6B69)
- `inverse`: DSFoundation.ColorPrimitives.white (#FFFFFF)
- `primaryDark`: DSFoundation.ColorPrimitives.white (#FFFFFF)
- `secondaryDark`: DSFoundation.ColorPrimitives.gray200 (#C7C2B7) - Melhor contraste
- `inverseDark`: DSFoundation.ColorPrimitives.gray900 (#0A0A09)

### Border
- `default`: DSFoundation.ColorPrimitives.gray200 (#C7C2B7) - Tom intermediário
- `focus`: DSFoundation.ColorPrimitives.gray400 (#6B6B69)
- `defaultDark`: DSFoundation.ColorPrimitives.gray700 (#1C1C19)
- `focusDark`: DSFoundation.ColorPrimitives.gray400 (#6B6B69)

### Interactive
- `primary`: DSFoundation.ColorPrimitives.teal400 (#2BA59A)
- `primaryHover`: DSFoundation.ColorPrimitives.teal900 (#0D5E57)
- `secondary`: DSFoundation.ColorPrimitives.gray100 (#E3D9CC)
- `secondaryHover`: DSFoundation.ColorPrimitives.gray400 (#6B6B69)

### Accent
- `teal`: base (#2BA59A), light (#E6F5F3), text (#0D5E57)
- `sage`: base (#7DA98A), light (#E3F2E8), text (#244C38)
- `turquoise`: base (#3BC0B7), light (#E6F7F7), text (#0A4F57)

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
- `componentMD`: DSFoundation.SpacingPrimitives.space16 (16)
- `componentLG`: DSFoundation.SpacingPrimitives.space24 (24)
- `componentXL`: DSFoundation.SpacingPrimitives.space32 (32)

### Layout
- `layoutMD`: DSFoundation.SpacingPrimitives.space64 (64)
- `layoutLG`: DSFoundation.SpacingPrimitives.space80 (80)

---

## Raio Semântico
- `small`: DSFoundation.RadiusPrimitives.radius6 (6)
- `medium`: DSFoundation.RadiusPrimitives.radius8 (8)
- `large`: DSFoundation.RadiusPrimitives.radius16 (16)
- `full`: DSFoundation.RadiusPrimitives.radiusFull (9999)

---

## Tipografia Semântica

### Display
- `displayXL`: Merriweather, 36, Regular, 1.2 - Novo token para telas hero
- `display`: Merriweather, 30, Regular, 1.2

### Headings
- `headingLarge`: Merriweather, 24, Regular, 1.3
- `headingMedium`: Merriweather, 20, Regular, 1.3
- `headingSmall`: Merriweather, 18, Regular, 1.4

### Body
- `bodyLarge`: Inter, 16, Regular, 1.5
- `bodyMedium`: Inter, 14, Regular, 1.5
- `bodySmall`: Inter, 12, Regular, 1.4

### UI
- `button`: Inter, 14, Medium, 1.2 - Line-height melhorado
- `label`: Inter, 12, Medium, 1.2 - Line-height melhorado
- `caption`: Inter, 11, Medium, 1.2 - Line-height melhorado

---

## Primitivos (DSFoundation)

### Cores
- `white` (#FFFFFF), `black` (#000000), `gray50` (#FAFAFA), `gray100` (#EBEAE1), `gray200` (#C7C2B7), `gray300` (#A6A196), `gray400` (#6B6B69), `gray700` (#1C1C19), `gray900` (#0A0A09)
- `teal400` (#2BA59A), `teal50` (#E6F5F3), `teal900` (#0D5E57)
- `sage400` (#7DA98A), `sage50` (#E3F2E8), `sage900` (#244C38)
- `turquoise400` (#3BC0B7), `turquoise50` (#E6F7F7), `turquoise900` (#0A4F57)

### Espaçamento
- `space2` (2), `space4` (4), `space8` (8), `space12` (12), `space16` (16), `space20` (20), `space24` (24), `space32` (32), `space64` (64), `space80` (80)

### Raio
- `radius2` (2), `radius4` (4), `radius6` (6), `radius8` (8), `radius16` (16), `radiusFull` (9999)

### Tipografia
- Tamanhos: `fontSize11` (11), `fontSize12` (12), `fontSize14` (14), `fontSize16` (16), `fontSize18` (18), `fontSize20` (20), `fontSize24` (24), `fontSize30` (30), `fontSize36` (36)
- Famílias: `fontFamilyInter` ("Inter"), `fontFamilyMerriweather` ("Merriweather-Regular")
- Pesos: `weightLight` (light), `weightRegular` (regular), `weightMedium` (medium), `weightSemibold` (semibold), `weightBold` (bold)

---

> Documento gerado automaticamente a partir dos arquivos DSTokens.swift e DSFoundation.swift. Valores de cor em hexadecimal aproximados, baseados nos valores RGB definidos no código.
