//
//  OnboardingPhilosophyView.swift
//  dandori
//
//  Created by Daniel Rodrigues on 29/08/25.
//

import SwiftUI

struct OnboardingPhilosophyView: View {
    let navigator: OnboardingNavigating
    
    var body: some View {
        VStack(spacing: DS.Spacing.componentLG) {
            Spacer()
            
            VStack(spacing: DS.Spacing.componentMD) {
                Text("O que torna o Dandori único")
                    .font(DS.Typography.headingLarge.font)
                    .foregroundColor(DS.Colors.Content.primary)
                    .multilineTextAlignment(.center)
                
                Text("Aqui você não só lista tarefas, você ganha um roteiro inteligente para o dia. O algoritmo considera prazos, duração, energia necessária e ambiente para criar uma sequência estratégica que evita desperdício de tempo e contexto.")
                    .font(DS.Typography.bodyLarge.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(DS.Spacing.elementXS)
            }
            
            Spacer()
            
            Button("Continuar") {
                navigator.toName()
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
