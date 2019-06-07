//
//  File.swift
//  
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct Market: Codable {
    let exchange: String
    let market: String
    let base: String
    let quote: String
}
