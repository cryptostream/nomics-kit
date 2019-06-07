//
//  File.swift
//  
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct ExchangeRate: Codable {
    let currency: String
    let rate: String
    let timestamp: String
}
