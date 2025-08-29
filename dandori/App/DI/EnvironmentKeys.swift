//
//  EnvironmentKeys.swift
//  dandori
//
//  Created by Daniel Rodrigues on 28/08/25.
//

import SwiftUI

private struct RouterKey: EnvironmentKey { static let defaultValue = Router() }
private struct RegistryKey: EnvironmentKey { static let defaultValue = RouteRegistry() }

public extension EnvironmentValues {
    var router: Router {
        get { self[RouterKey.self] }
        set { self[RouterKey.self] = newValue }
    }
    var routeRegistry: RouteRegistry {
        get { self[RegistryKey.self] }
        set { self[RegistryKey.self] = newValue }
    }
}
