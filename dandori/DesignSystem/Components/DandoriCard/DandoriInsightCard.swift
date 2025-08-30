import SwiftUI

// MARK: - DandoriInsightCard Component

/**
 * A specialized insight card component that follows Dandori Design System guidelines.
 * 
 * This component is designed for displaying insights, summaries, and metrics in an
 * elevated visual style using the generic DandoriCard as its foundation.
 *
 * ## Usage
 * ```swift
 * DandoriInsightCard {
 *     VStack {
 *         Text("Daily Summary")
 *         Text("12 tasks completed")
 *     }
 * }
 * ```
 *
 * ## Features
 * - Elevated visual style for emphasis
 * - Comfortable padding for content breathing room
 * - Flexible content through ViewBuilder
 * - Consistent with DandoriCard design system
 * - Ideal for metrics, summaries, and insights
 *
 * - Parameters:
 *   - content: ViewBuilder closure containing the insight content
 */
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
                .foregroundColor(DS.Colors.Content.primary)
            
            Spacer()
            
            Image(systemName: "chart.line.uptrend.xyaxis")
                .font(.title2)
                .foregroundColor(DS.Colors.Accent.base)
        }
        
        HStack(spacing: 24) {
            VStack {
                Text("12")
                    .font(DSTokens.Typography.headingLarge.font)
                    .foregroundColor(DS.Colors.Content.primary)
                Text("Tarefas")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Content.secondary)
            }
            
            VStack {
                Text("3h 45m")
                    .font(DSTokens.Typography.headingLarge.font)
                    .foregroundColor(DS.Colors.Content.primary)
                Text("Focado")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Content.secondary)
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
            .foregroundColor(DS.Colors.Content.primary)
        
        HStack(spacing: 32) {
            VStack(spacing: 8) {
                Text("85%")
                    .font(DSTokens.Typography.headingLarge.font)
                    .foregroundColor(DS.Colors.Accent.base)
                Text("Eficiência")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Content.secondary)
            }
            
            VStack(spacing: 8) {
                Text("7.2")
                    .font(DSTokens.Typography.headingLarge.font)
                    .foregroundColor(DS.Colors.Accent.base)
                Text("Rating")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Content.secondary)
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
            .foregroundColor(DS.Colors.Content.primary)
        
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Fase 1: Planejamento")
                    .font(DSTokens.Typography.bodyMedium.font)
                    .foregroundColor(DS.Colors.Content.primary)
                Spacer()
                Text("100%")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Accent.base)
            }
            
            HStack {
                Text("Fase 2: Desenvolvimento")
                    .font(DSTokens.Typography.bodyMedium.font)
                    .foregroundColor(DS.Colors.Content.primary)
                Spacer()
                Text("65%")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Accent.base)
            }
            
            HStack {
                Text("Fase 3: Testes")
                    .font(DSTokens.Typography.bodyMedium.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                Spacer()
                Text("0%")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Content.secondary)
            }
        }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}
