import SwiftUI

/// Estrutura com todas as cores do design system
struct DSColors {
    
    /// Estrutura para cores neutras
    struct Neutral {
        static let background = Color(hex: "#ffffff")
        static let backgroundDark = Color(hex: "#0a0a0a")
        
        static let foreground = Color(hex: "#171717")
        static let foregroundDark = Color(hex: "#ededed")
        
        static let border = Color(hex: "#E3D9CB")
        
        static let textSecondary = Color(hex: "#6B6A68")
        static let textPrimary = Color(hex: "#1C1B1A")
    }
    
    /// Estrutura para cores de estado e interação
    struct States {
        static let hoverPrimary = Color(hex: "#383838")
        static let hoverPrimaryDark = Color(hex: "#cccccc")
        
        static let hoverSecondary = Color(hex: "#f2f2f2")
        static let hoverSecondaryDark = Color(hex: "#1a1a1a")
    }
}
