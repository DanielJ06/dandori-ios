# Plano de Ação para Aproximação Visual dos Componentes de `dandori_app.jsx` ao DS Mobile

Este plano detalha, para cada componente principal de `dandori_app.jsx`, como adaptá-lo ao DS mobile para que o visual se aproxime do Dandori Web, **substituindo valores de tokens existentes** e mantendo proporções e boas práticas mobile, conforme as diretrizes do projeto.

---

## 1. **Chip**

### **Web**
- Fundo: `accent.light` ou `#FAF8F5`/`#F1ECE6`
- Texto: `accent.text` ou `#1C1B1A`
- Radius: `rounded-full`
- Padding: `px-3 py-1`
- Fonte: `font-sans`, `text-xs` (12px)

### **Plano de ação**
- Use os tokens de cor já substituídos no DS (`accent.*`, `surface.secondary`).
- Mantenha `radiusFull` para visual amigável.
- Padding pode ser mantido proporcional ao DS mobile.
- Garanta uso de `fontFamilyInter` e `fontSize12`.
- **Ajustar**: Substituir cor de texto pelo novo `content.primary` ou `accent.text`.

---

## 2. **Segmented**

### **Web**
- Fundo: `#FAF8F5`
- Borda: `#E3D9CB`
- Botão ativo: fundo branco, texto escuro, shadow
- Radius: `rounded-xl`

### **Plano de ação**
- Troque valores dos tokens:
  - Fundo: `surface.secondary` já ajustado para `#FAF8F5`
  - Borda: `border.default` agora `#E3D9CB`
- Radius: `radius8` (ou aumente para `radius16` se visualmente compatível)
- Fonte: `fontFamilyInter`, `fontSize14`, `weightMedium`
- **Ajustar**: Garanta contraste suficiente no estado ativo/inativo no mobile.

---

## 3. **Toast**

### **Web**
- Fundo: branco com opacidade, borda bege, shadow, rounded-xl
- Texto: `#1C1B1A`, fonte pequena

### **Plano de ação**
- Fundo: `surface.primary` com opacidade (use token + variação de opacidade se disponível)
- Borda: `border.default`
- Radius: `radius8`
- Fonte: `fontSize14`, `fontFamilyInter`
- **Ajustar**: Certifique que o toast não cobre áreas interativas no mobile.

---

## 4. **Header**

### **Web**
- Badge: `rounded-lg`, borda bege, fundo bege, texto pequeno
- Título: `font-serif`, `text-xl`/`text-3xl`, destaque editorial
- Gradiente com cor de accent

### **Plano de ação**
- Badge: use `radius8`, borda e fundo segundo tokens já substituídos
- Título: aplique `fontFamilyMerriweather` (serif) nos headings, mantendo tamanho proporcional ao DS mobile (ex: headingLarge, display)
- Gradiente: use `accent.light` como cor de fundo no gradiente
- **Ajustar**: Reduza tamanhos para manter proporção mobile (ex: display 24-32px).

---

## 5. **Inputs & Selects**

### **Web**
- Fundo branco, borda bege, radius grande, padding generoso

### **Plano de ação**
- Fundo: `surface.primary`
- Borda: `border.default`
- Radius: `radius8` ou `radius16` para destaque
- Padding: mantenha valores do DS mobile (ex: `space12`, `space16`)
- Fonte: `fontFamilyInter`, `fontSize14`
- **Ajustar**: Toque-friendly, mínimo 44px de altura.

---

## 6. **Cards (Tasks, Plan, Flow, Summary, etc.)**

### **Web**
- Fundo bege claro, borda bege, radius 16/24px, sombra suave, padding grande
- Texto principal serif, secundário sans

### **Plano de ação**
- Fundo: `surface.secondary`
- Borda: `border.default`
- Radius: `radius16` ou `radius24`
- Padding: aumente levemente se possível para dar leveza (ex: de 16px → 18px)
- Fonte: headings em `fontFamilyMerriweather`, corpo em `fontFamilyInter`
- **Ajustar**: Certifique-se que todos cards usam o novo esquema de cor e radius.

---

## 7. **Buttons**

### **Web**
- Primário: fundo accent, texto branco, borda accent
- Secundário: borda bege, fundo branco, texto escuro
- Radius: `rounded-xl`

### **Plano de ação**
- Primário:
  - Fundo: `accent.base`
  - Texto: `content.inverse`
  - Borda: `accent.base`
- Secundário:
  - Fundo: `surface.primary`
  - Borda: `border.default`
  - Texto: `content.primary`
- Radius: `radius8`
- Fonte: `fontFamilyInter`, `fontSize14`, `weightMedium`
- **Ajustar**: Áreas de toque sempre ≥44px altura.

---

## 8. **Badges e Labels ("Agora", etc.)**

### **Web**
- Fundo branco, borda bege, texto pequeno, radius full

### **Plano de ação**
- Fundo: `surface.primary`
- Borda: `border.default`
- Radius: `radiusFull`
- Fonte: `fontFamilyMerriweather` ou `fontFamilyInter` (consistência com DS)
- **Ajustar**: Tamanho de fonte e padding adequados à tela mobile.

---

## 9. **Typography geral**

- **Títulos**: `fontFamilyMerriweather` (serif), pesos regular/medium, line-height 1.3-1.4, tamanhos ajustados à proporção mobile.
- **Corpo/UI**: `fontFamilyInter` (sans), peso regular/medium, line-height 1.5.
- **Chips/labels/captions**: `fontFamilyInter`, peso medium, tamanho 12px, line-height 1.2-1.3.

---

## 10. **Outros detalhes**

- **Sombra:** Use sombras mais sutis no mobile (se usado no DS).
- **Espaçamento:** Nunca aumente padding/gap além de 20% sobre o DS mobile base, para evitar perda de espaço útil.
- **Tokens substituídos:** Todos os tokens antigos de cor e radius devem ter seus valores substituídos pelos novos da paleta Dandori Web, mantendo nomes originais.
- **Compatibilidade:** Teste todos componentes em device real para garantir legibilidade, contraste e toque-friendly.

---

## 11. **Resumo dos Principais Tokens a Substituir**

| Token                 | Novo Valor (Dandori Web) |
|-----------------------|--------------------------|
| surface.secondary     | #FAF8F5                  |
| border.default        | #E3D9CB                  |
| content.primary       | #1C1B1A                  |
| content.secondary     | #6B6A68                  |
| accent.teal.base      | #2BA69A                  |
| accent.teal.light     | #E5F6F3                  |
| accent.teal.text      | #0E5E57                  |
| accent.sage.base      | #7CAB89                  |
| accent.sage.light     | #E3F1E8                  |
| accent.sage.text      | #244C37                  |
| accent.turquoise.base | #3AAFB9                  |
| accent.turquoise.light| #E6F7F9                  |
| accent.turquoise.text | #0B4F57                  |
| radius8/16/24/Full    | manter nomes, só aplicar mais nos cards/chips |

---

> **Observação final:**  
> Todas as mudanças devem ser aplicadas substituindo os valores dos tokens já existentes, nunca os nomes. Crie novos tokens apenas quando necessário para nuances ou variações específicas. Priorize proporção, contraste e experiência mobile.