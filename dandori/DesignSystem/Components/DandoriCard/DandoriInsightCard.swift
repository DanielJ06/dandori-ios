import SwiftUI

// MARK: - DandoriInsightCard Component

/// Card component para insights e sumários seguindo as diretrizes do Design System Dandori
/// Implementa visual editorial com destaque visual usando o DandoriCard base
struct DandoriInsightCard<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        DandoriCard(variant: .elevated, size: .comfortable, content: content)
    }
}

// MARK: - Preview

#Preview("InsightCard") {
    ScrollView(.vertical) {
        VStack(spacing: 24) {
            Text("Insight Cards")
                .font(.title2.weight(.semibold))
            
            VStack(spacing: 16) {
                DandoriInsightCard {
                    summaryContent()
                }
                
                DandoriInsightCard {
                    metricsContent()
                }
                
                DandoriInsightCard {
                    progressContent()
                }
            }
        }
        .padding()
    }
}

@ViewBuilder
private func summaryContent() -> some View {
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

@ViewBuilder
private func metricsContent() -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Métricas de Produtividade")
            .font(DSTokens.Typography.headingMedium.font)
            .foregroundColor(DSTokens.Colors.Content.primary)
        
        HStack(spacing: 32) {
            VStack(spacing: 8) {
                Text("85%")
                    .font(DSTokens.Typography.headingLarge.font)
                    .foregroundColor(DSTokens.Colors.Accent.teal.base)
                Text("Eficiência")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DSTokens.Colors.Content.secondary)
            }
            
            VStack(spacing: 8) {
                Text("7.2")
                    .font(DSTokens.Typography.headingLarge.font)
                    .foregroundColor(DSTokens.Colors.Accent.teal.base)
                Text("Rating")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DSTokens.Colors.Content.secondary)
            }
            
            Spacer()
        }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

@ViewBuilder
private func progressContent() -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Progresso do Projeto")
            .font(DSTokens.Typography.headingMedium.font)
            .foregroundColor(DSTokens.Colors.Content.primary)
        
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Fase 1: Planejamento")
                    .font(DSTokens.Typography.bodyMedium.font)
                    .foregroundColor(DSTokens.Colors.Content.primary)
                Spacer()
                Text("100%")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DSTokens.Colors.Accent.sage.base)
            }
            
            HStack {
                Text("Fase 2: Desenvolvimento")
                    .font(DSTokens.Typography.bodyMedium.font)
                    .foregroundColor(DSTokens.Colors.Content.primary)
                Spacer()
                Text("65%")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DSTokens.Colors.Accent.teal.base)
            }
            
            HStack {
                Text("Fase 3: Testes")
                    .font(DSTokens.Typography.bodyMedium.font)
                    .foregroundColor(DSTokens.Colors.Content.secondary)
                Spacer()
                Text("0%")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DSTokens.Colors.Content.secondary)
            }
        }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}
