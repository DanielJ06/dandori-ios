//
//  RouteRegistry.swift
//  dandori
//
//  Created by Daniel Rodrigues on 28/08/25.
//

import SwiftUI

public final class RouteRegistry {
    public typealias Builder = (_ any: AnyRoute, _ router: Router) -> AnyView?

    private var builders: [String: Builder] = [:]
    public init() {}

    /// Registro por feature (namespace).
    public func register<R: Route>(
        _ type: R.Type,
        builder: @escaping (_ route: R, _ router: Router) -> AnyView
    ) {
        builders[R.namespace] = { any, router in
            guard let route = any.decode(R.self) else { return nil }
            return builder(route, router)
        }
    }

    /// Resolve uma AnyRoute para a View correspondente.
    public func view(for any: AnyRoute, router: Router) -> AnyView {
        if let v = builders[any.type]?(any, router) { return v }
        return AnyView(EmptyView())
    }
}
