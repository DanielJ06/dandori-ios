import SwiftUI

// MARK: - DandoriPlanCard Component

/**
 * A specialized plan card component that follows Dandori Design System guidelines.
 * 
 * This component is designed for displaying plans, workflows, and checklists in a
 * clean, organized layout using the generic DandoriCard as its foundation.
 *
 * ## Usage
 * ```swift
 * DandoriPlanCard {
 *     VStack {
 *         Text("Development Plan")
 *         Text("• Define architecture")
 *         Text("• Implement components")
 *     }
 * }
 * ```
 *
 * ## Features
 * - Default visual style for plan content
 * - Comfortable padding for organized content
 * - Flexible content through ViewBuilder
 * - Consistent with DandoriCard design system
 * - Ideal for plans, workflows, and checklists
 *
 * - Parameters:
 *   - content: ViewBuilder closure containing the plan content
 */
struct DandoriPlanCard<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        DandoriCard(variant: .default, size: .comfortable, content: content)
    }
}

// MARK: - Preview

#Preview("PlanCard") {
    ScrollView(.vertical) {
        VStack(spacing: 24) {
            Text("Plan Cards")
                .font(.title2.weight(.semibold))
            
            VStack(spacing: 16) {
                DandoriPlanCard {
                    developmentPlanContent()
                }
                
                DandoriPlanCard {
                    workflowContent()
                }
                
                DandoriPlanCard {
                    checklistContent()
                }
            }
        }
        .padding()
    }
}

@ViewBuilder
private func developmentPlanContent() -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Plano de Desenvolvimento")
            .font(DSTokens.Typography.headingMedium.font)
            .foregroundColor(DS.Colors.Content.primary)
        
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(DS.Colors.Accent.base)
                Text("Definir arquitetura")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
            
            HStack {
                Image(systemName: "circle")
                    .foregroundColor(DS.Colors.Content.secondary)
                Text("Implementar componentes")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
            
            HStack {
                Image(systemName: "circle")
                    .foregroundColor(DS.Colors.Content.secondary)
                Text("Testes e validação")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
        }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

@ViewBuilder
private func workflowContent() -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Fluxo de Trabalho")
            .font(DSTokens.Typography.headingMedium.font)
            .foregroundColor(DS.Colors.Content.primary)
        
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Text("1")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .frame(width: 20, height: 20)
                    .background(DS.Colors.Surface.secondary)
                    .clipShape(Circle())
                
                Text("Análise de requisitos")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
            
            HStack(spacing: 12) {
                Text("2")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .frame(width: 20, height: 20)
                    .background(DS.Colors.Surface.secondary)
                    .clipShape(Circle())
                
                Text("Design da solução")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
            
            HStack(spacing: 12) {
                Text("3")
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .frame(width: 20, height: 20)
                    .background(DS.Colors.Surface.secondary)
                    .clipShape(Circle())
                
                Text("Implementação")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
        }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

@ViewBuilder
private func checklistContent() -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Checklist de Lançamento")
            .font(DSTokens.Typography.headingMedium.font)
            .foregroundColor(DS.Colors.Content.primary)
        
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(DS.Colors.Accent.base)
                Text("Revisar código")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
            
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(DS.Colors.Accent.base)
                Text("Executar testes")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
            
            HStack {
                Image(systemName: "circle")
                    .foregroundColor(DS.Colors.Content.secondary)
                Text("Deploy em staging")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
            
            HStack {
                Image(systemName: "circle")
                    .foregroundColor(DS.Colors.Content.secondary)
                Text("Deploy em produção")
                    .font(DSTokens.Typography.bodyMedium.font)
                Spacer()
            }
        }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}
