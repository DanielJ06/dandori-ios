# Design System e Estilo do Dandori

Este documento descreve detalhadamente o design system, tokens de estilo, espaçamentos, cores, fontes e padrões visuais utilizados no app Dandori.

## 1. Paleta de Cores

### Acentos Dinâmicos
O sistema utiliza acentos dinâmicos, definidos em `src/config/constants.ts` e aplicados via CSS Custom Properties pelo `AccentProvider`.

- **Acentos disponíveis:**
  - `teal`: base `#2BA69A`, light `#E5F6F3`, text `#0E5E57`
  - `sage`: base `#7CAB89`, light `#E3F1E8`, text `#244C37`
  - `turquoise`: base `#3AAFB9`, light `#E6F7F9`, text `#0B4F57`

**Uso:**
- `--accent-base`: cor principal (botões, destaques)
- `--accent-light`: fundo de elementos destacados
- `--accent-text`: texto sobre acento claro

### Cores Neutras e Background
- `--background`: `#ffffff` (claro), `#0a0a0a` (escuro)
- `--foreground`: `#171717` (claro), `#ededed` (escuro)
- Bordas: `#E3D9CB` (elementos, cards)
- Textos secundários: `#6B6A68`, `#1C1B1A`

### Estados e Interações
- Hover primário: `#383838` (claro), `#ccc` (escuro)
- Hover secundário: `#f2f2f2` (claro), `#1a1a1a` (escuro)

## 2. Tipografia

### Fontes
- **Sans:** `Inter`
- **Serif:** `Merriweather`

### Tamanhos e Pesos
- Botão: `text-sm`
- Tag/Chip: `text-xs`
- Eyebrow: `text-[11px]` uppercase, tracking-wider
- Título card: `font-serif text-[18px] leading-snug tracking-tight`
- Listas: `font-size: 14px; line-height: 24px; letter-spacing: -0.01em;`

## 3. Espaçamento e Layout

- **Cards:**
  - Padding: `p-4` (16px)
  - Border radius: `rounded-2xl` (cards), `rounded-lg` (botões), `rounded-md` (tags), `rounded-full` (chips)
  - Gap entre tags: `gap-2`
  - Margin bottom título: `mb-1`
  - Margin top tags: `mt-1`
  - Margin top actions: `mt-4`
- **Página:**
  - Padding: `padding: 80px;`
  - Gap principal: `gap: 64px;`
  - Grid: `grid-template-rows: 20px 1fr 20px;`
- **Segmented control:**
  - Gap: `gap-1`
  - Padding: `p-1` (container), `px-3 py-1.5` (botão)

## 4. Componentes e Tokens

### Button
- Primário: `bg-[var(--accent-base)] text-white rounded-lg px-3 py-2 text-sm`
- Secundário: `border border-[#E3D9CB] bg-white rounded-lg px-3 py-2 text-sm`
- Full width: `w-full` (mobile), `sm:w-auto` (desktop)

### Tag
- Acento: `bg-[var(--accent-light)] text-[var(--accent-text)] border-[var(--accent-base)]/20`
- Neutro: `bg-white text-[#1C1B1A] border-black/10`
- Padding: `px-2 py-0.5`, radius: `rounded-md`, tamanho: `text-xs`

### Chip
- `rounded-full bg-[var(--accent-light)] text-[var(--accent-text)] px-3 py-1 text-xs`

### Eyebrow
- `mb-1 text-[11px] uppercase tracking-wider text-[#6B6A68]`

### Toast/UndoToast
- Toast: `fixed bottom-4 right-4 z-50 ... bg-gray-800 text-white rounded-lg p-3 shadow-lg`
- UndoToast: `fixed bottom-4 left-4 right-4 ... bg-gray-800 text-white rounded-lg p-3 shadow-lg`

### UnifiedCard
- `rounded-2xl border border-[#E3D9CB] bg-white p-4 shadow-sm`
- Título: `font-serif text-[18px] leading-snug tracking-tight mb-1`
- Tags: `flex flex-wrap gap-2`
- Ações: `mt-4 grid grid-cols-1 sm:flex sm:gap-2`

## 5. Utilização de Tailwind
- Tailwind é usado para utilitários de espaçamento, tipografia, grid/flex, responsividade e tokens de cor.
- Configuração de fontes customizadas em `tailwind.config.ts` e `tailwind.config.js`.

## 6. Responsividade
- Largura total em mobile: `w-full`, ajusta para `sm:w-auto` em desktop (botões)
- Gaps e paddings adaptados para diferentes breakpoints via Tailwind