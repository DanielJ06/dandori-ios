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
        VStack(spacing: 24) {
            Text("O que torna o Dandori único")
                .multilineTextAlignment(.center)
            Text("Aqui você não só lista tarefas, você ganha um roteiro inteligente para o dia. O algoritmo considera prazos, duração, energia necessária e ambiente para criar uma sequência estratégica que evita desperdício de tempo e contexto.")
                .multilineTextAlignment(.center)
            Spacer()
            Button("Continuar") { navigator.toName() }
        }
    }
}
