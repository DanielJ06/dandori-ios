import SwiftUI

// MARK: - DandoriBadge Models

/// Badge variant define o estilo visual do badge
/// Unificado para cobrir tanto badges quanto chips (anteriormente separados)
enum DandoriBadgeVariant {
    case `default`     // Fundo branco, borda bege (ex-chip outlined)
    case filled        // Fundo bege, sem borda (ex-chip neutral)
    case accent        // Com cor de accent (ex-chip accent)
    case status        // Para status (success, warning, error)
    case subtle        // Versão mais suave
}

/// Badge size define o tamanho do componente
enum DandoriBadgeSize {
    case small
    case medium
    case large
}
