import SwiftUI

// MARK: - DandoriTaskCard Models

struct DandoriTaskCardModel {
    let badgeText: String?
    let title: String?
    let duration: String?
    let chips: [DandoriBadgeModel]
    let isFlashing: Bool
    
    init(
        badgeText: String? = nil,
        title: String? = nil,
        duration: String? = nil,
        chips: [DandoriBadgeModel] = [],
        isFlashing: Bool = false
    ) {
        self.badgeText = badgeText
        self.title = title
        self.duration = duration
        self.chips = chips
        self.isFlashing = isFlashing
    }
}

struct DandoriBadgeModel: Identifiable {
    let id = UUID()
    let text: String
    let variant: DandoriBadgeVariant
    
    init(text: String, variant: DandoriBadgeVariant = .filled) {
        self.text = text
        self.variant = variant
    }
}

// MARK: - DandoriTaskCard Actions

struct DandoriTaskCardActions {
    let onDone: () -> Void
    let onSkip: () -> Void
    let onReplan: () -> Void
    
    static let empty = DandoriTaskCardActions(
        onDone: {},
        onSkip: {},
        onReplan: {}
    )
}
