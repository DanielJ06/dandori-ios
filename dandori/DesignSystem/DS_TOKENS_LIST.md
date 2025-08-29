# Lista de Tokens do Design System (DS)

Este documento lista todos os tokens definidos no seu Design System, organizados por categoria, incluindo os valores dos tokens entre parênteses.

---

## Cores Semânticas

### Surface
- `primary`: DSFoundation.ColorPrimitives.white (#FFFFFF)
- `secondary`: DSFoundation.ColorPrimitives.gray50 (#FAF8F5) - Updated for Dandori Web
- `tertiary`: DSFoundation.ColorPrimitives.gray100 (#F1ECE6) - Updated beige tone
- `beigeAlt`: DSFoundation.ColorPrimitives.gray100 (#F1ECE6) - New beige alternative token
- `primaryDark`: DSFoundation.ColorPrimitives.gray900 (#1C1B1A) - Updated
- `secondaryDark`: DSFoundation.ColorPrimitives.gray700 (#1C1B1A) - Updated
- `tertiaryDark`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - Updated

### Content
- `primary`: DSFoundation.ColorPrimitives.gray900 (#1C1B1A) - Updated
- `secondary`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - Updated
- `inverse`: DSFoundation.ColorPrimitives.white (#FFFFFF)
- `primaryDark`: DSFoundation.ColorPrimitives.white (#FFFFFF)
- `secondaryDark`: DSFoundation.ColorPrimitives.gray200 (#E3D9CB) - Updated for better contrast
- `inverseDark`: DSFoundation.ColorPrimitives.gray900 (#1C1B1A) - Updated

### Border
- `default`: DSFoundation.ColorPrimitives.gray200 (#E3D9CB) - Updated for Dandori Web
- `focus`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - Updated
- `defaultDark`: DSFoundation.ColorPrimitives.gray700 (#1C1B1A) - Updated
- `focusDark`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - Updated

### Interactive
- `primary`: DSFoundation.ColorPrimitives.teal400 (#2BA69A) - Updated
- `primaryHover`: DSFoundation.ColorPrimitives.teal900 (#0E5E57) - Updated
- `secondary`: DSFoundation.ColorPrimitives.gray100 (#F1ECE6) - Updated
- `secondaryHover`: DSFoundation.ColorPrimitives.gray400 (#6B6A68) - Updated

### Accent
- `teal`: base (#2BA69A), light (#E5F6F3), text (#0E5E57) - Updated for Dandori Web
- `sage`: base (#7CAB89), light (#E3F1E8), text (#244C37) - Updated for Dandori Web
- `turquoise`: base (#3AAFB9), light (#E6F7F9), text (#0B4F57) - Updated for Dandori Web

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
- `componentMD`: 18 - Updated for better web alignment
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
- `extraLarge`: DSFoundation.RadiusPrimitives.radius24 (24) - New token for cards and larger components
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
- `white` (#FFFFFF), `black` (#000000), `gray50` (#FAF8F5), `gray100` (#F1ECE6), `gray200` (#E3D9CB), `gray300` (#A6A196), `gray400` (#6B6A68), `gray700` (#1C1B1A), `gray900` (#1C1B1A) - Updated for Dandori Web alignment
- `teal400` (#2BA69A), `teal50` (#E5F6F3), `teal900` (#0E5E57) - Updated for Dandori Web
- `sage400` (#7CAB89), `sage50` (#E3F1E8), `sage900` (#244C37) - Updated for Dandori Web
- `turquoise400` (#3AAFB9), `turquoise50` (#E6F7F9), `turquoise900` (#0B4F57) - Updated for Dandori Web

### Espaçamento
- `space2` (2), `space4` (4), `space8` (8), `space12` (12), `space16` (16), `space20` (20), `space24` (24), `space32` (32), `space64` (64), `space80` (80)

### Raio
- `radius2` (2), `radius4` (4), `radius6` (6), `radius8` (8), `radius16` (16), `radius24` (24), `radiusFull` (9999) - Added radius24 for larger components

### Tipografia
- Tamanhos: `fontSize11` (11), `fontSize12` (12), `fontSize14` (14), `fontSize16` (16), `fontSize18` (18), `fontSize20` (20), `fontSize24` (24), `fontSize30` (30), `fontSize36` (36)
- Famílias: `fontFamilyInter` ("Inter"), `fontFamilyMerriweather` ("Merriweather-Regular")
- Pesos: `weightLight` (light), `weightRegular` (regular), `weightMedium` (medium), `weightSemibold` (semibold), `weightBold` (bold)

---

> Documento atualizado em 29 de agosto de 2025 com as mudanças implementadas para aproximação visual do Dandori Web. Valores de cor em hexadecimal baseados nos valores RGB definidos no código após implementação das recomendações do ajustes_ds_mobile_para_dandori_Version3.md.
