import SwiftUI

/// Componentes básicos refatorados seguindo Clean Architecture
/// Cada componente tem responsabilidade única e é facilmente testável

extension DS {
    
    // MARK: - Button Component
    
    struct Button {
        enum Variant {
            case primary
            case secondary
            case tertiary
        }
        
        enum Size {
            case small
            case medium
            case large
            case fullWidth
        }
        
        enum State {
            case enabled
            case disabled
            case loading
        }
        
        static func create(
            _ title: String,
            variant: Variant = .primary,
            size: Size = .medium,
            state: State = .enabled,
            action: @escaping () -> Void
        ) -> some View {
            DSButtonView(
                title: title,
                variant: variant,
                size: size,
                state: state,
                action: action
            )
        }
    }
    
    // MARK: - Text Component
    
    struct Text {
        enum Variant {
            case display
            case headingLarge
            case headingMedium  
            case headingSmall
            case bodyLarge
            case bodyMedium
            case bodySmall
            case button
            case label
            case caption
        }
        
        enum Color {
            case primary
            case secondary
            case inverse
            case accent
        }
        
        static func create(
            _ text: String,
            variant: Variant = .bodyMedium,
            color: Color = .primary
        ) -> some View {
            DSTextView(
                text: text,
                variant: variant,
                color: color
            )
        }
    }
    
    // MARK: - Card Component
    
    struct Card {
        enum Variant {
            case `default`
            case elevated
            case outlined
        }
        
        static func create<Content: View>(
            variant: Variant = .default,
            @ViewBuilder content: @escaping () -> Content
        ) -> some View {
            DSCardView(variant: variant, content: content)
        }
    }
    
    // MARK: - Tag Component
    
    struct Tag {
        enum Variant {
            case accent
            case neutral
            case outlined
        }
        
        enum Size {
            case small
            case medium
        }
        
        static func create(
            _ text: String,
            variant: Variant = .neutral,
            size: Size = .medium
        ) -> some View {
            DSTagView(
                text: text,
                variant: variant,
                size: size
            )
        }
    }
}

// MARK: - Implementation Views

private struct DSButtonView: View {
    let title: String
    let variant: DS.Button.Variant
    let size: DS.Button.Size
    let state: DS.Button.State
    let action: () -> Void
    
    @EnvironmentObject private var theme: DSThemeProvider
    
    var body: some View {
        SwiftUI.Button(action: action) {
            SwiftUI.Text(title)
                .font(DSTokens.Typography.button.font)
                .foregroundColor(foregroundColor)
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(maxWidth: size == .fullWidth ? .infinity : nil)
        }
        .background(backgroundColor)
        .dsButtonRadius()
        .disabled(state == .disabled)
    }
    
    private var foregroundColor: SwiftUI.Color {
        switch (variant, state) {
        case (.primary, .enabled):
            return DS.Colors.Content.inverse
        case (.primary, .disabled):
            return DS.Colors.Content.secondary
        case (.secondary, _):
            return theme.currentAccent.token.base
        case (.tertiary, _):
            return DS.Colors.Content.primary
        case (.primary, .loading):
            return DS.Colors.Content.inverse
        }
    }
    
    private var backgroundColor: SwiftUI.Color {
        switch (variant, state) {
        case (.primary, .enabled):
            return theme.currentAccent.token.base
        case (.primary, .disabled):
            return DS.Colors.Interactive.secondary
        case (.secondary, _):
            return SwiftUI.Color.clear
        case (.tertiary, _):
            return DS.Colors.Interactive.secondary
        case (.primary, .loading):
            return theme.currentAccent.token.base.opacity(0.8)
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .small: return DS.Spacing.elementMD
        case .medium, .fullWidth: return DS.Spacing.componentSM
        case .large: return DS.Spacing.componentMD
        }
    }
    
    private var verticalPadding: CGFloat {
        switch size {
        case .small: return DS.Spacing.elementSM
        case .medium, .fullWidth: return DS.Spacing.elementMD
        case .large: return DS.Spacing.elementLG
        }
    }
}

private struct DSTextView: View {
    let text: String
    let variant: DS.Text.Variant
    let color: DS.Text.Color
    
    @EnvironmentObject private var theme: DSThemeProvider
    
    var body: some View {
        SwiftUI.Text(text)
            .font(typographyToken.font)
            .foregroundColor(foregroundColor)
    }
    
    private var typographyToken: TypographyToken {
        switch variant {
        case .display: return DSTokens.Typography.display
        case .headingLarge: return DSTokens.Typography.headingLarge
        case .headingMedium: return DSTokens.Typography.headingMedium
        case .headingSmall: return DSTokens.Typography.headingSmall
        case .bodyLarge: return DSTokens.Typography.bodyLarge
        case .bodyMedium: return DSTokens.Typography.bodyMedium
        case .bodySmall: return DSTokens.Typography.bodySmall
        case .button: return DSTokens.Typography.button
        case .label: return DSTokens.Typography.label
        case .caption: return DSTokens.Typography.caption
        }
    }
    
    private var foregroundColor: SwiftUI.Color {
        switch color {
        case .primary: return DS.Colors.Content.primary
        case .secondary: return DS.Colors.Content.secondary
        case .inverse: return DS.Colors.Content.inverse
        case .accent: return theme.currentAccent.token.base
        }
    }
}

private struct DSCardView<Content: View>: View {
    let variant: DS.Card.Variant
    let content: () -> Content
    
    var body: some View {
        content()
            .dsComponentPadding()
            .background(backgroundColor)
            .dsCardRadius()
            .overlay(
                RoundedRectangle(cornerRadius: DS.Radius.large)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
    }
    
    private var backgroundColor: SwiftUI.Color {
        switch variant {
        case .default, .elevated:
            return DS.Colors.Surface.primary
        case .outlined:
            return SwiftUI.Color.clear
        }
    }
    
    private var borderColor: SwiftUI.Color {
        switch variant {
        case .outlined:
            return DS.Colors.Border.default
        case .default, .elevated:
            return SwiftUI.Color.clear
        }
    }
    
    private var borderWidth: CGFloat {
        variant == .outlined ? 1 : 0
    }
}

private struct DSTagView: View {
    let text: String
    let variant: DS.Tag.Variant
    let size: DS.Tag.Size
    
    @EnvironmentObject private var theme: DSThemeProvider
    
    var body: some View {
        SwiftUI.Text(text)
            .font(DSTokens.Typography.label.font)
            .foregroundColor(foregroundColor)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: DS.Radius.small))
            .overlay(
                RoundedRectangle(cornerRadius: DS.Radius.small)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
    }
    
    private var foregroundColor: SwiftUI.Color {
        switch variant {
        case .accent:
            return theme.currentAccent.token.text
        case .neutral, .outlined:
            return DS.Colors.Content.primary
        }
    }
    
    private var backgroundColor: SwiftUI.Color {
        switch variant {
        case .accent:
            return theme.currentAccent.token.light
        case .neutral:
            return DS.Colors.Surface.secondary
        case .outlined:
            return SwiftUI.Color.clear
        }
    }
    
    private var borderColor: SwiftUI.Color {
        switch variant {
        case .outlined:
            return DS.Colors.Border.default
        case .accent, .neutral:
            return SwiftUI.Color.clear
        }
    }
    
    private var borderWidth: CGFloat {
        variant == .outlined ? 1 : 0
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .small: return DS.Spacing.elementSM
        case .medium: return DS.Spacing.elementMD
        }
    }
    
    private var verticalPadding: CGFloat {
        switch size {
        case .small: return DS.Spacing.elementXS
        case .medium: return DS.Spacing.elementSM
        }
    }
}
