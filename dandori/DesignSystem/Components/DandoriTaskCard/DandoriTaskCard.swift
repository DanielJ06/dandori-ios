import SwiftUI

// MARK: - Typealias for backward compatibility
typealias DandoriTaskCard = DandoriTaskCardComponent

// MARK: - DandoriTaskCardComponent Component

/**
 * A specialized task card component that follows Dandori Design System guidelines.
 * 
 * This component displays task information in an editorial layout with dynamic badges,
 * duration indicators, and action buttons. It uses the generic DandoriCard as its base
 * for consistent visual styling.
 *
 * ## Usage
 * ```swift
 * DandoriTaskCardComponent(
 *     badgeText: "Now",
 *     title: "Review monthly report",
 *     duration: "30",
 *     chips: [
 *         DandoriBadgeModel(text: "Work", variant: .accent),
 *         DandoriBadgeModel(text: "Urgent", variant: .default)
 *     ],
 *     onDone: { /* handle completion */ },
 *     onSkip: { /* handle skip */ },
 *     onReplan: { /* handle replan */ }
 * )
 * ```
 *
 * ## Features
 * - Dynamic badge support (optional)
 * - Task title and duration display
 * - Configurable chip/badge tags
 * - Action buttons (Complete, Skip, Replan)
 * - Flashing state for attention
 * - Environment-based appearance override
 * - Accessibility support
 * - Empty state handling
 *
 * - Parameters:
 *   - model: Task card data model
 *   - actions: Action handlers for task operations
 */
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
                    .stroke(DS.Colors.Accent.base, lineWidth: isFlashing ? 2 : 0)
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
                    .foregroundColor(DS.Colors.Content.primary)
                    .accessibilityLabel(Text(title))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                if let duration = model.duration {
                    DandoriBadge(
                        "\(duration)m",
                        icon: Image(systemName: "timer"),
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
                DandoriButton("Concluir", action: actions.onDone)
                    .dandoriButtonVariant(.primary)
                    .dandoriButtonSize(.medium)
                
                DandoriButton("Pular", action: actions.onSkip)
                    .dandoriButtonVariant(.ghost)
                    .dandoriButtonSize(.medium)
                
                DandoriButton("Replanejar", action: actions.onReplan)
                    .dandoriButtonVariant(.secondary)
                    .dandoriButtonSize(.medium)
                
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
                .foregroundColor(DS.Colors.Content.secondary)
                .accessibilityIdentifier("taskcard_empty")
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Convenience Initializers

extension DandoriTaskCardComponent {
    /**
     * Creates a task card with individual parameters.
     *
     * - Parameters:
     *   - badgeText: Optional badge text to display
     *   - title: Task title (optional)
     *   - duration: Task duration in minutes (optional)
     *   - chips: Array of badge models for categorization
     *   - isFlashing: Whether the card should flash for attention
     *   - onDone: Action handler for task completion
     *   - onSkip: Action handler for task skipping
     *   - onReplan: Action handler for task replanning
     */
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
    
    /**
     * Creates a task card with a model and action handlers.
     *
     * - Parameters:
     *   - model: Task card data model
     *   - onDone: Action handler for task completion
     *   - onSkip: Action handler for task skipping
     *   - onReplan: Action handler for task replanning
     */
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
