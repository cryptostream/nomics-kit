//
//  CurrencySparkline.swift
//  NomicsKit
//
//  Created by Joe Blau on 1/20/19.
//

import Foundation

public struct CurrencySparkline: Codable {
    public let currency: String
    public let timestamps: [String]?
    public let prices: [String]?
}
