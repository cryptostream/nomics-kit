//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct ExchangeMarketPrice: Codable {
    public let exchange: String
    public let base: String
    public let quote: String
    public let priceQuote: String
    public let timestamp: String
}
