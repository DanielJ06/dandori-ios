//
//  Router.swift
//  dandori
//
//  Created by Daniel Rodrigues on 28/08/25.
//

import SwiftUI

/// Orquestrador de navegação.
/// Ele manipula `AnyRoute` e deixa a construção das telas para o registro.
public final class Router: ObservableObject {
    @Published public var path: [AnyRoute] = []

    @Published public var sheet: AnyRoute?
    @Published public var fullScreen: AnyRoute?

    public init() {}

    /// Empurra uma rota concreta para a pilha.
    public func push<R: Route>(_ route: R) {
        path.append(.wrap(route))
    }

    /// Substitui toda a pilha (útil para deep link).
    public func setPath(_ routes: [AnyRoute]) {
        path = routes
    }

    /// Substitui toda a pilha com rotas concretas.
    public func setPath<R: Route>(_ routes: [R]) {
        path = routes.map(AnyRoute.wrap)
    }

    /// Remove o topo da pilha (se existir).
    public func pop() {
        _ = path.popLast()
    }

    /// Limpa a pilha (voltar ao root).
    public func popToRoot() {
        path.removeAll()
    }

    /// Troca a rota do topo (útil em fluxos de edição).
    public func replaceTop<R: Route>(with route: R) {
        guard !path.isEmpty else { path = [.wrap(route)]; return }
        path.removeLast()
        path.append(.wrap(route))
    }

    public func present<R: Route>(_ sheet: R) { self.sheet = .wrap(sheet) }
    public func dismissSheet() { sheet = nil }

    public func presentFullScreen<R: Route>(_ full: R) { self.fullScreen = .wrap(full) }
    public func dismissFullScreen() { fullScreen = nil }
}
