//
//  File.swift
//  
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct ExchangeMarketInterval: Codable {
    let exchange: String
    let base: String
    let quote: String
    let volumeBase: String
    let volumeUsd: String
    let openQuote: String
    let openTimestamp: String
    let closeQuote: String
    let closeTimestamp: String
    let numTrades: String
}
