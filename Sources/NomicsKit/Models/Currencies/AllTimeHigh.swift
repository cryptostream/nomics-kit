//
//  AllTimeHigh.swift
//  NomicsKit
//
//  Created by Joe Blau on 1/23/19.
//

import Foundation

public struct AllTimeHigh: Codable {
    public let currency: String
    public let price: String?
    public let timestamp: String?
    public let exchange: String?
    public let quote: String?
}
