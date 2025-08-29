//
//  OnboardingNavigating.swift
//  dandori
//
//  Created by Daniel Rodrigues on 29/08/25.
//


import Foundation

protocol OnboardingNavigating {
    func toPhilosophy()
    func toName()
    func toFinish()
}

final class OnboardingNavigator: OnboardingNavigating {
    private unowned let router: Router
    init(router: Router) { self.router = router }

    func toPhilosophy()  { router.push(OnboardingRoute.philosophy) }
    func toName()    { router.push(OnboardingRoute.nameEntry) }
    func toFinish()  { router.push(OnboardingRoute.finish) }

    func finish() {
    }
}
