//
//  File.swift
//  
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

struct TickerTimeFrame: Codable {
    let marketCapChange: String
    let marketCapChangePct: String
    let priceChange: String
    let priceChangePct: String
    let volume: String
    let volumeChange: String
    let volumeChangePct: String
}
