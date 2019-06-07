//
//  ExchangeRatesTests.swift
//  
//
//  Created by Joe Blau on 6/5/19.
//

import XCTest
@testable import NomicsKit

final class ExchangeRatesTests: XCTestCase {
    let startDate = Date(timeIntervalSince1970: 0)
    let endDate = Date(timeIntervalSince1970: 8400)
    
    // MARK: - Exchange Rates
    
    func testExchangeRates() {
        XCTAssertEqual(NomicsAPI.exchangeRates(.exchangeRates).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-rates")
    }
    
    // MARK: - Exchange Rate History
    
    func testExchangeRates_history() {
        XCTAssertEqual(NomicsAPI.exchangeRates(.exchangeRatesHistory(currency: "BTC", start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-rates/history?currency=BTC&start=1969-12-31T19:00:00Z")
    }
    
    func testExchangeRates_history_end() {
        XCTAssertEqual(NomicsAPI.exchangeRates(.exchangeRatesHistory(currency: "BTC", start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-rates/history?currency=BTC&start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }
    
    // MARK: - Exchange Rate Interval
    
    func testExchangeRates_interval() {
        XCTAssertEqual(NomicsAPI.exchangeRates(.exchangeRatesInterval(start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-rates/interval?start=1969-12-31T19:00:00Z")
    }
    
    func testExchangeRates_interval_end() {
        XCTAssertEqual(NomicsAPI.exchangeRates(.exchangeRatesInterval(start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-rates/interval?start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }

    static var allTests = [
        ("testExchangeRates", testExchangeRates),
        ("testExchangeRates_history", testExchangeRates_history),
        ("testExchangeRates_history_end", testExchangeRates_history_end),
        ("testExchangeRates_interval", testExchangeRates_interval),
        ("testExchangeRates_interval_end", testExchangeRates_interval_end),
    ]
}
