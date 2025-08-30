import SwiftUI

// MARK: - DandoriButton Component

/**
 * A customizable button component that follows Dandori Design System guidelines.
 * 
 * This component provides multiple variants, sizes, and states while maintaining
 * consistent visual design and accessibility standards.
 *
 * ## Usage
 * ```swift
 * DandoriButton("Click me", variant: .primary) {
 *     // Action here
 * }
 * ```
 *
 * ## Features
 * - Multiple visual variants (primary, secondary, tertiary, ghost)
 * - Different sizes (small, medium, large, fullWidth)
 * - Various states (enabled, disabled, loading)
 * - Icon support with automatic sizing
 * - Environment-based appearance override
 * - Accessibility support
 *
 * - Parameters:
 *   - title: The button's text label
 *   - icon: Optional icon to display alongside the text
 *   - variant: Visual style variant (default: .primary)
 *   - size: Button size (default: .medium)
 *   - state: Current button state (default: .enabled)
 *   - action: Closure executed when button is tapped
 */
struct DandoriButton: View {
    let title: String
    let icon: Image?
    let action: () -> Void
    
    // Environment values with defaults
    @Environment(\.dandoriButtonVariant) private var envVariant
    @Environment(\.dandoriButtonSize) private var envSize
    @Environment(\.dandoriButtonState) private var envState
    
    /**
     * Creates a new DandoriButton with the specified parameters.
     *
     * - Parameters:
     *   - title: The button's text label
     *   - icon: Optional icon to display alongside the text
     *   - action: Closure executed when button is tapped
     */
    init(
        _ title: String,
        icon: Image? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.action = action
    }
    
    private var layout: DandoriButtonLayout {
        DandoriButtonLayout(
            variant: envVariant,
            size: envSize,
            state: envState
        )
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: DSTokens.Spacing.elementSM) {
                if let icon = icon {
                    icon
                        .font(.system(size: layout.iconSize, weight: .medium))
                        .foregroundColor(layout.foregroundColor)
                }
                
                if envState == .loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: layout.foregroundColor))
                        .scaleEffect(0.8)
                } else {
                    Text(title)
                        .font(layout.typography.font)
                        .foregroundColor(layout.foregroundColor)
                }
            }
            .padding(.horizontal, layout.horizontalPadding)
            .padding(.vertical, layout.verticalPadding)
            .frame(maxWidth: envSize == .fullWidth ? .infinity : nil)
            .frame(minHeight: layout.minHeight)
        }
        .background(layout.backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: layout.cornerRadius)
                .stroke(layout.borderColor, lineWidth: layout.borderWidth)
        )
        .clipShape(RoundedRectangle(cornerRadius: layout.cornerRadius))
        .disabled(envState == .disabled || envState == .loading)
        .buttonStyle(.plain)
        .accessibilityLabel(Text(title))
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - Preview

#Preview("DandoriButton Variants") {
    ScrollView {
        VStack(spacing: 24) {
            // Variants
            VStack(spacing: 16) {
                Text("Button Variants")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton("Primary Button") {}
                    DandoriButton("Secondary Button") {}
                        .dandoriButtonVariant(.secondary)
                    DandoriButton("Tertiary Button") {}
                        .dandoriButtonVariant(.tertiary)
                    DandoriButton("Ghost Button") {}
                        .dandoriButtonVariant(.ghost)
                }
            }
            
            // Sizes
            VStack(spacing: 16) {
                Text("Button Sizes")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton("Small") {}
                        .dandoriButtonSize(.small)
                    DandoriButton("Medium") {}
                    DandoriButton("Large") {}
                        .dandoriButtonSize(.large)
                    DandoriButton("Full Width") {}
                        .dandoriButtonSize(.fullWidth)
                }
            }
            
            // With Icons
            VStack(spacing: 16) {
                Text("With Icons")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton(
                        "Add Item",
                        icon: Image(systemName: "plus")
                    ) {}
                    
                    DandoriButton(
                        "Edit",
                        icon: Image(systemName: "pencil")
                    ) {}
                        .dandoriButtonVariant(.secondary)
                    
                    DandoriButton(
                        "Delete",
                        icon: Image(systemName: "trash")
                    ) {}
                        .dandoriButtonVariant(.ghost)
                }
            }
            
            // States
            VStack(spacing: 16) {
                Text("Button States")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton("Enabled") {}
                    DandoriButton("Disabled") {}
                        .dandoriButtonState(.disabled)
                    DandoriButton("Loading") {}
                        .dandoriButtonState(.loading)
                }
            }
            
            // Environment Override
            VStack(spacing: 16) {
                Text("Environment Override")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton("Default Primary") {}
                    DandoriButton("Override to Secondary") {}
                }
                .dandoriButtonVariant(.secondary)
            }
        }
        .padding()
    }
}
