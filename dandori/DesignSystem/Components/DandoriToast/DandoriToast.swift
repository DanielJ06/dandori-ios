import SwiftUI

// MARK: - DandoriToast Component

/// Toast component seguindo as diretrizes do Design System Dandori
/// Implementa visual alinhado com a versão web usando tokens atualizados
struct DandoriToast: View {
    let message: String
    let variant: DandoriToastVariant
    let icon: Image?
    let action: (() -> Void)?
    
    @Environment(\.dandoriToastAppearance) private var envVariant
    
    private var layout: DandoriToastLayout {
        DandoriToastLayout(variant: envVariant ?? variant)
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
                .foregroundColor(layout.foregroundColor)
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

@MainActor
class DandoriToastManager: ObservableObject {
    @Published var toast: DandoriToastData?
    
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
    
    func dismiss() {
        withAnimation(.easeInOut(duration: 0.3)) {
            toast = nil
        }
    }
}

struct DandoriToastData {
    let message: String
    let variant: DandoriToastVariant
    let icon: Image?
}

// MARK: - Toast View Modifier

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
    func dandoriToast(manager: DandoriToastManager) -> some View {
        modifier(DandoriToastViewModifier(toastManager: manager))
    }
}
