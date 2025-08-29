//
//  OnboardingFinishView.swift
//  dandori
//
//  Created by Daniel Rodrigues on 29/08/25.
//

import SwiftUI

struct OnboardingFinishView: View {
    @AppStorage("profile.name") private var name: String = ""
    @Environment(\.accentColor) private var accent
    @State private var showToast = false
    @State private var showDesignSystem = false
    
    let navigator: OnboardingNavigating
    
    var body: some View {
        VStack(spacing: DS.Spacing.xxl) {
            Spacer()
            
            VStack(spacing: DS.Spacing.lg) {
                DS.Eyebrow.accent("Finalização", accent: accent.base)
                
                Text("Tudo pronto\(name.isEmpty ? "" : ", \(name)")!")
                    .font(DS.Typography.merriweather(size: .xxl, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(DS.Colors.neutral.textPrimary)
                
                Text("Chegou a hora de planejar seu primeiro dia com o Dandori.")
                    .font(DS.Typography.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(DS.Colors.neutral.textSecondary)
                    .lineSpacing(4)
            }
            
            // Card de exemplo
            DS.UnifiedCard.withMultipleActions(
                title: "Próximos Passos",
                subtitle: "Chegou a hora de planejar seu primeiro dia com o Dandori.",
                tags: ["Planejamento", "Primeiro Dia"],
                actions: [
                    DS.UnifiedCard.CardAction(title: "Planejar meu primeiro dia", isPrimary: true) {
                        showToast = true
                    },
                    DS.UnifiedCard.CardAction(title: "Ver Design System") {
                        showDesignSystem = true
                    }
                ]
            )
            
            Spacer()
        }
        .dsPagePadding()
        .background(DS.Colors.neutral.background)
    }
}
