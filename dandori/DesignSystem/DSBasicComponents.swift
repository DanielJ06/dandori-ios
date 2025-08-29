import SwiftUI

/// Componentes básicos temporários usando apenas tokens
/// Estes são componentes mínimos para manter o projeto funcional
/// enquanto focamos nos tokens fundamentais

extension DS {
    
    // MARK: - Button
    
    struct Button {
        static func primary(
            _ title: String,
            size: ButtonSize = .regular,
            isDisabled: Bool = false,
            action: @escaping () -> Void
        ) -> some View {
            SwiftUI.Button(action: action) {
                Text(title)
                    .font(DS.Typography.button)
                    .foregroundColor(isDisabled ? DS.Colors.neutral.textSecondary : .white)
                    .frame(maxWidth: size == .fullWidth ? .infinity : nil)
                    .padding(.vertical, DS.Spacing.sm)
                    .padding(.horizontal, DS.Spacing.md)
                    .background(
                        RoundedRectangle(cornerRadius: DS.Radius.md)
                            .fill(isDisabled ? DS.Colors.neutral.border : Color.accentColor)
                    )
            }
            .disabled(isDisabled)
        }
        
        static func secondary(
            _ title: String,
            size: ButtonSize = .regular,
            isDisabled: Bool = false,
            action: @escaping () -> Void
        ) -> some View {
            SwiftUI.Button(action: action) {
                Text(title)
                    .font(DS.Typography.button)
                    .foregroundColor(isDisabled ? DS.Colors.neutral.textSecondary : Color.accentColor)
                    .frame(maxWidth: size == .fullWidth ? .infinity : nil)
                    .padding(.vertical, DS.Spacing.sm)
                    .padding(.horizontal, DS.Spacing.md)
                    .background(
                        RoundedRectangle(cornerRadius: DS.Radius.md)
                            .stroke(isDisabled ? DS.Colors.neutral.border : Color.accentColor, lineWidth: 1)
                    )
            }
            .disabled(isDisabled)
        }
        
        enum ButtonSize {
            case regular, fullWidth
        }
    }
    
    // MARK: - Eyebrow
    
    struct Eyebrow {
        static func `default`(_ text: String) -> some View {
            Text(text.uppercased())
                .font(DS.Typography.eyebrow)
                .foregroundColor(DS.Colors.neutral.textSecondary)
        }
        
        static func accent(_ text: String, accent: Color? = nil) -> some View {
            Text(text.uppercased())
                .font(DS.Typography.eyebrow)
                .foregroundColor(accent ?? Color.accentColor)
        }
    }
    
    // MARK: - Tag
    
    struct Tag {
        static func accent(_ text: String) -> some View {
            Text(text)
                .font(DS.Typography.tag)
                .foregroundColor(Color.accentColor)
                .padding(.vertical, 2)
                .padding(.horizontal, DS.Spacing.sm)
                .background(
                    RoundedRectangle(cornerRadius: DS.Radius.sm)
                        .fill(Color.accentColor.opacity(0.1))
                )
        }
        
        static func neutral(_ text: String) -> some View {
            Text(text)
                .font(DS.Typography.tag)
                .foregroundColor(DS.Colors.neutral.textPrimary)
                .padding(.vertical, 2)
                .padding(.horizontal, DS.Spacing.sm)
                .background(
                    RoundedRectangle(cornerRadius: DS.Radius.sm)
                        .fill(DS.Colors.neutral.background)
                )
        }
    }
    
    // MARK: - Chip
    
    struct Chip {
        static func display(_ text: String) -> some View {
            Text(text)
                .font(DS.Typography.tag)
                .foregroundColor(DS.Colors.neutral.textPrimary)
                .padding(.vertical, DS.Spacing.xs)
                .padding(.horizontal, DS.Spacing.md)
                .background(
                    Capsule()
                        .fill(DS.Colors.neutral.background)
                )
        }
        
        static func selectable(
            _ text: String,
            isSelected: Bool,
            action: @escaping () -> Void
        ) -> some View {
            SwiftUI.Button(action: action) {
                Text(text)
                    .font(DS.Typography.tag)
                    .foregroundColor(isSelected ? .white : DS.Colors.neutral.textPrimary)
                    .padding(.vertical, DS.Spacing.xs)
                    .padding(.horizontal, DS.Spacing.md)
                    .background(
                        Capsule()
                            .fill(isSelected ? Color.accentColor : DS.Colors.neutral.background)
                    )
            }
        }
    }
    
    // MARK: - ChipGroup
    
