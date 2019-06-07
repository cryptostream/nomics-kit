//
//  File.swift
//  
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct ExchangeMarketPrice: Codable {
    let exchange: String
    let base: String
    let quote: String
    let priceQuote: String
    let timestamp: String
}
