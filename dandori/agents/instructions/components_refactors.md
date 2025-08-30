# Plano de Ação: Refatoração e Evolução dos Componentes DS SwiftUI (Dandori)

Este plano está dividido em etapas para facilitar a implementação incremental das melhorias, padronização e simplificações no Design System SwiftUI.

---

## **Etapa 1: Simplificação e Padronização de Componentes Básicos**

- [ ] **Unificação de Chips e Badges**
  - Analisar diferenças reais de uso e estilo.
  - Propor uma componente único e flexível (ex: `DandoriBadge`) para ambos os casos.
  - Remover duplicidade de código e tokens.
- [ ] **Remover Convenience Initializers Desnecessários**
  - Revisar initializers em todos os componentes.
  - Manter apenas os essenciais e claros.
  - Preferir init único e claro, com valores default se necessário.
- [ ] **Simplificar Código dos Componentes**
  - Eliminar propriedades redundantes e lógica desnecessária.
  - Centralizar lógica de layout/estilo nos arquivos `Layout`.
  - Usar tokens sempre que possível.
- [ ] **Preview em Todos os Componentes**
  - Garantir que todo componente SwiftUI possui um `#Preview` no próprio arquivo.
  - Cobrir variações e estados principais.

---

## **Etapa 2: Estruturação, Design e Documentação**

- [ ] **DandoriCard como Card Genérico**
  - Refatorar `DandoriCard` para ser um componente base genérico.
  - Extrair layout, paddings, estilização e props genéricas.
  - Criar componentes específicos derivados: `TaskCard`, `InsightCard`, etc. (Em arquivos diferentes, mas na mesma pasta "Cards")
  - Garantir que `DandoriCard` siga o design editorial do novo `TaskCard`.
- [ ] **Padronizar Paddings do DandoriSegmented**
  - Ajustar paddings e espaçamentos internos conforme tokens e guidelines DS.
  - Testar responsividade e conforto visual.
- [ ] **Componentização de Checkbox**
  - Criar `DandoriCheckbox` puro UI, seguindo tokens DS, com preview e suporte a accessibility.
  - API clara: binding de estado, label customizável.
- [ ] **Componentização de Input Select**
  - Criar `DandoriInputSelect` puro UI, com suporte a lista de opções, estado selecionado, e personalização via tokens.
  - Preview cobrindo variações.

---

## **Etapa 3: Documentação e Qualidade de Código**

- [ ] **Documentação tipo JSDoc**
  - Adicionar documentação breve (estilo JSDoc/SwiftDoc) em todos os componentes.
  - Explicar propósito do componente, props/parâmetros e exemplos de uso.
  - Remover comentários sem sentido ou redundantes.
  - Garantir que a documentação facilite o uso e manutenção futura.

---

## **Dicas Gerais**
- Siga o guia de clean code e arquitetura já definido para o DS.
- Use sempre tokens de cor, fonte, espaçamento e radius.
- Priorize acessibilidade e clareza de API.

---

## **Sugestão de Ordem de Execução**

1. Unificação Chip/Badge → Simplificação de initializers/código → Previews
2. Refatoração Card genérico + TaskCard/InsightCard → Ajuste DandoriSegmented
3. Checkbox/InputSelect
4. Documentação

---

> **Importante:**  
> Cada etapa pode ser feita em PRs separados e versionada incrementalmente.