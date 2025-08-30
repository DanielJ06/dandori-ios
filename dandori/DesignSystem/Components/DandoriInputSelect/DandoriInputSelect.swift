import SwiftUI

// MARK: - DandoriInputSelect Component

/**
 * A customizable dropdown select component that follows Dandori Design System guidelines.
 * 
 * This component provides a clean, accessible dropdown interface for selecting from
 * a list of options with smooth animations and consistent styling.
 *
 * ## Usage
 * ```swift
 * @State private var selection: Int? = nil
 * let options = [
 *     DandoriSelectOption(label: "Option 1", value: 1),
 *     DandoriSelectOption(label: "Option 2", value: 2)
 * ]
 * 
 * DandoriInputSelect(
 *     selection: $selection,
 *     options: options,
 *     placeholder: "Select an option"
 * )
 * ```
 *
 * ## Features
 * - Generic type support for any Hashable value
 * - Multiple visual variants
 * - Different sizes (small, medium, large)
 * - Disabled state support
 * - Smooth expand/collapse animations
 * - Environment-based appearance override
 * - Comprehensive accessibility support
 * - Customizable placeholder text
 *
 * - Parameters:
 *   - selection: Binding to the currently selected option
 *   - options: Array of selectable options
 *   - placeholder: Text displayed when no option is selected
 *   - variant: Visual style variant (default: .default)
 *   - size: Component size (default: .medium)
 *   - isDisabled: Whether the component is disabled (default: false)
 */
struct DandoriInputSelect<T: Hashable>: View {
    @Binding var selection: T?
    let options: [DandoriSelectOption<T>]
    let placeholder: String
    let variant: DandoriInputSelectVariant
    let size: DandoriInputSelectSize
    let isDisabled: Bool
    
    init(
        selection: Binding<T?>,
        options: [DandoriSelectOption<T>],
        placeholder: String = "Selecione uma opção",
        variant: DandoriInputSelectVariant = .default,
        size: DandoriInputSelectSize = .medium,
        isDisabled: Bool = false
    ) {
        self._selection = selection
        self.options = options
        self.placeholder = placeholder
        self.variant = variant
        self.size = size
        self.isDisabled = isDisabled
    }
    
    @State private var isExpanded = false
    @Environment(\.dandoriInputSelectAppearance) private var envVariant
    
    private var layout: DandoriInputSelectLayout {
        DandoriInputSelectLayout(
            variant: envVariant?.variant ?? variant,
            size: size,
            isDisabled: isDisabled,
            isExpanded: isExpanded
        )
    }
    
    private var selectedOption: DandoriSelectOption<T>? {
        options.first { $0.value == selection }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Main select button
            Button(action: {
                if !isDisabled {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isExpanded.toggle()
                    }
                }
            }) {
                HStack {
                    Text(selectedOption?.label ?? placeholder)
                        .font(layout.textFont)
                        .foregroundColor(selectedOption != nil ? layout.selectedTextColor : layout.placeholderColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(layout.iconFont)
                        .foregroundColor(layout.iconColor)
                        .rotationEffect(.degrees(isExpanded ? 0 : 0))
                        .animation(.easeInOut(duration: 0.2), value: isExpanded)
                }
                .padding(.horizontal, layout.horizontalPadding)
                .padding(.vertical, layout.verticalPadding)
                .frame(minHeight: DSTokens.Dimensions.touchTargetLarge)
                .background(layout.backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: layout.cornerRadius)
                        .stroke(layout.borderColor, lineWidth: layout.borderWidth)
                )
                .clipShape(RoundedRectangle(cornerRadius: layout.cornerRadius))
            }
            .buttonStyle(.plain)
            .disabled(isDisabled)
            .accessibilityLabel(Text("Selecionar opção"))
            .accessibilityValue(Text(selectedOption?.label ?? placeholder))
            .accessibilityHint(Text("Toque para abrir opções"))
            
            // Dropdown options
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(options, id: \.value) { option in
                        optionRow(option)
                    }
                }
                .background(layout.dropdownBackgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: layout.dropdownCornerRadius)
                        .stroke(layout.dropdownBorderColor, lineWidth: layout.dropdownBorderWidth)
                )
                .clipShape(RoundedRectangle(cornerRadius: layout.dropdownCornerRadius))
                .shadow(
                    color: layout.dropdownShadowColor,
                    radius: layout.dropdownShadowRadius,
                    y: layout.dropdownShadowY
                )
                .transition(.asymmetric(
                    insertion: .scale(scale: 0.95, anchor: .top).combined(with: .opacity),
                    removal: .scale(scale: 0.95, anchor: .top).combined(with: .opacity)
                ))
                .zIndex(1)
            }
        }
        .onTapGesture {
            // Close dropdown when tapping outside
            if isExpanded {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isExpanded = false
                }
            }
        }
    }
    
    @ViewBuilder
    private func optionRow(_ option: DandoriSelectOption<T>) -> some View {
        Button(action: {
            selection = option.value
            withAnimation(.easeInOut(duration: 0.2)) {
                isExpanded = false
            }
        }) {
            HStack {
                Text(option.label)
                    .font(layout.optionFont)
                    .foregroundColor(option.value == selection ? layout.selectedOptionColor : layout.optionTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if option.value == selection {
                    Image(systemName: "checkmark")
                        .font(layout.checkmarkFont)
                        .foregroundColor(layout.selectedOptionColor)
                }
            }
            .frame(minHeight: DSTokens.Dimensions.touchTargetMedium)
            .padding(.horizontal, layout.optionHorizontalPadding)
            .padding(.vertical, layout.optionVerticalPadding)
            .background(option.value == selection ? layout.selectedOptionBackgroundColor : Color.clear)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text(option.label))
        .accessibilityAddTraits(option.value == selection ? .isSelected : [])
        
        if option.value != options.last?.value {
            Divider()
                .background(layout.dividerColor)
                .padding(.horizontal, layout.dividerPadding)
        }
    }
}

// MARK: - Preview

#Preview("InputSelect Variants") {
    ScrollView(.vertical) {
        VStack(spacing: 24) {
            Text("InputSelect Variants")
                .font(.title2.weight(.semibold))
            
            VStack(spacing: 16) {
                DandoriInputSelect(
                    selection: .constant(nil),
                    options: [
                        DandoriSelectOption(label: "Opção 1", value: 1),
                        DandoriSelectOption(label: "Opção 2", value: 2),
                        DandoriSelectOption(label: "Opção 3", value: 3)
                    ],
                    placeholder: "Selecione uma opção"
                )
                
                DandoriInputSelect(
                    selection: .constant(2),
                    options: [
                        DandoriSelectOption(label: "Opção 1", value: 1),
                        DandoriSelectOption(label: "Opção 2", value: 2),
                        DandoriSelectOption(label: "Opção 3", value: 3)
                    ],
                    placeholder: "Selecione uma opção"
                )
                
                DandoriInputSelect(
                    selection: .constant(nil),
                    options: [
                        DandoriSelectOption(label: "Opção 1", value: 1),
                        DandoriSelectOption(label: "Opção 2", value: 2),
                        DandoriSelectOption(label: "Opção 3", value: 3)
                    ],
                    placeholder: "Disabled",
                    isDisabled: true
                )
            }
        }
        .padding()
    }
}
