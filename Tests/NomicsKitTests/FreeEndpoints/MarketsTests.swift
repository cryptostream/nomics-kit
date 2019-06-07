import XCTest
@testable import NomicsKit

final class MarketsTests: XCTestCase {
    let startDate = Date(timeIntervalSince1970: 0)
    let endDate = Date(timeIntervalSince1970: 8400)

    // MARK: - Markets

    func testMarkerts() {
        XCTAssertEqual(NomicsAPI.markets(.markets()).endpoint.components.string,
                       "https://api.nomics.com/v1/markets")
    }

    // MARK: - Markets Prices

    func testMarkerts_prices() {
        XCTAssertEqual(NomicsAPI.markets(.marketPrices(currency: "BTC")).endpoint.components.string,
                       "https://api.nomics.com/v1/markets/prices?currency=BTC")
    }

    // MARK: - Markets Interval

    func testMarkerts_interval() {
        XCTAssertEqual(NomicsAPI.markets(.marketInterval(currency: "BTC", hours: 1)).endpoint.components.string,
                       "https://api.nomics.com/v1/markets/interval?currency=BTC&hours=1")
    }

    func testMarkerts_interval_start() {
        XCTAssertEqual(NomicsAPI.markets(.marketInterval(currency: "BTC", hours: 1, start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/markets/interval?currency=BTC&hours=1&start=1969-12-31T19:00:00Z")
    }

    func testMarkerts_interval_start_end() {
        XCTAssertEqual(NomicsAPI.markets(.marketInterval(currency: "BTC", hours: 1, start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/markets/interval?currency=BTC&hours=1&start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }

    // MARK: - Exchange Market Prices

    func testMarkerts_exchangeMarketPrices() {
        XCTAssertEqual(NomicsAPI.markets(.exchangeMarketPrices()).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-markets/prices")
    }

    func testMarkerts_exchangeMarketPrices_currency() {
        XCTAssertEqual(NomicsAPI.markets(.exchangeMarketPrices(currency: "BTC")).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-markets/prices?currency=BTC")
    }

    func testMarkerts_exchangeMarketPrices_currency_exchange() {
        XCTAssertEqual(NomicsAPI.markets(.exchangeMarketPrices(currency: "BTC", exchange: "binance")).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-markets/prices?currency=BTC&exchange=binance")
    }

    // MARK: - Exchange Market Interval

    func testMarkerts_exchangeMarketInterval() {
        XCTAssertEqual(NomicsAPI.markets(.exchangeMarketInterval(start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-markets/interval?start=1969-12-31T19:00:00Z")
    }

    func testMarkerts_exchangeMarketInterval_currency() {
        XCTAssertEqual(NomicsAPI.markets(.exchangeMarketInterval(currency: "BTC", start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-markets/interval?currency=BTC&start=1969-12-31T19:00:00Z")
    }

    func testMarkerts_exchangeMarketInterval_currency_excahnge() {
        XCTAssertEqual(NomicsAPI.markets(.exchangeMarketInterval(currency: "BTC", exchange: "binance", start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-markets/interval?currency=BTC&exchange=binance&start=1969-12-31T19:00:00Z")
    }

    func testMarkerts_exchangeMarketInterval_currency_excahnge_end() {
        XCTAssertEqual(NomicsAPI.markets(.exchangeMarketInterval(currency: "BTC", exchange: "binance", start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/exchange-markets/interval?currency=BTC&exchange=binance&start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }

    // MARK: - Market Cap History

    func testMarkerts_marketCapHistory() {
        XCTAssertEqual(NomicsAPI.markets(.marketCapHistory(start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/market-cap/history?start=1969-12-31T19:00:00Z")
    }

    func testMarkerts_marketCapHistory_end() {
        XCTAssertEqual(NomicsAPI.markets(.marketCapHistory(start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/market-cap/history?start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }

    static var allTests = [
        ("testMarkerts", testMarkerts),
        ("testMarkerts_prices", testMarkerts_prices),
        ("testMarkerts_interval", testMarkerts_interval),
        ("testMarkerts_interval_start", testMarkerts_interval_start),
        ("testMarkerts_interval_start_end", testMarkerts_interval_start_end),
        ("testMarkerts_exchangeMarketPrices", testMarkerts_exchangeMarketPrices),
        ("testMarkerts_exchangeMarketPrices_currency", testMarkerts_exchangeMarketPrices_currency),
        ("testMarkerts_exchangeMarketPrices_currency_exchange", testMarkerts_exchangeMarketPrices_currency_exchange),
        ("testMarkerts_exchangeMarketInterval", testMarkerts_exchangeMarketInterval),
        ("testMarkerts_exchangeMarketInterval_currency", testMarkerts_exchangeMarketInterval_currency),
        ("testMarkerts_exchangeMarketInterval_currency_excahnge", testMarkerts_exchangeMarketInterval_currency_excahnge),
        ("testMarkerts_exchangeMarketInterval_currency_excahnge_end", testMarkerts_exchangeMarketInterval_currency_excahnge_end),
        ("testMarkerts_marketCapHistory", testMarkerts_marketCapHistory),
        ("testMarkerts_marketCapHistory_end", testMarkerts_marketCapHistory_end),
    ]

}
