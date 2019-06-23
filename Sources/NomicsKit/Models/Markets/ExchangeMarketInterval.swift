//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct ExchangeMarketInterval: Codable {
    public let exchange: String
    public let base: String
    public let quote: String
    public let volumeBase: String
    public let volumeUsd: String
    public let openQuote: String
    public let openTimestamp: String
    public let closeQuote: String
    public let closeTimestamp: String
    public let numTrades: String
}
