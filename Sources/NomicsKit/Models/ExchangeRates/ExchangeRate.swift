//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct ExchangeRate: Codable {
    public let currency: String
    public let rate: String
    public let timestamp: String
}
