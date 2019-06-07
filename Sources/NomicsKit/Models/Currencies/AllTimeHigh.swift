//
//  AllTimeHigh.swift
//  NomicsKit
//
//  Created by Joe Blau on 1/23/19.
//

import Foundation

public struct AllTimeHigh: Codable {
    var currency: String
    var price: String?
    var timestamp: String?
    var exchange: String?
    var quote: String?
}
