//
//  OnboardingFinishView.swift
//  dandori
//
//  Created by Daniel Rodrigues on 29/08/25.
//

import SwiftUI

struct OnboardingFinishView: View {
    @AppStorage("profile.name") private var name: String = ""
    @State private var showToast = false
    @State private var showDesignSystem = false
    
    let navigator: OnboardingNavigating
    
    var body: some View {
        VStack(spacing: DS.Spacing.componentXL) {
            Spacer()
            
            VStack(spacing: DS.Spacing.componentMD) {
                Text("Finalização")
                    .font(DS.Typography.headingLarge.font)
                    .foregroundColor(DS.Colors.Content.primary)
                    .multilineTextAlignment(.center)
                
                Text("Tudo pronto\(name.isEmpty ? "" : ", \(name)")!")
                    .font(DS.Typography.headingMedium.font)
                    .foregroundColor(DS.Colors.Content.primary)
                    .multilineTextAlignment(.center)
                
                Text("Chegou a hora de planejar seu primeiro dia com o Dandori.")
                    .font(DS.Typography.bodyLarge.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(DS.Spacing.elementXS)
            }
            
            VStack(spacing: DS.Spacing.componentMD) {
                Text("Próximos Passos")
                    .font(DS.Typography.headingSmall.font)
                    .foregroundColor(DS.Colors.Content.primary)
                    .multilineTextAlignment(.center)
                
                Text("Chegou a hora de planejar seu primeiro dia com o Dandori.")
                    .font(DS.Typography.bodyMedium.font)
                    .foregroundColor(DS.Colors.Content.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(DS.Spacing.elementXS)
            }
            
            VStack(spacing: DS.Spacing.elementLG) {
                Button("Planejar meu primeiro dia") {
                    showToast = true
                }
                .font(DS.Typography.button.font)
                .foregroundColor(DS.Colors.Content.inverse)
                .padding(.horizontal, DS.Spacing.componentMD)
                .padding(.vertical, DS.Spacing.elementLG)
                .background(DS.Colors.Interactive.primary)
                .dsButtonRadius()
                
                Button("Ver Design System") {
                    showDesignSystem = true
                }
                .font(DS.Typography.button.font)
                .foregroundColor(DS.Colors.Interactive.primary)
                .padding(.horizontal, DS.Spacing.componentMD)
                .padding(.vertical, DS.Spacing.elementLG)
                .background(DS.Colors.Interactive.secondary)
                .overlay(
                    RoundedRectangle(cornerRadius: DS.Radius.medium)
                        .stroke(DS.Colors.Interactive.primary, lineWidth: 1)
                )
                .dsButtonRadius()
            }
            
            Spacer()
        }
        .dsLayoutPadding()
    }
}
