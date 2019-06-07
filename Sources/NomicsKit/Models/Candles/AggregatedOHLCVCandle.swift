//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct AggregatedOHLCVCandle: Codable {
    let timestamp: String
    let low: String
    let open: String
    let close: String
    let high: String
    let volume: String
}
