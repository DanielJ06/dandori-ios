import SwiftUI

// MARK: - Typealias for backward compatibility
typealias DandoriTaskCard = DandoriTaskCardComponent

// MARK: - DandoriTaskCardComponent Component

/// TaskCard component seguindo as diretrizes do Design System Dandori
/// Implementa visual editorial com badge dinâmica, alinhado com a versão web
/// Usa o DandoriCard genérico como base para consistência visual
struct DandoriTaskCardComponent: View {
    let model: DandoriTaskCardModel
    let actions: DandoriTaskCardActions
    
    @Environment(\.dandoriTaskCardAppearance) private var appearance
    
    private var layout: DandoriTaskCardLayout { .init() }
    
    private var isFlashing: Bool {
        appearance?.isFlashing ?? model.isFlashing
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            DandoriCard(variant: .default, size: .standard) {
                cardContent
            }
            .overlay(
                RoundedRectangle(cornerRadius: DSTokens.Radius.extraLarge)
                    .stroke(DSTokens.Colors.Accent.teal.base, lineWidth: isFlashing ? 2 : 0)
            )
            
            if let badgeText = model.badgeText {
                DandoriBadge(
                    badgeText,
                    variant: .default,
                    size: .small
                )
                .offset(x: 12, y: -8)
            }
        }
    }
    
    @ViewBuilder
    private var cardContent: some View {
        if let title = model.title {
            taskContent(title: title)
        } else {
            emptyContent
        }
    }
    
    @ViewBuilder
    private func taskContent(title: String) -> some View {
        VStack(alignment: .leading, spacing: DSTokens.Spacing.elementLG) {
            // Header with title and duration
            HStack(alignment: .center, spacing: DSTokens.Spacing.elementMD) {
                Text(title)
                    .font(DSTokens.Typography.headingSmall.font)
                    .foregroundColor(DSTokens.Colors.Content.primary)
                    .accessibilityLabel(Text(title))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                if let duration = model.duration {
                    DandoriBadge(
                        "\(duration)m",
                        icon: Image.init(systemName: "timer"),
                        variant: .filled,
                        size: .medium
                    )
                }
            }
            
            // Badges section
            if !model.chips.isEmpty {
                HStack(spacing: DSTokens.Spacing.elementMD) {
                    ForEach(model.chips) { chip in
                        DandoriBadge(
                            chip.text,
                            variant: chip.variant,
                            size: .medium
                        )
                    }
                    Spacer()
                }
            }
            
            // Action buttons
            HStack(spacing: DSTokens.Spacing.elementMD) {
                DandoriButton(
                    "Concluir",
                    variant: .primary,
                    size: .medium,
                    action: actions.onDone
                )
                
                DandoriButton(
                    "Pular",
                    variant: .ghost,
                    size: .medium,
                    action: actions.onSkip
                )
                
                DandoriButton(
                    "Replanejar",
                    variant: .secondary,
                    size: .medium,
                    action: actions.onReplan
                )
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private var emptyContent: some View {
        VStack {
            Text("Tudo concluído! 🎉")
                .font(DSTokens.Typography.headingSmall.font)
                .foregroundColor(DSTokens.Colors.Content.secondary)
                .accessibilityIdentifier("taskcard_empty")
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Convenience Initializers

extension DandoriTaskCardComponent {
    init(
        badgeText: String? = nil,
        title: String? = nil,
        duration: String? = nil,
        chips: [DandoriBadgeModel] = [],
        isFlashing: Bool = false,
        onDone: @escaping () -> Void = {},
        onSkip: @escaping () -> Void = {},
        onReplan: @escaping () -> Void = {}
    ) {
        self.model = DandoriTaskCardModel(
            badgeText: badgeText,
            title: title,
            duration: duration,
            chips: chips,
            isFlashing: isFlashing
        )
        self.actions = DandoriTaskCardActions(
            onDone: onDone,
            onSkip: onSkip,
            onReplan: onReplan
        )
    }
    
    init(
        model: DandoriTaskCardModel,
        onDone: @escaping () -> Void = {},
        onSkip: @escaping () -> Void = {},
        onReplan: @escaping () -> Void = {}
    ) {
        self.model = model
        self.actions = DandoriTaskCardActions(
            onDone: onDone,
            onSkip: onSkip,
            onReplan: onReplan
        )
    }
}

// MARK: - Previews

#Preview("TaskCard com Badge") {
    DandoriTaskCardComponent(
        badgeText: "Agora",
        title: "Revisar relatório mensal",
        duration: "30",
        chips: [
            DandoriBadgeModel(text: "Trabalho", variant: .accent),
            DandoriBadgeModel(text: "Urgente", variant: .default)
        ],
        onDone: { print("Concluído") },
        onSkip: { print("Pulado") },
        onReplan: { print("Replanejado") }
    )
    .padding()
}

#Preview("TaskCard sem Badge") {
    DandoriTaskCardComponent(
        title: "Fazer exercícios matinais",
        duration: "45",
        chips: [
            DandoriBadgeModel(text: "Saúde", variant: .filled),
            DandoriBadgeModel(text: "Rotina", variant: .accent)
        ]
    )
    .padding()
}

#Preview("TaskCard com Flash") {
    DandoriTaskCardComponent(
        badgeText: "Próximo",
        title: "Reunião com equipe",
        duration: "60",
        chips: [
            DandoriBadgeModel(text: "Trabalho", variant: .accent)
        ],
        isFlashing: true
    )
    .padding()
}

#Preview("TaskCard Vazio") {
    DandoriTaskCardComponent()
        .padding()
}
