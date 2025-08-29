//
//  RootView.swift
//  dandori
//
//  Created by Daniel Rodrigues on 28/08/25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var router = Router()
    @StateObject private var themeManager = DSThemeManager.shared
    private let registry = RouteRegistry()

    init() {
        AppFeatures.registerAll(into: registry)
    }

    var body: some View {
        AccentProvider(accent: themeManager.currentAccent) {
            NavigationStack(path: $router.path) {
                registry.view(for: .wrap(OnboardingRoute.intro), router: router)
                    .registerAppDestinations(router: router, registry: registry)
                    .navigationBarBackButtonHidden(true)
            }
            .environment(\.router, router)
            .environment(\.routeRegistry, registry)
        }
    }
}
