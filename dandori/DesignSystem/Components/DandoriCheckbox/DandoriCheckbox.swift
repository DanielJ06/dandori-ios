import SwiftUI

// MARK: - DandoriCheckbox Component

/**
 * A customizable checkbox component that follows Dandori Design System guidelines.
 * 
 * This component provides a clean, accessible checkbox interface with support for
 * various states, sizes, and visual variants.
 *
 * ## Usage
 * ```swift
 * @State private var isChecked = false
 * 
 * DandoriCheckbox(
 *     isChecked: $isChecked,
 *     label: "Accept terms and conditions",
 *     variant: .default
 * )
 * ```
 *
 * ## Features
 * - Multiple visual variants (default, accent)
 * - Different sizes (small, medium, large)
 * - Optional label text
 * - Disabled state support
 * - Smooth animations
 * - Environment-based appearance override
 * - Comprehensive accessibility support
 *
 * - Parameters:
 *   - isChecked: Binding to the checkbox state
 *   - label: Optional text label for the checkbox
 *   - variant: Visual style variant (default: .default)
 *   - size: Checkbox size (default: .medium)
 *   - isDisabled: Whether the checkbox is disabled (default: false)
 */
struct DandoriCheckbox: View {
    @Binding var isChecked: Bool
    let label: String?
    let variant: DandoriCheckboxVariant
    let size: DandoriCheckboxSize
    let isDisabled: Bool
    
    init(
        isChecked: Binding<Bool>,
        label: String? = nil,
        variant: DandoriCheckboxVariant = .default,
        size: DandoriCheckboxSize = .medium,
        isDisabled: Bool = false
    ) {
        self._isChecked = isChecked
        self.label = label
        self.variant = variant
        self.size = size
        self.isDisabled = isDisabled
    }
    
    @Environment(\.dandoriCheckboxAppearance) private var envVariant
    
    private var layout: DandoriCheckboxLayout {
        DandoriCheckboxLayout(
            variant: envVariant?.variant ?? variant,
            size: size,
            isDisabled: isDisabled
        )
    }
    
    var body: some View {
        HStack(spacing: layout.labelSpacing) {
            checkboxView
            
            if let label = label {
                Text(label)
                    .font(layout.labelFont)
                    .foregroundColor(layout.labelColor)
                    .accessibilityLabel(Text(label))
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(isChecked ? .isSelected : [])
        .accessibilityValue(Text(isChecked ? "Selecionado" : "Não selecionado"))
        .accessibilityHint(Text("Toque para \(isChecked ? "desmarcar" : "marcar")"))
        .onTapGesture {
            if !isDisabled {
                withAnimation(.easeInOut(duration: 0.15)) {
                    isChecked.toggle()
                }
            }
        }
    }
    
    @ViewBuilder
    private var checkboxView: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: layout.cornerRadius)
                .fill(layout.backgroundColor)
                .frame(width: layout.checkboxSize, height: layout.checkboxSize)
            
            // Border
            RoundedRectangle(cornerRadius: layout.cornerRadius)
                .stroke(layout.borderColor, lineWidth: layout.borderWidth)
                .frame(width: layout.checkboxSize, height: layout.checkboxSize)
            
            // Checkmark
            if isChecked {
                Image(systemName: "checkmark")
                    .font(layout.checkmarkFont)
                    .foregroundColor(layout.checkmarkColor)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .scaleEffect(layout.scale)
        .opacity(layout.opacity)
    }
}

// MARK: - Preview

#Preview("Checkbox Variants") {
    ScrollView(.vertical) {
        VStack(spacing: 24) {
            Text("Checkbox Variants")
                .font(.title2.weight(.semibold))
            
            VStack(spacing: 16) {
                HStack(spacing: 24) {
                    DandoriCheckbox(isChecked: .constant(true), label: "Checked")
                    DandoriCheckbox(isChecked: .constant(false), label: "Unchecked")
                }
                
                HStack(spacing: 24) {
                    DandoriCheckbox(isChecked: .constant(true), label: "Accent", variant: .accent)
                    DandoriCheckbox(isChecked: .constant(false), label: "Accent", variant: .accent)
                }
                
                HStack(spacing: 24) {
                    DandoriCheckbox(isChecked: .constant(true), label: "Disabled", isDisabled: true)
                    DandoriCheckbox(isChecked: .constant(false), label: "Disabled", isDisabled: true)
                }
            }
            
            Text("Checkbox Sizes")
                .font(.title2.weight(.semibold))
            
            VStack(spacing: 16) {
                HStack(spacing: 24) {
                    DandoriCheckbox(isChecked: .constant(true), label: "Small", size: .small)
                    DandoriCheckbox(isChecked: .constant(true), label: "Medium", size: .medium)
                    DandoriCheckbox(isChecked: .constant(true), label: "Large", size: .large)
                }
            }
            
            Text("Interactive Demo")
                .font(.title2.weight(.semibold))
            
            VStack(spacing: 16) {
                DandoriCheckbox(isChecked: .constant(true), label: "Interactive checkbox")
                DandoriCheckbox(isChecked: .constant(false), label: "Another option")
                DandoriCheckbox(isChecked: .constant(true), label: "Third option")
            }
        }
        .padding()
    }
}
