//
//  AppFeatures.swift
//  dandori
//
//  Created by Daniel Rodrigues on 28/08/25.
//

struct AppFeatures {
    static func registerAll(into registry: RouteRegistry) {
        OnboardingRegistration.register(into: registry)
    }
}
