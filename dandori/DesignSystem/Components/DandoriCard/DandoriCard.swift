import SwiftUI

// MARK: - DandoriCard Component

/// Card component seguindo as diretrizes do Design System Dandori
/// Implementa visual alinhado com a versão web usando tokens atualizados
struct DandoriCard<Content: View>: View {
    let variant: DandoriCardVariant
    let size: DandoriCardSize
    let content: () -> Content
    
    @Environment(\.dandoriCardAppearance) private var envVariant
    
    private var layout: DandoriCardLayout {
        DandoriCardLayout(
            variant: envVariant ?? variant,
            size: size
        )
    }
    
    var body: some View {
        content()
            .padding(.horizontal, layout.horizontalPadding)
            .padding(.vertical, layout.verticalPadding)
            .background(layout.backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: layout.cornerRadius)
                    .stroke(layout.borderColor, lineWidth: layout.borderWidth)
            )
            .clipShape(RoundedRectangle(cornerRadius: layout.cornerRadius))
            .shadow(
                color: layout.shadowColor,
                radius: layout.shadowRadius,
                x: 0,
                y: layout.shadowY
            )
    }
}

// MARK: - Specialized Card Components

// Card para tarefas
struct DandoriTaskCard<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        DandoriCard(variant: .default, size: .standard, content: content)
    }
}

// Card para planos/fluxos
struct DandoriPlanCard<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        DandoriCard(variant: .default, size: .comfortable, content: content)
    }
}

// Card para sumários/destaques
struct DandoriSummaryCard<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        DandoriCard(variant: .elevated, size: .comfortable, content: content)
    }
}

// MARK: - Preview

#Preview("DandoriCard Variants") {
    ScrollView(.vertical) {
        VStack(spacing: 24) {
            // Variants
            VStack(spacing: 16) {
                Text("Card Variants")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 16) {
                    DandoriCard(variant: .default, size: .standard) {
                        cardContent(title: "Default Card", subtitle: "Fundo bege claro para uso geral")
                    }
                    
                    DandoriCard(variant: .surface, size: .standard) {
                        cardContent(title: "Surface Card", subtitle: "Fundo branco para destaque")
                    }
                    
                    DandoriCard(variant: .outlined, size: .standard) {
                        cardContent(title: "Outlined Card", subtitle: "Transparente com borda definida")
                    }
                    
                    DandoriCard(variant: .elevated, size: .standard) {
                        cardContent(title: "Elevated Card", subtitle: "Com sombra para destaque especial")
                    }
                }
            }
            
            // Sizes
            VStack(spacing: 16) {
                Text("Card Sizes")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 16) {
                    DandoriCard(variant: .default, size: .compact) {
                        cardContent(title: "Compact", subtitle: "Padding menor")
                    }
                    
                    DandoriCard(variant: .default, size: .standard) {
                        cardContent(title: "Standard", subtitle: "Padding padrão")
                    }
                    
                    DandoriCard(variant: .default, size: .comfortable) {
                        cardContent(title: "Comfortable", subtitle: "Padding maior para mais respiração")
                    }
                }
            }
            
            // Specialized Cards
            VStack(spacing: 16) {
                Text("Specialized Cards")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 16) {
                    DandoriTaskCard {
                        taskCardContent()
                    }
                    
                    DandoriPlanCard {
                        planCardContent()
                    }
                    
                    DandoriSummaryCard {
                        summaryCardContent()
                    }
                }
            }
            
            // Environment Override
            VStack(spacing: 16) {
                Text("Environment Override")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 16) {
                    DandoriCard(variant: .default, size: .standard) {
                        cardContent(title: "Override Test", subtitle: "Should appear as elevated")
                    }
                }
                .dandoriCardAppearance(.elevated)
            }
        }
        .padding()
    }
}

@ViewBuilder
private func cardContent(title: String, subtitle: String) -> some View {
    VStack(alignment: .leading, spacing: 8) {
        Text(title)
            .font(DSTokens.Typography.headingSmall.font)
            .foregroundColor(DSTokens.Colors.Content.primary)
        
        Text(subtitle)
            .font(DSTokens.Typography.bodyMedium.font)
            .foregroundColor(DSTokens.Colors.Content.secondary)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

@ViewBuilder
private func taskCardContent() -> some View {
    VStack(alignment: .leading, spacing: 12) {
        HStack {
            DandoriBadge("Agora", variant: .accent, size: .small)
            Spacer()
            Text("2 min")
                .font(DSTokens.Typography.caption.font)
                .foregroundColor(DSTokens.Colors.Content.secondary)
        }
        
        Text("Revisar documentação do projeto")
            .font(DSTokens.Typography.headingSmall.font)
            .foregroundColor(DSTokens.Colors.Content.primary)
        
        Text("Verificar se todos os requisitos estão sendo atendidos na implementação atual.")
            .font(DSTokens.Typography.bodyMedium.font)
            .foregroundColor(DSTokens.Colors.Content.secondary)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

@ViewBuilder
private func planCardContent() -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Plano de Desenvolvimento")
            .font(DSTokens.Typography.headingMedium.font)
            .foregroundColor(DSTokens.Colors.Content.primary)
        
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(DSTokens.Colors.Accent.sage.base)
                Text("Definir arquitetura")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
            
            HStack {
                Image(systemName: "circle")
                    .foregroundColor(DSTokens.Colors.Content.secondary)
                Text("Implementar componentes")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
            
            HStack {
                Image(systemName: "circle")
                    .foregroundColor(DSTokens.Colors.Content.secondary)
                Text("Testes e validação")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
        }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

@ViewBuilder
private func summaryCardContent() -> some View {
    VStack(alignment: .leading, spacing: 16) {
        HStack {
            Text("Resumo do Dia")
                .font(DSTokens.Typography.headingMedium.font)
                .foregroundColor(DSTokens.Colors.Content.primary)
            
            Spacer()
            
            Image(systemName: "chart.line.uptrend.xyaxis")
                .font(.title2)
                .foregroundColor(DSTokens.Colors.Accent.teal.base)
        }
        
        HStack(spacing: 24) {
            VStack {
                Text("12")
                    .font(DSTokens.Typography.headingLarge.font)
                    .foregroundColor(DSTokens.Colors.Content.primary)
                Text("Tarefas")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DSTokens.Colors.Content.secondary)
            }
            
            VStack {
                Text("3h 45m")
                    .font(DSTokens.Typography.headingLarge.font)
                    .foregroundColor(DSTokens.Colors.Content.primary)
                Text("Focado")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DSTokens.Colors.Content.secondary)
            }
            
            Spacer()
        }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}
