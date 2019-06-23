//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct MarketPrice: Codable {
    public let exchange: String
    public let quote: String
    public let price: String
    public let timestamp: String
}
