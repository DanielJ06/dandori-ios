import SwiftUI

// MARK: - DandoriSegmented Component

/// Segmented control seguindo as diretrizes do Design System Dandori
/// Implementa visual alinhado com a versão web usando tokens atualizados
struct DandoriSegmented: View {
    @Binding var selection: Int
    let options: [String]
    let variant: DandoriSegmentedVariant
    
    @Environment(\.dandoriSegmentedAppearance) private var envVariant
    
    private var layout: DandoriSegmentedLayout {
        DandoriSegmentedLayout(variant: envVariant ?? variant)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                segmentButton(for: option, at: index)
            }
        }
        .background(layout.backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: layout.cornerRadius)
                .stroke(layout.borderColor, lineWidth: layout.borderWidth)
        )
        .clipShape(RoundedRectangle(cornerRadius: layout.cornerRadius))
    }
    
    @ViewBuilder
    private func segmentButton(for option: String, at index: Int) -> some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                selection = index
            }
        }) {
            Text(option)
                .font(layout.typography.font)
                .foregroundColor(foregroundColor(for: index))
                .padding(.horizontal, layout.horizontalPadding)
                .padding(.vertical, layout.verticalPadding)
                .frame(maxWidth: .infinity)
                .background(backgroundColor(for: index))
                .clipShape(RoundedRectangle(cornerRadius: layout.segmentRadius))
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text(option))
        .accessibilityAddTraits(selection == index ? .isSelected : [])
    }
    
    private func foregroundColor(for index: Int) -> Color {
        if selection == index {
            return layout.selectedForegroundColor
        } else {
            return layout.unselectedForegroundColor
        }
    }
    
    private func backgroundColor(for index: Int) -> Color {
        if selection == index {
            return layout.selectedBackgroundColor
        } else {
            return Color.clear
        }
    }
}
