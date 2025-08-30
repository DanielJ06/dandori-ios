import SwiftUI

// MARK: - DandoriBadge Component

/**
 * A flexible badge/label component that follows Dandori Design System guidelines.
 * 
 * This component unifies the previous separate badge and chip components into a single,
 * configurable component that can be used for various labeling purposes.
 *
 * ## Usage
 * ```swift
 * DandoriBadge("New", variant: .accent)
 * DandoriBadge("Star", icon: Image(systemName: "star.fill"), variant: .filled)
 * ```
 *
 * ## Features
 * - Multiple visual variants (default, filled, accent, status, subtle)
 * - Different sizes (small, medium, large)
 * - Optional icon support with automatic sizing
 * - Environment-based appearance override
 * - Accessibility support
 * - Specialized badge types for common use cases
 *
 * - Parameters:
 *   - text: The badge's text label
 *   - variant: Visual style variant (default: .default)
 *   - size: Badge size (default: .medium)
 *   - icon: Optional icon to display alongside the text
 */
struct DandoriBadge: View {
    let text: String
    let variant: DandoriBadgeVariant
    let size: DandoriBadgeSize
    let icon: Image?
    
    @Environment(\.dandoriBadgeVariant) private var envVariant
    
    private var layout: DandoriBadgeLayout {
        DandoriBadgeLayout(
            variant: envVariant,
            size: size
        )
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: DSTokens.Spacing.elementXS) {
            if let icon = icon {
                icon
                    .font(.system(size: layout.iconSize, weight: .medium))
                    .foregroundColor(layout.textColor)
            }
            
            Text(text)
                .font(layout.typography.font)
                .foregroundColor(layout.textColor)
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
    /**
     * Creates a badge with just text.
     *
     * - Parameters:
     *   - text: The badge's text label
     *   - variant: Visual style variant (default: .default)
     *   - size: Badge size (default: .medium)
     */
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
    
    /**
     * Creates a badge with text and icon.
     *
     * - Parameters:
     *   - text: The badge's text label
     *   - icon: Icon to display alongside the text
     *   - variant: Visual style variant (default: .default)
     *   - size: Badge size (default: .medium)
     */
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

/**
 * A specialized badge component for displaying time-related information.
 *
 * - Parameters:
 *   - text: The time text to display
 *   - isActive: Whether the time period is currently active
 */
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

/**
 * A specialized badge component for displaying status information.
 *
 * - Parameters:
 *   - status: The status type to display
 */
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

/**
 * A specialized badge component for displaying category information.
 *
 * - Parameters:
 *   - category: The category name to display
 *   - color: The color scheme to use for the category
 */
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
