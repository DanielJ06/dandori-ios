import SwiftUI

// MARK: - DandoriBadge Models

enum DandoriBadgeVariant {
    case `default`     // Fundo branco, borda bege
    case filled        // Fundo bege, sem borda
    case accent        // Com cor de accent
    case status        // Para status (success, warning, error)
    case subtle        // Versão mais suave
}

enum DandoriBadgeSize {
    case small
    case medium
    case large
}
