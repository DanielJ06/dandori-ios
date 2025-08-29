import SwiftUI

// MARK: - Dandori Components Preview

/// Preview simples e direto dos componentes do Design System Dandori
/// Demonstra o uso dos componentes sem complexidade desnecessária
struct DandoriComponentsPreview: View {
    @State private var selectedSegment = 0
    @State private var textFieldText = ""
    @StateObject private var toastManager = DandoriToastManager()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                Text("Dandori Design System Components")
                    .font(DSTokens.Typography.headingLarge.font)
                    .foregroundColor(DSTokens.Colors.Content.primary)
                    .padding(.top)
                
                // Buttons
                VStack(spacing: 16) {
                    Text("Buttons").font(.title2.weight(.semibold))
                    
                    VStack(spacing: 12) {
                        DandoriButton("Primary Button", variant: .primary) {
                            toastManager.show(message: "Primary button pressed!", variant: .success)
                        }
                        
                        DandoriButton("Secondary Button", variant: .secondary) {
                            toastManager.show(message: "Secondary button pressed!", variant: .info)
                        }
                        
                        DandoriButton(
                            "Button with Icon",
                            icon: Image(systemName: "plus"),
                            variant: .primary
                        ) {
                            toastManager.show(message: "Icon button pressed!", variant: .success)
                        }
                    }
                }
                
                // Text Fields
                VStack(spacing: 16) {
                    Text("Text Fields").font(.title2.weight(.semibold))
                    
                    VStack(spacing: 12) {
                        DandoriTextField(
                            text: $textFieldText,
                            placeholder: "Digite algo aqui...",
                            variant: .default,
                            size: .medium
                        )
                        
                        DandoriTextField(
                            text: .constant(""),
                            placeholder: "Email",
                            icon: Image(systemName: "envelope"),
                            variant: .filled,
                            size: .medium,
                            helperText: "Digite seu email"
                        )
                    }
                }
                
                // Segmented Control
                VStack(spacing: 16) {
                    Text("Segmented Control").font(.title2.weight(.semibold))
                    
                    DandoriSegmented(
                        selection: $selectedSegment,
                        options: ["Agora", "Próximas", "Todas"],
                        variant: .default
                    )
                }
                
                // Chips
                VStack(spacing: 16) {
                    Text("Chips").font(.title2.weight(.semibold))
                    
                    HStack(spacing: 12) {
                        DandoriChip(text: "Accent", variant: .accent, size: .medium)
                        DandoriChip(text: "Neutral", variant: .neutral, size: .medium)
                        DandoriChip(text: "Outlined", variant: .outlined, size: .medium)
                    }
                }
                
                // Badges
                VStack(spacing: 16) {
                    Text("Badges").font(.title2.weight(.semibold))
                    
                    VStack(spacing: 12) {
                        HStack(spacing: 12) {
                            DandoriBadge("Default", variant: .default)
                            DandoriBadge("Filled", variant: .filled)
                            DandoriBadge("Accent", variant: .accent)
                        }
                        
                        HStack(spacing: 12) {
                            DandoriTimeBadge(text: "Agora", isActive: true)
                            DandoriStatusBadge(status: .completed)
                            DandoriCategoryBadge(category: "Trabalho", color: .teal)
                        }
                    }
                }
                
                // Cards
                VStack(spacing: 16) {
                    Text("Cards").font(.title2.weight(.semibold))
                    
                    VStack(spacing: 12) {
                        DandoriCard(variant: .default, size: .standard) {
                            cardContent(title: "Default Card", subtitle: "Fundo bege claro")
                        }
                        
                        DandoriCard(variant: .surface, size: .standard) {
                            cardContent(title: "Surface Card", subtitle: "Fundo branco")
                        }
                        
                        DandoriCard(variant: .elevated, size: .standard) {
                            cardContent(title: "Elevated Card", subtitle: "Com sombra")
                        }
                    }
                }
                
                // Toasts
                VStack(spacing: 16) {
                    Text("Toasts").font(.title2.weight(.semibold))
                    
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            Button("Info") {
                                toastManager.show(message: "Informação importante", variant: .info)
                            }
                            .buttonStyle(.bordered)
                            
                            Button("Success") {
                                toastManager.show(message: "Operação realizada com sucesso!", variant: .success)
                            }
                            .buttonStyle(.bordered)
                        }
                        
                        HStack(spacing: 12) {
                            Button("Warning") {
                                toastManager.show(message: "Atenção: verifique suas configurações", variant: .warning)
                            }
                            .buttonStyle(.bordered)
                            
                            Button("Error") {
                                toastManager.show(message: "Erro: operação falhou", variant: .error)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
                
                Spacer(minLength: 100)
            }
            .padding()
        }
        .dandoriToast(manager: toastManager)
    }
    
    @ViewBuilder
    private func cardContent(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(DSTokens.Typography.headingSmall.font)
                .foregroundColor(DSTokens.Colors.Content.primary)
            
            Text(subtitle)
                .font(DSTokens.Typography.bodyMedium.font)
                .foregroundColor(DSTokens.Colors.Content.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview("Dandori Components") {
    DandoriComponentsPreview()
}
