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
        VStack(spacing: DS.Spacing.xxl) {
            Spacer()
            
            VStack(spacing: DS.Spacing.lg) {
                DS.Eyebrow.default("Bem-vindo ao Dandori")
                
                Text("Menos listas, mais clareza")
                    .font(DS.Typography.merriweather(size: .xxxl, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(DS.Colors.neutral.textPrimary)
                
                Text("Em vez de ficar preso em listas intermináveis, o Dandori transforma suas tarefas em um roteiro inteligente: a sequência certa, com explicações simples, para que você saiba exatamente por onde começar.")
                    .font(DS.Typography.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(DS.Colors.neutral.textSecondary)
                    .lineSpacing(4)
            }
            
            Spacer()
            
            DS.Button.primary("Continuar", size: .fullWidth, action: {
                navigator.toPhilosophy()
            })
        }
        .dsPagePadding()
        .background(DS.Colors.neutral.background)
        .navigationTitle("Onboarding")
    }
}
