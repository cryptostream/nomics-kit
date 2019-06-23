//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct ExchangeRateInterval: Codable {
    public let currency: String
    public let open: String
    public let openTimestamp: String
    public let close: String
    public let closeTimestamp: String
}
