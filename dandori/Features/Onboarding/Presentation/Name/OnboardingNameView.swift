//
//  OnboardingNameView.swift
//  dandori
//
//  Created by Daniel Rodrigues on 29/08/25.
//

import SwiftUI

struct OnboardingNameView: View {
    @AppStorage("profile.name") private var name: String = ""
    let navigator: OnboardingNavigating
    
    private var isNameValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        VStack(spacing: DS.Spacing.componentLG) {
            Spacer()
            
            VStack(spacing: DS.Spacing.componentMD) {
                Text("Personalização")
                    .font(DS.Typography.headingLarge.font)
                    .foregroundColor(DS.Colors.Content.primary)
                    .multilineTextAlignment(.center)
                
                Text("Como podemos te chamar?")
                    .font(DS.Typography.headingMedium.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .multilineTextAlignment(.center)
                
                Text("Queremos tornar seu roteiro mais pessoal...")
                    .font(DS.Typography.bodyLarge.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(DS.Spacing.elementXS)
            }
            
            VStack(spacing: DS.Spacing.elementMD) {
                TextField("Seu nome", text: $name)
                    .font(DS.Typography.bodyLarge.font)
                    .foregroundColor(DS.Colors.Content.primary)
                    .padding(DS.Spacing.elementLG)
                    .background(DS.Colors.Surface.secondary)
                    .overlay(
                        RoundedRectangle(cornerRadius: DS.Radius.medium)
                            .stroke(DS.Colors.Border.default, lineWidth: 1)
                    )
                    .dsButtonRadius()
                
                if !name.isEmpty && !isNameValid {
                    Text("Nome não pode estar vazio")
                        .font(DS.Typography.bodySmall.font)
                        .foregroundColor(.red)
                }
            }
            
            Spacer()
            
            Button("Continuar") {
                navigator.toFinish()
            }
            .font(DS.Typography.button.font)
            .foregroundColor(isNameValid ? DS.Colors.Content.inverse : DS.Colors.Content.secondary)
            .padding(.horizontal, DS.Spacing.componentMD)
            .padding(.vertical, DS.Spacing.elementLG)
            .background(isNameValid ? DS.Colors.Interactive.primary : DS.Colors.Surface.tertiary)
            .dsButtonRadius()
            .disabled(!isNameValid)
        }
        .dsLayoutPadding()
    }
}
