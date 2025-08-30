import SwiftUI

// MARK: - DandoriBadge Component

/// Badge/Label component seguindo as diretrizes do Design System Dandori
/// Implementa visual alinhado com a versão web usando tokens atualizados
/// Unificado para cobrir tanto badges quanto chips (anteriormente separados)
struct DandoriBadge: View {
    let text: String
    let variant: DandoriBadgeVariant
    let size: DandoriBadgeSize
    let icon: Image?
    
    @Environment(\.dandoriBadgeAppearance) private var envVariant
    
    private var layout: DandoriBadgeLayout {
        DandoriBadgeLayout(
            variant: envVariant ?? variant,
            size: size
        )
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: DSTokens.Spacing.elementXS) {
            if let icon = icon {
                icon
                    .font(.system(size: layout.iconSize, weight: .medium))
                    .foregroundColor(layout.foregroundColor)
            }
            
            Text(text)
                .font(layout.typography.font)
                .foregroundColor(layout.foregroundColor)
        }
        .padding(.horizontal, layout.horizontalPadding)
        .padding(.vertical, layout.verticalPadding)
        .background(layout.backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: layout.cornerRadius)
                .stroke(layout.borderColor, lineWidth: layout.borderWidth)
        )
        .clipShape(RoundedRectangle(cornerRadius: layout.cornerRadius))
        .accessibilityLabel(Text(text))
        .accessibilityAddTraits(.isStaticText)
    }
}

// MARK: - Convenience Initializers

extension DandoriBadge {
    /// Cria um badge simples apenas com texto
    init(
        _ text: String,
        variant: DandoriBadgeVariant = .default,
        size: DandoriBadgeSize = .medium
    ) {
        self.text = text
        self.variant = variant
        self.size = size
        self.icon = nil
    }
    
    /// Cria um badge com texto e ícone
    init(
        _ text: String,
        icon: Image,
        variant: DandoriBadgeVariant = .default,
        size: DandoriBadgeSize = .medium
    ) {
        self.text = text
        self.variant = variant
        self.size = size
        self.icon = icon
    }
}

// MARK: - Preview

#Preview("DandoriBadge Variants") {
    ScrollView {
        VStack(spacing: 24) {
            // Variants
            VStack(spacing: 16) {
                Text("Badge Variants")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    HStack(spacing: 12) {
                        DandoriBadge("Default", variant: .default)
                        DandoriBadge("Filled", variant: .filled)
                        DandoriBadge("Accent", variant: .accent)
                    }
                    
                    HStack(spacing: 12) {
                        DandoriBadge("Status", variant: .status)
                        DandoriBadge("Subtle", variant: .subtle)
                    }
                }
            }
            
            // Sizes
            VStack(spacing: 16) {
                Text("Badge Sizes")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    HStack(spacing: 12) {
                        DandoriBadge("Small", variant: .accent, size: .small)
                        DandoriBadge("Medium", variant: .accent, size: .medium)
                        DandoriBadge("Large", variant: .accent, size: .large)
                    }
                }
            }
            
            // With Icons
            VStack(spacing: 16) {
                Text("With Icons")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    HStack(spacing: 12) {
                        DandoriBadge(
                            "Star",
                            icon: Image(systemName: "star.fill"),
                            variant: .accent
                        )
                        
                        DandoriBadge(
                            "Clock",
                            icon: Image(systemName: "clock"),
                            variant: .filled
                        )
                        
                        DandoriBadge(
                            "Check",
                            icon: Image(systemName: "checkmark"),
                            variant: .status
                        )
                    }
                }
            }
        }
        .padding()
    }
}

// MARK: - Specialized Badge Components

struct DandoriTimeBadge: View {
    let text: String
    let isActive: Bool
    
    var body: some View {
        DandoriBadge(
            text,
            variant: isActive ? .accent : .default,
            size: .medium
        )
    }
}

struct DandoriStatusBadge: View {
    let status: StatusType
    
    enum StatusType: CaseIterable {
        case completed
        case inProgress
        case pending
        case cancelled
        
        var text: String {
            switch self {
            case .completed: return "Concluído"
            case .inProgress: return "Em andamento"
            case .pending: return "Pendente"
            case .cancelled: return "Cancelado"
            }
        }
        
        var icon: Image {
            switch self {
            case .completed: return Image(systemName: "checkmark.circle")
            case .inProgress: return Image(systemName: "clock")
            case .pending: return Image(systemName: "pause.circle")
            case .cancelled: return Image(systemName: "xmark.circle")
            }
        }
    }
    
    var body: some View {
        DandoriBadge(
            status.text,
            icon: status.icon,
            variant: .status,
            size: .medium
        )
    }
}

struct DandoriCategoryBadge: View {
    let category: String
    let color: CategoryColor
    
    enum CategoryColor {
        case teal
        case sage
        case turquoise
        case neutral
        
        var variant: DandoriBadgeVariant {
            switch self {
            case .teal, .sage, .turquoise: return .accent
            case .neutral: return .filled
            }
        }
    }
    
    var body: some View {
        DandoriBadge(
            category,
            variant: color.variant,
            size: .small
        )
    }
}
