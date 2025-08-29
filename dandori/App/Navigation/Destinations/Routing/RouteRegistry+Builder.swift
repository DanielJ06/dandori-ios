//
//  RouteRegistry+Builder.swift
//  dandori
//
//  Created by Daniel Rodrigues on 28/08/25.
//

import SwiftUI

public extension RouteRegistry {
    func registerView<R: Route, V: View>(
        _ type: R.Type,
        @ViewBuilder builder: @escaping (_ route: R, _ router: Router) -> V
    ) {
        self.register(type) { route, router in
            AnyView(builder(route, router))
        }
    }
}
