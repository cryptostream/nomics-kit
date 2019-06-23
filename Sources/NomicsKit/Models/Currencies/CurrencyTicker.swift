//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct CurrencyTicker: Codable {
    public let circulatingSupply: String
    public let high: String
    public let highTimestamp: String
    public let marketCap: String
    public let maxSupply: String
    public let price: String
    public let currency: String
    public let day: TickerTimeFrame?
    public let week: TickerTimeFrame?
    public let month: TickerTimeFrame?
    public let year: TickerTimeFrame?
    public let yearToDate: TickerTimeFrame?
}
