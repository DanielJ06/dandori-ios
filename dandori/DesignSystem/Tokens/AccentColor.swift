import SwiftUI

/// Enum para acentos dinâmicos disponíveis no app
enum AccentColor: String, CaseIterable {
    case teal
    case sage
    case turquoise
    
    /// Cor base do acento
    var base: Color {
        switch self {
        case .teal:
            return Color(hex: "#2BA69A")
        case .sage:
            return Color(hex: "#7CAB89")
        case .turquoise:
            return Color(hex: "#3AAFB9")
        }
    }
    
    /// Cor clara do acento (para fundos)
    var light: Color {
        switch self {
        case .teal:
            return Color(hex: "#E5F6F3")
        case .sage:
            return Color(hex: "#E3F1E8")
        case .turquoise:
            return Color(hex: "#E6F7F9")
        }
    }
    
    /// Cor do texto sobre acento claro
    var text: Color {
        switch self {
        case .teal:
            return Color(hex: "#0E5E57")
        case .sage:
            return Color(hex: "#244C37")
        case .turquoise:
            return Color(hex: "#0B4F57")
        }
    }
}

/// Extension para facilitar criação de cores a partir de hex
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
