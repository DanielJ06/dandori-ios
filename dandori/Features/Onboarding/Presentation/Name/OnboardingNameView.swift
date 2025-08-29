//
//  OnboardingNameView.swift
//  dandori
//
//  Created by Daniel Rodrigues on 29/08/25.
//

import SwiftUI

struct OnboardingNameView: View {
    @AppStorage("profile.name") private var name: String = ""
    @Environment(\.accentColor) private var accent
    let navigator: OnboardingNavigating
    
    private var isNameValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        VStack(spacing: DS.Spacing.xxl) {
            Spacer()
            
            VStack(spacing: DS.Spacing.lg) {
                DS.Eyebrow.accent("Personalização", accent: accent.base)
                
                Text("Como podemos te chamar?")
                    .font(DS.Typography.merriweather(size: .xxl, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(DS.Colors.neutral.textPrimary)
                
                Text("Queremos tornar seu roteiro mais pessoal...")
                    .font(DS.Typography.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(DS.Colors.neutral.textSecondary)
            }
            
            VStack(spacing: DS.Spacing.md) {
                TextField("Seu nome", text: $name)
                    .font(DS.Typography.body)
                    .padding(DS.Spacing.lg)
                    .background(DS.Colors.neutral.background)
                    .overlay(
                        RoundedRectangle(cornerRadius: DS.Radius.lg)
                            .stroke(
                                isNameValid ? accent.base : DS.Colors.neutral.border,
                                lineWidth: isNameValid ? 2 : 1
                            )
                    )
                    .dsCardRadius()
                
                if !name.isEmpty && !isNameValid {
                    HStack {
                        Text("Nome não pode estar vazio")
                            .font(DS.Typography.tag)
                            .foregroundColor(.red)
                        Spacer()
                    }
                }
            }
            .padding(.top, DS.Spacing.lg)
            
            Spacer()
            
            DS.Button.primary(
                "Continuar",
                size: .fullWidth,
                isDisabled: !isNameValid
            ) {
                navigator.toFinish()
            }
        }
        .dsPagePadding()
        .background(DS.Colors.neutral.background)
    }
}
