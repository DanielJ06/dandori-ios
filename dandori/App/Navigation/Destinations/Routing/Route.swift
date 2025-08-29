//
//  Route.swift
//  dandori
//
//  Created by Daniel Rodrigues on 28/08/25.
//

import Foundation

public protocol Route: Hashable & Codable {
    static var namespace: String { get }
}
