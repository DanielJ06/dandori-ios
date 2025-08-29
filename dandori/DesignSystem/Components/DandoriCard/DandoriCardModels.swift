import SwiftUI

// MARK: - DandoriCard Models

enum DandoriCardVariant {
    case `default`    // Fundo bege claro, ideal para a maioria dos cards
    case surface      // Fundo branco, para destaque
    case outlined     // Fundo transparente com borda
    case elevated     // Com sombra mais pronunciada
}

enum DandoriCardSize {
    case compact      // Padding menor
    case standard     // Padding padrão
    case comfortable  // Padding maior para dar mais "respiração"
}
