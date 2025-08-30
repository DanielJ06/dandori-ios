import SwiftUI

// MARK: - DandoriTextField Component

/**
 * A customizable text input component that follows Dandori Design System guidelines.
 * 
 * This component provides various visual styles, sizes, and states while maintaining
 * consistent design and accessibility standards.
 *
 * ## Usage
 * ```swift
 * @State private var text = ""
 * DandoriTextField(
 *     text: $text,
 *     placeholder: "Enter text here",
 *     variant: .default
 * )
 * ```
 *
 * ## Features
 * - Multiple visual variants (default, outlined, filled)
 * - Different sizes (small, medium, large)
 * - Various states (normal, focused, error, disabled)
 * - Optional icon support
 * - Helper and error text support
 * - Environment-based appearance override
 * - Accessibility support
 *
 * - Parameters:
 *   - text: Binding to the text value
 *   - placeholder: Placeholder text when field is empty
 *   - variant: Visual style variant (default: .default)
 *   - size: Field size (default: .medium)
 *   - state: Current field state (default: .normal)
 *   - icon: Optional icon to display
 *   - helperText: Optional helper text below the field
 *   - errorText: Optional error text below the field
 */
struct DandoriTextField: View {
    @Binding var text: String
    let placeholder: String
    let variant: DandoriTextFieldVariant
    let size: DandoriTextFieldSize
    let state: DandoriTextFieldState
    let icon: Image?
    let helperText: String?
    let errorText: String?
    
    @Environment(\.dandoriTextFieldVariant) private var envVariant
    @FocusState private var isFocused: Bool
    
    private var layout: DandoriTextFieldLayout {
        DandoriTextFieldLayout(
            variant: envVariant,
            size: size,
            state: effectiveState,
            isFocused: isFocused
        )
    }
    
    private var effectiveState: DandoriTextFieldState {
        if !text.isEmpty && state == .error {
            return .error
        } else if isFocused {
            return .focused
        } else {
            return state
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: DSTokens.Spacing.elementSM) {
            // Input Field
            HStack(spacing: DSTokens.Spacing.elementMD) {
                if let icon = icon {
                    icon
                        .font(.system(size: layout.iconSize, weight: .medium))
                        .foregroundColor(layout.iconColor)
                }
                
                TextField(placeholder, text: $text)
                    .font(layout.typography.font)
                    .foregroundColor(layout.textColor)
                    .focused($isFocused)
                    .textFieldStyle(.plain)
                    .disabled(state == .disabled)
            }
            .padding(.horizontal, layout.horizontalPadding)
            .padding(.vertical, layout.verticalPadding)
            .frame(minHeight: layout.minHeight)
            .background(layout.backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: layout.cornerRadius)
                    .stroke(layout.borderColor, lineWidth: layout.borderWidth)
            )
            .clipShape(RoundedRectangle(cornerRadius: layout.cornerRadius))
            .animation(.easeInOut(duration: 0.2), value: isFocused)
            .animation(.easeInOut(duration: 0.2), value: effectiveState)
            
            // Helper/Error Text
            if let errorText = errorText, state == .error {
                Text(errorText)
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(layout.errorTextColor)
            } else if let helperText = helperText {
                Text(helperText)
                    .font(DSTokens.Typography.bodySmall.font)
                    .foregroundColor(layout.helperTextColor)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(placeholder)
        .accessibilityValue(text.isEmpty ? "Campo vazio" : text)
        .accessibilityHint(helperText ?? "")
    }
}

// MARK: - Convenience Initializers

extension DandoriTextField {
    /**
     * Creates a simple text field with basic configuration.
     *
     * - Parameters:
     *   - text: Binding to the text value
     *   - placeholder: Placeholder text when field is empty
     *   - variant: Visual style variant (default: .default)
     *   - size: Field size (default: .medium)
     */
    init(
        text: Binding<String>,
        placeholder: String,
        variant: DandoriTextFieldVariant = .default,
        size: DandoriTextFieldSize = .medium
    ) {
        self._text = text
        self.placeholder = placeholder
        self.variant = variant
        self.size = size
        self.state = .normal
        self.icon = nil
        self.helperText = nil
        self.errorText = nil
    }
}

// MARK: - Specialized TextField Components

/**
 * A specialized text field component for search functionality.
 *
 * - Parameters:
 *   - text: Binding to the search text
 *   - placeholder: Placeholder text for the search field
 *   - onSearchSubmit: Optional closure called when search is submitted
 */
struct DandoriSearchField: View {
    @Binding var text: String
    let placeholder: String
    let onSearchSubmit: (() -> Void)?
    
    var body: some View {
        DandoriTextField(
            text: $text,
            placeholder: placeholder,
            variant: .filled,
            size: .medium,
            state: .normal,
            icon: Image(systemName: "magnifyingglass"),
            helperText: nil,
            errorText: nil
        )
        .onSubmit {
            onSearchSubmit?()
        }
    }
}

/**
 * A specialized text field component for email input with validation.
 *
 * - Parameters:
 *   - email: Binding to the email text value
 */
struct DandoriEmailField: View {
    @Binding var email: String
    @State private var isValid: Bool = true
    
    private var errorText: String? {
        !isValid ? "Por favor, insira um email válido" : nil
    }
    
    private var state: DandoriTextFieldState {
        !isValid ? .error : .normal
    }
    
    var body: some View {
        VStack {
            DandoriTextField(
                text: $email,
                placeholder: "Digite seu email",
                variant: .default,
                size: .medium,
                state: state,
                icon: Image(systemName: "envelope"),
                helperText: "Utilizaremos seu email apenas para comunicações importantes",
                errorText: errorText
            )
        }
        .textFieldStyle(.automatic)
        .onChange(of: email) { _, newValue in
            validateEmail(newValue)
        }
    }
    
    private func validateEmail(_ email: String) {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        isValid = email.isEmpty || emailPredicate.evaluate(with: email)
    }
}

// MARK: - Preview

#Preview("DandoriTextField") {
    @Previewable @State var text1 = ""
    @Previewable @State var text2 = "Texto preenchido"
    @Previewable @State var text3 = ""
    @Previewable @State var text4 = ""
    
    ScrollView {
        VStack(spacing: 24) {
            // Variants
            VStack(spacing: 16) {
                Text("TextField Variants")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriTextField(
                        text: $text1,
                        placeholder: "Default variant",
                        variant: .default
                    )
                    
                    DandoriTextField(
                        text: $text2,
                        placeholder: "Outlined variant",
                        variant: .outlined
                    )
                }
            }
            
            // Sizes
            VStack(spacing: 16) {
                Text("TextField Sizes")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriTextField(
                        text: $text3,
                        placeholder: "Medium size",
                        size: .medium
                    )
                    
                    DandoriTextField(
                        text: $text4,
                        placeholder: "Medium size",
                        size: .medium
                    )
                }
            }
            
            // Specialized
            VStack(spacing: 16) {
                Text("Specialized TextFields")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriSearchField(
                        text: $text1,
                        placeholder: "Search...",
                        onSearchSubmit: { print("Search submitted") }
                    )
                }
            }
        }
        .padding()
    }
}
