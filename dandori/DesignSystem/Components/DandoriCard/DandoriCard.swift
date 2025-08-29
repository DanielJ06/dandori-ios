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

struct DandoriTaskCard<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        DandoriCard(variant: .default, size: .standard, content: content)
    }
}

struct DandoriPlanCard<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        DandoriCard(variant: .default, size: .comfortable, content: content)
    }
}

struct DandoriSummaryCard<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        DandoriCard(variant: .elevated, size: .comfortable, content: content)
    }
}
