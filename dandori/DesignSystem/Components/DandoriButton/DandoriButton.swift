import SwiftUI

// MARK: - DandoriButton Component

/// Button component seguindo as diretrizes do Design System Dandori
/// Implementa visual alinhado com a versão web usando tokens atualizados
struct DandoriButton: View {
    let title: String
    let icon: Image?
    let variant: DandoriButtonVariant
    let size: DandoriButtonSize
    let state: DandoriButtonState
    let action: () -> Void
    
    // Convenience initializers
    init(
        _ title: String,
        icon: Image? = nil,
        variant: DandoriButtonVariant = .primary,
        size: DandoriButtonSize = .medium,
        state: DandoriButtonState = .enabled,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.icon = icon
        self.variant = variant
        self.size = size
        self.state = state
        self.action = action
    }
    
    init(
        title: String,
        icon: Image? = nil,
        variant: DandoriButtonVariant,
        size: DandoriButtonSize = .medium,
        state: DandoriButtonState = .enabled,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.icon = icon
        self.variant = variant
        self.size = size
        self.state = state
        self.action = action
    }
    
    @Environment(\.dandoriButtonAppearance) private var envVariant
    
    private var layout: DandoriButtonLayout {
        DandoriButtonLayout(
            variant: envVariant ?? variant,
            size: size,
            state: state
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
                
                if state == .loading {
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
            .frame(maxWidth: size == .fullWidth ? .infinity : nil)
            .frame(minHeight: layout.minHeight)
        }
        .background(layout.backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: layout.cornerRadius)
                .stroke(layout.borderColor, lineWidth: layout.borderWidth)
        )
        .clipShape(RoundedRectangle(cornerRadius: layout.cornerRadius))
        .disabled(state == .disabled || state == .loading)
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
                    DandoriButton("Primary Button", variant: .primary) {}
                    DandoriButton("Secondary Button", variant: .secondary) {}
                    DandoriButton("Tertiary Button", variant: .tertiary) {}
                    DandoriButton("Ghost Button", variant: .ghost) {}
                }
            }
            
            // Sizes
            VStack(spacing: 16) {
                Text("Button Sizes")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton("Small", variant: .primary, size: .small) {}
                    DandoriButton("Medium", variant: .primary, size: .medium) {}
                    DandoriButton("Large", variant: .primary, size: .large) {}
                    DandoriButton("Full Width", variant: .primary, size: .fullWidth) {}
                }
            }
            
            // With Icons
            VStack(spacing: 16) {
                Text("With Icons")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton(
                        "Add Item",
                        icon: Image(systemName: "plus"),
                        variant: .primary
                    ) {}
                    
                    DandoriButton(
                        "Edit",
                        icon: Image(systemName: "pencil"),
                        variant: .secondary
                    ) {}
                    
                    DandoriButton(
                        "Delete",
                        icon: Image(systemName: "trash"),
                        variant: .ghost
                    ) {}
                }
            }
            
            // States
            VStack(spacing: 16) {
                Text("Button States")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton(
                        title: "Enabled",
                        icon: nil,
                        variant: .primary,
                        size: .medium,
                        state: .enabled
                    ) {}
                    
                    DandoriButton(
                        title: "Disabled",
                        icon: nil,
                        variant: .primary,
                        size: .medium,
                        state: .disabled
                    ) {}
                    
                    DandoriButton(
                        title: "Loading",
                        icon: nil,
                        variant: .primary,
                        size: .medium,
                        state: .loading
                    ) {}
                }
            }
            
            // Environment Override
            VStack(spacing: 16) {
                Text("Environment Override")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton("Default Primary") {}
                    DandoriButton("Override to Secondary", variant: .primary) {}
                }
                .dandoriButtonAppearance(.secondary)
            }
        }
        .padding()
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
                    DandoriButton("Primary Button", variant: .primary) {}
                    DandoriButton("Secondary Button", variant: .secondary) {}
                    DandoriButton("Tertiary Button", variant: .tertiary) {}
                    DandoriButton("Ghost Button", variant: .ghost) {}
                }
            }
            
            // Sizes
            VStack(spacing: 16) {
                Text("Button Sizes")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton("Small", variant: .primary, size: .small) {}
                    DandoriButton("Medium", variant: .primary, size: .medium) {}
                    DandoriButton("Large", variant: .primary, size: .large) {}
                    DandoriButton("Full Width", variant: .primary, size: .fullWidth) {}
                }
            }
            
            // With Icons
            VStack(spacing: 16) {
                Text("With Icons")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton(
                        "Add Item",
                        icon: Image(systemName: "plus"),
                        variant: .primary
                    ) {}
                    
                    DandoriButton(
                        "Edit",
                        icon: Image(systemName: "pencil"),
                        variant: .secondary
                    ) {}
                    
                    DandoriButton(
                        "Delete",
                        icon: Image(systemName: "trash"),
                        variant: .ghost
                    ) {}
                }
            }
            
            // States
            VStack(spacing: 16) {
                Text("Button States")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton(
                        title: "Enabled",
                        icon: nil,
                        variant: .primary,
                        size: .medium,
                        state: .enabled
                    ) {}
                    
                    DandoriButton(
                        title: "Disabled",
                        icon: nil,
                        variant: .primary,
                        size: .medium,
                        state: .disabled
                    ) {}
                    
                    DandoriButton(
                        title: "Loading",
                        icon: nil,
                        variant: .primary,
                        size: .medium,
                        state: .loading
                    ) {}
                }
            }
            
            // Environment Override
            VStack(spacing: 16) {
                Text("Environment Override")
                    .font(.title2.weight(.semibold))
                
                VStack(spacing: 12) {
                    DandoriButton("Default Primary") {}
                    DandoriButton("Override to Secondary", variant: .primary) {}
                }
                .dandoriButtonAppearance(.secondary)
            }
        }
        .padding()
    }
}
