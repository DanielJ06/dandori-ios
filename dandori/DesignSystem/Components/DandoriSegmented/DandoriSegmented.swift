import SwiftUI

// MARK: - DandoriSegmented Component

/**
 * A segmented control component that follows Dandori Design System guidelines.
 * 
 * This component provides a tabbed interface for selecting between multiple options,
 * with smooth animations and consistent visual styling.
 *
 * ## Usage
 * ```swift
 * @State private var selection = 0
 * let options = ["Option 1", "Option 2", "Option 3"]
 * 
 * DandoriSegmented(
 *     selection: $selection,
 *     options: options,
 *     variant: .default
 * )
 * ```
 *
 * ## Features
 * - Multiple visual variants
 * - Smooth selection animations
 * - Environment-based appearance override
 * - Accessibility support
 * - Consistent spacing and styling
 * - Automatic segment sizing
 *
 * - Parameters:
 *   - selection: Binding to the currently selected segment index
 *   - options: Array of option strings to display
 *   - variant: Visual style variant
 */
struct DandoriSegmented: View {
    @Binding var selection: Int
    let options: [String]
    let variant: DandoriSegmentedVariant
    
    @Environment(\.dandoriSegmentedVariant) private var envVariant
    
    private var layout: DandoriSegmentedLayout {
        DandoriSegmentedLayout(variant: envVariant)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                segmentButton(for: option, at: index)
            }
        }
        .background(layout.containerBackgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: layout.cornerRadius)
                .stroke(layout.containerBorderColor, lineWidth: layout.borderWidth)
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
                .lineLimit(1)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text(option))
        .accessibilityAddTraits(selection == index ? .isSelected : [])
    }
    
    private func foregroundColor(for index: Int) -> Color {
        layout.segmentTextColor(isSelected: selection == index)
    }
    
    private func backgroundColor(for index: Int) -> Color {
        layout.segmentBackgroundColor(isSelected: selection == index)
    }
}
