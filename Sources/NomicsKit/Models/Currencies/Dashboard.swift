//
//  Dashboard.swift
//  Cryptostream
//
//  Created by Joe Blau on 1/20/19.
//

import Foundation

public struct Dashboard: Codable {
    public let currency: String
    public let dayOpen: String?
    public let dayVolume: String?
    public let dayOpenVolume: String?
    public let weekOpen: String?
    public let weekVolume: String?
    public let weekOpenVolume: String?
    public let monthOpen: String?
    public let monthVolume: String?
    public let monthOpenVolume: String?
    public let yearOpen: String?
    public let yearVolume: String?
    public let yearOpenVolume: String?
    public let close: String?
    public let high: String?
    public let highTimestamp: String?
    public let highExchange: String?
    public let highQuoteCurrency: String?
    public let availableSupply: String?
    public let maxSupply: String?
}
