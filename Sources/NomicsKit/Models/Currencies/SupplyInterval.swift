//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct SupplyInterval: Codable {
    let currency: String
    let openAvailable: String
    let openMax: String
    let openTimestamp: String
    let closeAvailable: String
    let closeMax: String
    let closeTimestamp: String
}
