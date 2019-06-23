//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct TickerTimeFrame: Codable {
    public let marketCapChange: String
    public let marketCapChangePct: String
    public let priceChange: String
    public let priceChangePct: String
    public let volume: String
    public let volumeChange: String
    public let volumeChangePct: String
}
