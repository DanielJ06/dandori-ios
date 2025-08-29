import SwiftUI

/// Utilitário para carregar e registrar fontes customizadas
struct DSFontLoader {
    
    /// Registra todas as fontes customizadas do Design System
    static func loadFonts() {
        let fonts = [
            "Inter-Regular",
            "Inter-Medium", 
            "Inter-SemiBold",
            "Inter-Bold",
            "Merriweather-Regular",
            "Merriweather-Bold"
        ]
        
        for fontName in fonts {
            registerFont(fontName: fontName)
        }
    }
    
    /// Registra uma fonte específica
    private static func registerFont(fontName: String) {
        guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: "ttf"),
              let fontData = NSData(contentsOf: fontURL),
              let provider = CGDataProvider(data: fontData),
              let font = CGFont(provider) else {
            return
        }
        
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
