# 🛠️ Ajustes no Design System Dandori

Faça as seguintes correções e melhorias no meu Design System:

## 1. Cinzas intermediários
- Adicione um novo token `gray200` e `gray300` na categoria **Primitivos** para suavizar a transição entre `gray100` (#E3D9CC) e `gray400` (#6B6B69).  
- Atualize os tokens de **Border** e **Surface** que utilizam `gray100` quando for necessário um contraste mais leve, usando esses novos tons.

## 2. Tipografia de botões
- Altere o line-height do token `button` de **1.0 → 1.2**, para dar mais respirabilidade.  
- Verifique se outros tokens de UI (label, caption) também se beneficiariam de uma leve revisão de line-height para manter consistência.

## 3. Tons de bege (Surface / Border)
- Revise o tom de `gray100` (#E3D9CC), que está sendo usado em `surface.tertiary` e `border.default`.  
- Ajuste levemente para um tom mais **neutro e fresco**, sem perder a identidade editorial, mas evitando aparência “amarelada”. Sugestão: um bege mais claro ou puxado para cinza esverdeado.

## 4. Hierarquia de Display
- Inclua um novo token tipográfico `displayXL`: Merriweather, 36, Regular, 1.2 (ou similar).  
- Use esse estilo apenas em telas hero ou destaques de sessão.

## 5. Dark Mode – contraste
- Revise contrastes em **Content.secondaryDark** (#E3D9CC) e **Border.defaultDark** (#1C1C19).  
- Garanta que a acessibilidade AA seja respeitada.  
- Se necessário, use os novos `gray200`/`gray300` adaptados para dark mode.