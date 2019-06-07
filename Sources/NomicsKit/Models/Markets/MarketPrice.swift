//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct MarketPrice: Codable {
    let exchange: String
    let quote: String
    let price: String
    let timestamp: String
}
