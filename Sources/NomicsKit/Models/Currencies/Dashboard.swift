//
//  Dashboard.swift
//  Cryptostream
//
//  Created by Joe Blau on 1/20/19.
//

import Foundation

public struct Dashboard: Codable {
    var currency: String
    var dayOpen: String?
    var dayVolume: String?
    var dayOpenVolume: String?
    var weekOpen: String?
    var weekVolume: String?
    var weekOpenVolume: String?
    var monthOpen: String?
    var monthVolume: String?
    var monthOpenVolume: String?
    var yearOpen: String?
    var yearVolume: String?
    var yearOpenVolume: String?
    var close: String?
    var high: String?
    var highTimestamp: String?
    var highExchange: String?
    var highQuoteCurrency: String?
    var availableSupply: String?
    var maxSupply: String?
}
