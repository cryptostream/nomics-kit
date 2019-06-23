//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct Market: Codable {
    public let exchange: String
    public let market: String
    public let base: String
    public let quote: String
}
