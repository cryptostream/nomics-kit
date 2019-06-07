//
//  File.swift
//  
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct MarketInterval: Codable {
    let exchange: String
    let quote: String
    let volume: String
    let open: String
    let openTimestamp: String
    let close: String
    let closeTimestamp: String
}
