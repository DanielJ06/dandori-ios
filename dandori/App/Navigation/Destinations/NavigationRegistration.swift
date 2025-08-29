//
//  NavigationRegistration.swift
//  dandori
//
//  Created by Daniel Rodrigues on 28/08/25.
//

import SwiftUI

struct NavigationRegistration: ViewModifier {
    let router: Router
    let registry: RouteRegistry

    func body(content: Content) -> some View {
        content
            .navigationDestination(for: AnyRoute.self) { any in
                registry.view(for: any, router: router)
            }
            .sheet(item: Binding(get: { router.sheet }, set: { _ in router.dismissSheet() })) { any in
                registry.view(for: any, router: router)
            }
            .fullScreenCover(item: Binding(get: { router.fullScreen }, set: { _ in router.dismissFullScreen() })) { any in
                registry.view(for: any, router: router)
            }
    }
}

extension View {
    func registerAppDestinations(router: Router, registry: RouteRegistry) -> some View {
        modifier(NavigationRegistration(router: router, registry: registry))
    }
}
