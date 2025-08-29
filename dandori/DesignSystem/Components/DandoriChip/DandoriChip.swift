import SwiftUI

// MARK: - DandoriChip Component

/// Chip component seguindo as diretrizes do Design System Dandori
/// Implementa visual alinhado com a versão web usando tokens atualizados
struct DandoriChip: View {
    let text: String
    let variant: DandoriChipVariant
    let size: DandoriChipSize
    
    @Environment(\.dandoriChipAppearance) private var envVariant
    
    private var layout: DandoriChipLayout {
        DandoriChipLayout(variant: envVariant ?? variant, size: size)
    }
    
    var body: some View {
        Text(text)
            .font(layout.typography.font)
            .foregroundColor(layout.foregroundColor)
            .padding(.horizontal, layout.horizontalPadding)
            .padding(.vertical, layout.verticalPadding)
            .background(layout.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: layout.cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: layout.cornerRadius)
                    .stroke(layout.borderColor, lineWidth: layout.borderWidth)
            )
            .accessibilityLabel(Text(text))
            .accessibilityAddTraits(.isButton)
    }
}
