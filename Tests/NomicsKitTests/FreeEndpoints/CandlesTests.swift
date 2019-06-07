//
//  CandlesTests.swift
//  
//
//  Created by Joe Blau on 6/5/19.
//

import XCTest
@testable import NomicsKit

final class CandlesTests: XCTestCase {
    let startDate = Date(timeIntervalSince1970: 0)
    let endDate = Date(timeIntervalSince1970: 8400)

    // MARK: - Aggregated OHLCV Cancles
    
    func testCandles_aggregatedOHLCVCandles () {
        XCTAssertEqual(NomicsAPI.candles(.aggregatedOHLCVCandles(interval: [.day, .week], currency: "BTC")).endpoint.components.string,
                       "https://api.nomics.com/v1/candles?interval=1d,7d&currency=BTC")
    }
    
    func testCandles_aggregatedOHLCVCandles_start () {
        XCTAssertEqual(NomicsAPI.candles(.aggregatedOHLCVCandles(interval: [.day, .week], currency: "BTC", start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/candles?interval=1d,7d&currency=BTC&start=1969-12-31T19:00:00Z")
    }
    
    func testCandles_aggregatedOHLCVCandles_start_end () {
        XCTAssertEqual(NomicsAPI.candles(.aggregatedOHLCVCandles(interval: [.day, .week], currency: "BTC", start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/candles?interval=1d,7d&currency=BTC&start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }
    
    static var allTests = [
        ("testCandles_aggregatedOHLCVCandles", testCandles_aggregatedOHLCVCandles),
        ("testCandles_aggregatedOHLCVCandles_start", testCandles_aggregatedOHLCVCandles_start),
        ("testCandles_aggregatedOHLCVCandles_start_end", testCandles_aggregatedOHLCVCandles_start_end),
    ]
}