    struct ChipGroup {
        static func singleSelection(
            options: [String],
            selectedOption: Binding<String?>,
            spacing: CGFloat = DS.Spacing.sm
        ) -> some View {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: spacing) {
                ForEach(options, id: \.self) { option in
                    DS.Chip.selectable(
                        option,
                        isSelected: selectedOption.wrappedValue == option
                    ) {
                        selectedOption.wrappedValue = option
                    }
                }
            }
        }
        
        static func multipleSelection(
            options: [String],
            selectedOptions: Binding<Set<String>>,
            spacing: CGFloat = DS.Spacing.sm
        ) -> some View {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: spacing) {
                ForEach(options, id: \.self) { option in
                    DS.Chip.selectable(
                        option,
                        isSelected: selectedOptions.wrappedValue.contains(option)
                    ) {
                        if selectedOptions.wrappedValue.contains(option) {
                            selectedOptions.wrappedValue.remove(option)
                        } else {
                            selectedOptions.wrappedValue.insert(option)
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UnifiedCard
    
    struct UnifiedCard {
        static func simple(
            title: String,
            subtitle: String? = nil
        ) -> some View {
            VStack(alignment: .leading, spacing: DS.Spacing.sm) {
                Text(title)
                    .font(DS.Typography.cardTitle)
                    .foregroundColor(DS.Colors.neutral.textPrimary)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(DS.Typography.body)
                        .foregroundColor(DS.Colors.neutral.textSecondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(DS.Spacing.lg)
            .background(
                RoundedRectangle(cornerRadius: DS.Radius.lg)
                    .fill(DS.Colors.neutral.background)
                    .stroke(DS.Colors.neutral.border, lineWidth: 1)
            )
        }
        
        static func withButton(
            title: String,
            subtitle: String? = nil,
            tags: [String] = [],
            buttonTitle: String,
            buttonAction: @escaping () -> Void
        ) -> some View {
            VStack(alignment: .leading, spacing: DS.Spacing.md) {
                VStack(alignment: .leading, spacing: DS.Spacing.sm) {
                    Text(title)
                        .font(DS.Typography.cardTitle)
                        .foregroundColor(DS.Colors.neutral.textPrimary)
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(DS.Typography.body)
                            .foregroundColor(DS.Colors.neutral.textSecondary)
                    }
                    
                    if !tags.isEmpty {
                        HStack(spacing: DS.Spacing.xs) {
                            ForEach(tags, id: \.self) { tag in
                                DS.Tag.neutral(tag)
                            }
                        }
                    }
                }
                
                DS.Button.primary(buttonTitle, size: .fullWidth, action: buttonAction)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(DS.Spacing.lg)
            .background(
                RoundedRectangle(cornerRadius: DS.Radius.lg)
                    .fill(DS.Colors.neutral.background)
                    .stroke(DS.Colors.neutral.border, lineWidth: 1)
            )
        }
        
        static func withMultipleActions(
            title: String,
            subtitle: String? = nil,
            tags: [String] = [],
            actions: [CardAction]
        ) -> some View {
            VStack(alignment: .leading, spacing: DS.Spacing.md) {
                VStack(alignment: .leading, spacing: DS.Spacing.sm) {
                    Text(title)
                        .font(DS.Typography.cardTitle)
                        .foregroundColor(DS.Colors.neutral.textPrimary)
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(DS.Typography.body)
                            .foregroundColor(DS.Colors.neutral.textSecondary)
                    }
                    
                    if !tags.isEmpty {
                        HStack(spacing: DS.Spacing.xs) {
                            ForEach(tags, id: \.self) { tag in
                                DS.Tag.neutral(tag)
                            }
                        }
                    }
                }
                
                VStack(spacing: DS.Spacing.sm) {
                    ForEach(actions, id: \.title) { action in
                        if action.isPrimary {
                            DS.Button.primary(action.title, size: .fullWidth, action: action.action)
                        } else {
                            DS.Button.secondary(action.title, size: .fullWidth, action: action.action)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(DS.Spacing.lg)
            .background(
                RoundedRectangle(cornerRadius: DS.Radius.lg)
                    .fill(DS.Colors.neutral.background)
                    .stroke(DS.Colors.neutral.border, lineWidth: 1)
            )
        }
        
        struct CardAction {
            let title: String
            let isPrimary: Bool
            let action: () -> Void
            
            init(title: String, isPrimary: Bool = false, action: @escaping () -> Void) {
                self.title = title
                self.isPrimary = isPrimary
                self.action = action
            }
        }
    }
}
