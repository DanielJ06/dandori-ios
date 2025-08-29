//
//  OnboardingRoute.swift
//  dandori
//
//  Created by Daniel Rodrigues on 29/08/25.
//


import Foundation
import SwiftUI

enum OnboardingRoute: Route {
    static let namespace = "onboarding"
    case intro
    case philosophy
    case nameEntry
    case finish
}

struct OnboardingRegistration {
    static func register(into registry: RouteRegistry) {
        registry.registerView(OnboardingRoute.self) { route, router in
            let nav = OnboardingNavigator(router: router)
            switch route {
            case .intro:
                OnboardingIntroView(navigator: nav)
            case .philosophy:
                OnboardingPhilosophyView(navigator: nav)
            case .nameEntry:
                OnboardingNameView(navigator: nav)
            case .finish:
                OnboardingFinishView(navigator: nav)
            }
        }
    }
}

