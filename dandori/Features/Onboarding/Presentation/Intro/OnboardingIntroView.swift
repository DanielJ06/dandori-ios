//
//  OnboardingIntroView.swift
//  dandori
//
//  Created by Daniel Rodrigues on 29/08/25.
//

import SwiftUI

struct OnboardingIntroView: View {
    let navigator: OnboardingNavigating
    
    var body: some View {
        VStack(spacing: DS.Spacing.componentLG) {
            Spacer()
            
            VStack(spacing: DS.Spacing.componentMD) {
                Text("Bem-vindo ao Dandori")
                    .font(DS.Typography.display.font)
                    .foregroundColor(DS.Colors.Content.primary)
                    .multilineTextAlignment(.center)
                
                Text("Menos listas, mais clareza")
                    .font(DS.Typography.headingMedium.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .multilineTextAlignment(.center)
                
                Text("Em vez de ficar preso em listas intermináveis, o Dandori transforma suas tarefas em um roteiro inteligente: a sequência certa, com explicações simples, para que você saiba exatamente por onde começar.")
                    .font(DS.Typography.bodyLarge.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(DS.Spacing.elementXS)
            }
            
            Spacer()
            
            Button("Continuar") {
                navigator.toPhilosophy()
            }
            .font(DS.Typography.button.font)
            .foregroundColor(DS.Colors.Content.inverse)
            .padding(.horizontal, DS.Spacing.componentMD)
            .padding(.vertical, DS.Spacing.elementLG)
            .background(DS.Colors.Interactive.primary)
            .dsButtonRadius()
        }
        .dsLayoutPadding()
    }
}
