import SwiftUI

// MARK: - DS Showcase

/// Showcase dos componentes do Design System Dandori
/// Demonstra todas as variações e usos dos componentes
struct DSShowcase: View {
    @State private var selectedTab = 0
    @State private var checkboxStates: [Bool] = [true, false, true, false]
    @State private var selectedOption: Int? = 2
    
    private let selectOptions = [
        DandoriSelectOption(label: "Opção 1", value: 1),
        DandoriSelectOption(label: "Opção 2", value: 2),
        DandoriSelectOption(label: "Opção 3", value: 3),
        DandoriSelectOption(label: "Opção 4", value: 4)
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Segmented control for navigation
                DandoriSegmented(
                    selection: $selectedTab,
                    options: ["Cards", "Form", "Components"],
                    variant: .default
                )
                .padding()
                
                // Content based on selected tab
                TabView(selection: $selectedTab) {
                    cardsShowcase
                        .tag(0)
                    
                    formShowcase
                        .tag(1)
                    
                    componentsShowcase
                        .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .navigationTitle("Design System Showcase")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // MARK: - Cards Showcase
    
    private var cardsShowcase: some View {
        ScrollView(.vertical) {
            VStack(spacing: 32) {
                // Generic Cards
                VStack(spacing: 16) {
                    Text("Generic Cards")
                        .font(.title2.weight(.semibold))
                    
                    VStack(spacing: 16) {
                        DandoriCard(variant: .default, size: .standard) {
                            cardContent(title: "Default Card", subtitle: "Fundo bege claro para uso geral")
                        }
                        
                        DandoriCard(variant: .elevated, size: .comfortable) {
                            cardContent(title: "Elevated Card", subtitle: "Com sombra para destaque especial")
                        }
                    }
                }
                
                // Specialized Cards
                VStack(spacing: 16) {
                    Text("Specialized Cards")
                        .font(.title2.weight(.semibold))
                    
                    VStack(spacing: 16) {
                        DandoriTaskCard(
                            title: "Revisar relatório mensal",
                            duration: "30",
                            chips: [
                                DandoriBadgeModel(text: "Trabalho", variant: .accent),
                                DandoriBadgeModel(text: "Urgente", variant: .default)
                            ],
                            onDone: { print("Concluído") },
                            onSkip: { print("Pulado") }
                        )
                        
                        DandoriPlanCard {
                            planCardContent()
                        }
                        
                        DandoriInsightCard {
                            insightCardContent()
                        }
                    }
                }
                
                // Direct Component Usage
                VStack(spacing: 16) {
                    Text("Componentes Diretos")
                        .font(.title2.weight(.semibold))
                    
                    VStack(spacing: 16) {
                        DandoriCard(variant: .default, size: .standard) {
                            cardContent(title: "Card Direto", subtitle: "Usando DandoriCard diretamente")
                        }
                        
                        DandoriCard(variant: .outlined, size: .compact) {
                            cardContent(title: "Card Compacto", subtitle: "Com padding menor")
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    // MARK: - Form Showcase
    
    private var formShowcase: some View {
        ScrollView(.vertical) {
            VStack(spacing: 32) {
                // Checkboxes
                VStack(spacing: 16) {
                    Text("Checkboxes")
                        .font(.title2.weight(.semibold))
                    
                    VStack(spacing: 16) {
                        HStack(spacing: 24) {
                            DandoriCheckbox(isChecked: $checkboxStates[0], label: "Small", size: .small)
                            DandoriCheckbox(isChecked: $checkboxStates[1], label: "Medium", size: .medium)
                            DandoriCheckbox(isChecked: $checkboxStates[2], label: "Large", size: .large)
                        }
                        
                        HStack(spacing: 24) {
                            DandoriCheckbox(isChecked: $checkboxStates[3], label: "Accent", variant: .accent)
                            DandoriCheckbox(isChecked: .constant(true), label: "Disabled", isDisabled: true)
                        }
                    }
                }
                
                // Input Selects
                VStack(spacing: 16) {
                    Text("Input Selects")
                        .font(.title2.weight(.semibold))
                    
                    VStack(spacing: 16) {
                        DandoriInputSelect(
                            selection: $selectedOption,
                            options: selectOptions,
                            placeholder: "Selecione uma opção"
                        )
                        
                        DandoriInputSelect(
                            selection: .constant(nil),
                            options: selectOptions,
                            placeholder: "Disabled",
                            isDisabled: true
                        )
                    }
                }
                
                // Direct Form Components
                VStack(spacing: 16) {
                    Text("Componentes de Formulário Diretos")
                        .font(.title2.weight(.semibold))
                    
                    VStack(spacing: 16) {
                        DandoriCheckbox(
                            isChecked: $checkboxStates[0],
                            label: "Checkbox Direto",
                            variant: .accent
                        )
                        
                        DandoriInputSelect(
                            selection: $selectedOption,
                            options: selectOptions,
                            placeholder: "Select Direto"
                        )
                    }
                }
            }
            .padding()
        }
    }
    
    // MARK: - Components Showcase
    
    private var componentsShowcase: some View {
        ScrollView(.vertical) {
            VStack(spacing: 32) {
                // Segmented Control
                VStack(spacing: 16) {
                    Text("Segmented Control")
                        .font(.title2.weight(.semibold))
                    
                    VStack(spacing: 16) {
                        DandoriSegmented(
                            selection: .constant(0),
                            options: ["Opção 1", "Opção 2", "Opção 3"],
                            variant: .default
                        )
                        
                        DandoriSegmented(
                            selection: .constant(1),
                            options: ["Opção A", "Opção B"],
                            variant: .accent
                        )
                    }
                }
                
                // Badges
                VStack(spacing: 16) {
                    Text("Badges")
                        .font(.title2.weight(.semibold))
                    
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            DandoriBadge("Default", variant: .default, size: .small)
                            DandoriBadge("Accent", variant: .accent, size: .medium)
                            DandoriBadge("Filled", variant: .filled, size: .large)
                        }
                    }
                }
                
                // Buttons
                VStack(spacing: 16) {
                    Text("Buttons")
                        .font(.title2.weight(.semibold))
                    
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            DandoriButton("Primary", variant: .primary, size: .medium)
                            DandoriButton("Secondary", variant: .secondary, size: .medium)
                            DandoriButton("Ghost", variant: .ghost, size: .medium)
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    // MARK: - Helper Content Views
    
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
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private func insightCardContent() -> some View {
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
}

// MARK: - Preview

#Preview("DS Showcase") {
    DSShowcase()
}