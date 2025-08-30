import SwiftUI

// MARK: - DandoriTaskCard Environment

/// Environment key para configurações do DandoriTaskCard
private struct DandoriTaskCardAppearanceKey: EnvironmentKey {
    static let defaultValue: DandoriTaskCardAppearance? = nil
}

extension EnvironmentValues {
    var dandoriTaskCardAppearance: DandoriTaskCardAppearance? {
        get { self[DandoriTaskCardAppearanceKey.self] }
        set { self[DandoriTaskCardAppearanceKey.self] = newValue }
    }
}

// MARK: - DandoriTaskCard Appearance

struct DandoriTaskCardAppearance {
    let isFlashing: Bool
    let backgroundColor: Color?
    let borderColor: Color?
    
    init(
        isFlashing: Bool = false,
        backgroundColor: Color? = nil,
        borderColor: Color? = nil
    ) {
        self.isFlashing = isFlashing
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
    }
}

// MARK: - View Extension

extension View {
    func dandoriTaskCardAppearance(_ appearance: DandoriTaskCardAppearance) -> some View {
        environment(\.dandoriTaskCardAppearance, appearance)
    }
    
    func dandoriTaskCardFlashing(_ isFlashing: Bool = true) -> some View {
        dandoriTaskCardAppearance(DandoriTaskCardAppearance(isFlashing: isFlashing))
    }
}
