//
//  AnyRoute.swift
//  dandori
//
//  Created by Daniel Rodrigues on 28/08/25.
//

import Foundation

public struct AnyRoute: Hashable, Codable, Identifiable {
    public let type: String // ex.: "tasks", "onboarding"
    public let payload: Data? // o enum concreto codificado
    public var id: String { type + (payload?.hashDescription ?? "") }
    
    public init(type: String, payload: Data?) {
        self.type = type
        self.payload = payload
    }
    
    public static func wrap<R: Route>(_ route: R) -> AnyRoute {
        let data = try? JSONEncoder().encode(route)
        return AnyRoute(type: R.namespace, payload: data)
    }
    
    public func decode<R: Route>(_ as: R.Type) -> R? {
        guard type == R.namespace, let payload else { return nil }
        return try? JSONDecoder().decode(R.self, from: payload)
    }
}

private extension Data {
    var hashDescription: String {
        // hash curto só para id estável em Identifiable
        String(self.reduce(into: 5381) { $0 = (($0 << 5) &+ $0) &+ Int($1) }, radix: 16)
    }
}
