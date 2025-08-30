import SwiftUI

// MARK: - DandoriToast Component

/**
 * A customizable toast notification component that follows Dandori Design System guidelines.
 * 
 * This component provides a clean, accessible toast interface for displaying
 * temporary messages with various visual styles and optional actions.
 *
 * ## Usage
 * ```swift
 * DandoriToast(
 *     message: "Operation completed successfully!",
 *     variant: .success,
 *     icon: Image(systemName: "checkmark.circle")
 * )
 * ```
 *
 * ## Features
 * - Multiple visual variants (info, success, warning, error)
 * - Optional icon support
 * - Optional close action
 * - Environment-based appearance override
 * - Consistent styling and spacing
 * - Shadow and border support
 * - Accessibility support
 *
 * - Parameters:
 *   - message: The toast message text
 *   - variant: Visual style variant
 *   - icon: Optional icon to display
 *   - action: Optional closure for close action
 */
struct DandoriToast: View {
    let message: String
    let variant: DandoriToastVariant
    let icon: Image?
    let action: (() -> Void)?
    
    @Environment(\.dandoriToastVariant) private var envVariant
    
    private var layout: DandoriToastLayout {
        DandoriToastLayout(variant: envVariant)
    }
    
    var body: some View {
        HStack(spacing: DSTokens.Spacing.elementMD) {
            if let icon = icon {
                icon
                    .foregroundColor(layout.iconColor)
                    .frame(width: 20, height: 20)
            }
            
            Text(message)
                .font(layout.typography.font)
                .foregroundColor(layout.textColor)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            if let action = action {
                Button(action: action) {
                    Image(systemName: "xmark")
                        .font(.caption.weight(.medium))
                        .foregroundColor(layout.closeButtonColor)
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Fechar")
            }
        }
        .padding(.horizontal, layout.horizontalPadding)
        .padding(.vertical, layout.verticalPadding)
        .background(layout.backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: layout.cornerRadius)
                .stroke(layout.borderColor, lineWidth: layout.borderWidth)
        )
        .clipShape(RoundedRectangle(cornerRadius: layout.cornerRadius))
        .shadow(color: layout.shadowColor, radius: layout.shadowRadius, x: 0, y: layout.shadowY)
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Toast Manager

/**
 * A manager class for handling toast notifications throughout the app.
 * 
 * This class provides methods to show and dismiss toast notifications
 * with automatic timing and animation support.
 */
@MainActor
class DandoriToastManager: ObservableObject {
    @Published var toast: DandoriToastData?
    
    /**
     * Shows a toast notification with the specified parameters.
     *
     * - Parameters:
     *   - message: The toast message text
     *   - variant: Visual style variant (default: .info)
     *   - icon: Optional icon to display
     *   - duration: How long to show the toast (default: 3.0 seconds)
     */
    func show(
        message: String,
        variant: DandoriToastVariant = .info,
        icon: Image? = nil,
        duration: TimeInterval = 3.0
    ) {
        toast = DandoriToastData(
            message: message,
            variant: variant,
            icon: icon
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.dismiss()
        }
    }
    
    /**
     * Dismisses the current toast notification with animation.
     */
    func dismiss() {
        withAnimation(.easeInOut(duration: 0.3)) {
            toast = nil
        }
    }
}

/**
 * Data structure for toast notification content.
 *
 * - Parameters:
 *   - message: The toast message text
 *   - variant: Visual style variant
 *   - icon: Optional icon to display
 */
struct DandoriToastData {
    let message: String
    let variant: DandoriToastVariant
    let icon: Image?
}

// MARK: - Toast View Modifier

/**
 * A view modifier that adds toast notification support to any view.
 *
 * - Parameters:
 *   - toastManager: The toast manager instance to use
 */
struct DandoriToastViewModifier: ViewModifier {
    @ObservedObject var toastManager: DandoriToastManager
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if let toast = toastManager.toast {
                VStack {
                    Spacer()
                    
                    DandoriToast(
                        message: toast.message,
                        variant: toast.variant,
                        icon: toast.icon,
                        action: {
                            toastManager.dismiss()
                        }
                    )
                    .padding(.horizontal)
                    .padding(.bottom, 50)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .zIndex(1000)
            }
        }
    }
}

extension View {
    /**
     * Adds toast notification support to the view.
     *
     * - Parameters:
     *   - manager: The toast manager instance to use
     * - Returns: A view with toast notification support
     */
    func dandoriToast(manager: DandoriToastManager) -> some View {
        modifier(DandoriToastViewModifier(toastManager: manager))
    }
}
