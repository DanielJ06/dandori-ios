# Recomendações para Aproximação Visual do DS Mobile ao Dandori Web (Substituindo Tokens)

## 1. Tipografia

### **A. Proporção dos Tamanhos**
- **Mantenha a escala de proporções do DS mobile** (ex: bodyLarge : heading = 16:24 ou similar), **mas revise a hierarquia**:
  - Garanta que display, headings, body, caption mantenham as mesmas relações de proporção entre si.
  - Exemplo: Se display é 36px na web, mas no mobile é 24px, mantenha os subtítulos e corpo em proporção semelhante (exemplo: se body = 16px, heading = 24px, display = 32px, etc).

### **B. Peso das Fontes**
- **Ajuste sugerido para hierarchy editorial:**
  - Display/Headings: `weightRegular` ou `weightMedium` (evite bold excessivo).
  - Body/Textos: `weightRegular`.
  - Botões/Labels: `weightMedium` ou `weightSemibold` para melhor legibilidade em áreas de ação.

### **C. Font Family**
- **Títulos e destaques:** Adote uma fonte serifada (ex: Merriweather) para headings/display (consistente com Dandori Web).
- **Corpo, botões e UI:** Inter.
- **Legenda e captions:** Inter, tamanho menor, peso medium.

### **D. Line Height**
- **Aumente levemente o line-height em headings para dar leveza editorial** (ex: 1.3-1.4 para headings, 1.5 para corpo, 1.2 para UI).
- **Evite line-heights muito comprimidos**, especialmente em títulos (mantém legibilidade para mobile).

---

## 2. Cores

### **A. Paleta**
- **Substitua os valores dos tokens existentes para refletir a paleta do Dandori Web, mantendo os mesmos nomes!**
  - Exemplo:  
    - `surface.secondary`: **de** `#FAFAFA` **para** `#FAF8F5`
    - `border.default`: **de** `#C7C2B7` **para** `#E3D9CB`
    - `content.primary`: **de** `#0A0A09` **para** `#1C1B1A`
    - `content.secondary`: **de** `#6B6B69` **para** `#6B6A68`
    - `accent.teal.base`: **de** `#2BA59A` **para** `#2BA69A`
    - `accent.teal.light`: **de** `#E6F5F3` **para** `#E5F6F3`
    - `accent.teal.text`: **de** `#0D5E57` **para** `#0E5E57`
- **Se houver necessidade de tons intermediários, crie novos tokens**, por exemplo:
  - `surface.beigeAlt`: `#F1ECE6`

### **B. Acentos**
- Substitua todos os valores dos acentos (`teal`, `sage`, `turquoise`) para os tons exatos do Dandori Web (base, light, text).

---

## 3. Espaçamento e Raio

### **A. Espaçamento**
- **Mantenha os nomes dos tokens**, mas ajuste valores caso queira aproximar de proporção web, sempre respeitando a limitação do mobile:
  - Se no Dandori Web um card tem padding 24px e no mobile era 16px, considere aumentar para 18/20px caso o layout permita.
  - Exemplo:
    - `componentMD`: **de** `16` **para** `18` ou `20` (opcional, avalie o impacto visual).
- **Evite aumentar excessivamente os espaçamentos** para não desperdiçar espaço útil em telas pequenas.

### **B. Raio de borda**
- **Aplique mais radius grandes** (`radius16`, `radius24`, `radiusFull`) em cards e chips, substituindo valores antigos se necessário, mas sempre mantendo nomes dos tokens.

---

## 4. Hierarquia Visual

- **Aplique as mudanças de cor, tipografia e radius diretamente nos tokens existentes**.
- Prefira áreas de destaque com mais contraste suave (ex: fundo bege claro + texto preto quente).
- Represente chips, badges, toasts e cards com tokens de cor e radius próximos do Dandori Web.

---

## 5. Compatibilidade

- **Substitua os valores dos tokens existentes — não mantenha tokens defasados no seu Design System.**
- **Crie novos tokens apenas quando necessário para nuance visual, não para legacy.**
- **Teste visual em telas reais** para garantir contraste, legibilidade e toque-friendly no mobile.

---

## 6. Exemplo Prático de Mapeamento (Pseudocódigo)

```js
// Antes (DS mobile)
surface: {
  primary: "#FFFFFF",
  secondary: "#FAFAFA"
},
border: {
  default: "#C7C2B7"
},
content: {
  primary: "#0A0A09",
  secondary: "#6B6B69"
},
accent: {
  teal: { base: "#2BA59A", light: "#E6F5F3", text: "#0D5E57" }
}

// Depois (com aproximação Dandori Web)
// (Nomes idênticos, só valores mudam)
surface: {
  primary: "#FFFFFF",
  secondary: "#FAF8F5",      // substituído
  beigeAlt: "#F1ECE6",       // novo token opcional
},
border: {
  default: "#E3D9CB",        // substituído
},
content: {
  primary: "#1C1B1A",        // substituído
  secondary: "#6B6A68",      // substituído
},
accent: {
  teal: { base: "#2BA69A", light: "#E5F6F3", text: "#0E5E57" }, // todos substituídos
  sage: { base: "#7CAB89", light: "#E3F1E8", text: "#244C37" }, // todos substituídos
  turquoise: { base: "#3AAFB9", light: "#E6F7F9", text: "#0B4F57" } // todos substituídos
}
```

---

> **Resumo:**  
> Substitua valores dos tokens existentes para alinhar visualmente com o Dandori Web, mantendo nomes originais dos tokens do DS mobile. Crie novos apenas onde necessário para nuance. Teste sempre a experiência real no mobile para garantir usabilidade e legibilidade.