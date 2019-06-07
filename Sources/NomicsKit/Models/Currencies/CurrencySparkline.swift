//
//  CurrencySparkline.swift
//  NomicsKit
//
//  Created by Joe Blau on 1/20/19.
//

import Foundation

public struct CurrencySparkline: Codable {
    let currency: String
    let timestamps: [String]?
    let prices: [String]?
}
