//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct SupplyInterval: Codable {
    public let currency: String
    public let openAvailable: String
    public let openMax: String
    public let openTimestamp: String
    public let closeAvailable: String
    public let closeMax: String
    public let closeTimestamp: String
}
