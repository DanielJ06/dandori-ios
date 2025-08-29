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

// MARK: - Convenience Initializers

extension DandoriButton {
    init(
        _ title: String,
        variant: DandoriButtonVariant = .primary,
        size: DandoriButtonSize = .medium,
        action: @escaping () -> Void
    ) {
        self.init(
            title: title,
            icon: nil,
            variant: variant,
            size: size,
            state: .enabled,
            action: action
        )
    }
    
    init(
        _ title: String,
        icon: Image,
        variant: DandoriButtonVariant = .primary,
        size: DandoriButtonSize = .medium,
        action: @escaping () -> Void
    ) {
        self.init(
            title: title,
            icon: icon,
            variant: variant,
            size: size,
            state: .enabled,
            action: action
        )
    }
}
