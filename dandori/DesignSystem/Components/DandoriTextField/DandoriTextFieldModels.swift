import SwiftUI

// MARK: - DandoriTextField Models

enum DandoriTextFieldVariant {
    case `default`
    case filled
    case outlined
}

enum DandoriTextFieldSize {
    case medium
    case large
}

enum DandoriTextFieldState {
    case normal
    case focused
    case error
    case disabled
}
