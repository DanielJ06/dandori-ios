import SwiftUI

// MARK: - DandoriCard Component

/**
 * A generic card container component that follows Dandori Design System guidelines.
 * 
 * This component serves as the foundation for all specific card types, providing
 * consistent styling, spacing, and visual effects while allowing flexible content.
 *
 * ## Usage
 * ```swift
 * DandoriCard(variant: .default, size: .standard) {
 *     VStack {
 *         Text("Card Title")
 *         Text("Card content goes here")
 *     }
 * }
 * ```
 *
 * ## Features
 * - Multiple visual variants (default, surface, outlined, elevated)
 * - Different sizes (compact, standard, comfortable)
 * - Flexible content through ViewBuilder
 * - Environment-based appearance override
 * - Consistent spacing and styling
 * - Shadow and border support
 *
 * - Parameters:
 *   - variant: Visual style variant (default: .default)
 *   - size: Card size affecting padding (default: .standard)
 *   - content: ViewBuilder closure containing the card content
 */
struct DandoriCard<Content: View>: View {
    let variant: DandoriCardVariant
    let size: DandoriCardSize
    let content: () -> Content
    
    @Environment(\.dandoriCardVariant) private var envVariant
    
    private var layout: DandoriCardLayout {
        DandoriCardLayout(
            variant: envVariant,
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
            
            // Environment Override
            VStack(spacing: 16) {
                Text("Environment Override")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 16) {
                    DandoriCard(variant: .default, size: .standard) {
                        cardContent(title: "Override Test", subtitle: "Should appear as elevated")
                    }
                }
                .dandoriCardVariant(.elevated)
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
            .foregroundColor(DS.Colors.Content.primary)
        
        Text(subtitle)
            .font(DSTokens.Typography.bodyMedium.font)
            .foregroundColor(DS.Colors.Content.secondary)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}
