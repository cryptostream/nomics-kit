//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct AggregatedOHLCVCandle: Codable {
    public let timestamp: String
    public let low: String
    public let open: String
    public let close: String
    public let high: String
    public let volume: String
}
