//
//  File.swift
//  
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct CurrencyTicker: Codable {
    let circulatingSupply: String
    let high: String
    let highTimestamp: String
    let marketCap: String
    let maxSupply: String
    let price: String
    let currency: String
    let day: TickerTimeFrame?
    let week: TickerTimeFrame?
    let month: TickerTimeFrame?
    let year: TickerTimeFrame?
    let yearToDate: TickerTimeFrame?
}
