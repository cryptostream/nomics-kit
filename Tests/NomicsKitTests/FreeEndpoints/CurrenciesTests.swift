import XCTest
@testable import NomicsKit

final class CurrenciesTests: XCTestCase {
    let startDate = Date(timeIntervalSince1970: 0)
    let endDate = Date(timeIntervalSince1970: 8400)
    
    // MARK: - Currencies Ticker
    
    func testCurrencies_currenciesTicker() {
        XCTAssertEqual(NomicsAPI.currencies(.currenciesTicker()).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/ticker")
    }
    
    func testCurrencies_currenciesTicker_intervals() {
        XCTAssertEqual(NomicsAPI.currencies(.currenciesTicker(intervals: [.day, .week])).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/ticker?intervals=1d,7d")
    }

    func testCurrencies_currenciesTicker_quoteCurrency() {
        XCTAssertEqual(NomicsAPI.currencies(.currenciesTicker(currency: "EUR")).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/ticker?quote-currency=EUR")
    }
    
    func testCurrencies_currenciesTicker_intervals_quoteCurrency() {
        XCTAssertEqual(NomicsAPI.currencies(.currenciesTicker(intervals: [.day, .week], currency: "EUR")).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/ticker?intervals=1d,7d&quote-currency=EUR")
    }
    
    // MARK: - Currencies
    
    func testCurrencies_currencies() {
        XCTAssertEqual(NomicsAPI.currencies(.currencies()).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies")
    }
    
    func testCurrencies_currencies_ids() {
        XCTAssertEqual(NomicsAPI.currencies(.currencies(ids: ["BTC","ETH", "XRP"])).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies?ids=BTC,ETH,XRP")
    }
    
    func testCurrencies_currencies_attributes() {
        XCTAssertEqual(NomicsAPI.currencies(.currencies(attributes: [.id, .name, .logoURL])).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies?attributes=id,name,logo_url")
    }
    
    func testCurrencies_currencies_ids_attributes() {
        XCTAssertEqual(NomicsAPI.currencies(.currencies(ids: ["BTC","ETH", "XRP"], attributes: [.id, .name, .logoURL])).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies?ids=BTC,ETH,XRP&attributes=id,name,logo_url")
    }
    
    // MARK: - Prices
    
    func testCurrencies_prices() {
        XCTAssertEqual(NomicsAPI.currencies(.prices).endpoint.components.string,
                       "https://api.nomics.com/v1/prices")
    }
    
    // MARK: - Dashboard
    
    func testCurrencies_dashboard() {
        XCTAssertEqual(NomicsAPI.currencies(.dashboard).endpoint.components.string,
                       "https://api.nomics.com/v1/dashboard")
    }
    
    // MARK: - Currencies Interval
    
    func testCurrencies_currenciesInterval() {
        XCTAssertEqual(NomicsAPI.currencies(.currenciesInterval(start: Date(timeIntervalSince1970: 0))).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/interval?start=1969-12-31T19:00:00Z")
    }
    
    func testCurrencies_currenciesInterval_end() {
        XCTAssertEqual(NomicsAPI.currencies(.currenciesInterval(start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/interval?start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }
    
    // MARK: - Currencies Sparkline
    
    func testCurrencies_currenciesSparkline() {
        XCTAssertEqual(NomicsAPI.currencies(.currenciesSparkline(start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/sparkline?start=1969-12-31T19:00:00Z")
    }
    
    func testCurrencies_currenciesSparkline_end() {
        XCTAssertEqual(NomicsAPI.currencies(.currenciesInterval(start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/interval?start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }
    
    // MARK: - Supplies Interval
    
    func testCurrencies_suppliesInterval() {
        XCTAssertEqual(NomicsAPI.currencies(.suppliesInterval(start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/supplies/interval?start=1969-12-31T19:00:00Z")
    }
    
    func testCurrencies_suppliesInterval_end() {
        XCTAssertEqual(NomicsAPI.currencies(.currenciesInterval(start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/interval?start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }
    
    // MARK: - All Time Highs
    
    func testCurrencies_allTimeHighs() {
        XCTAssertEqual(NomicsAPI.currencies(.allTimeHighs).endpoint.components.string,
                       "https://api.nomics.com/v1/currencies/highs")
    }
    
    static var allTests = [
        ("testCurrencies_currenciesTicker", testCurrencies_currenciesTicker),
        ("testCurrencies_currenciesTicker_intervals", testCurrencies_currenciesTicker_intervals),
        ("testCurrencies_currenciesTicker_quoteCurrency", testCurrencies_currenciesTicker_quoteCurrency),
        ("testCurrencies_currenciesTicker_intervals_quoteCurrency", testCurrencies_currenciesTicker_intervals_quoteCurrency),
        ("testCurrencies_currencies", testCurrencies_currencies),
        ("testCurrencies_currencies_ids", testCurrencies_currencies_ids),
        ("testCurrencies_currencies_attributes", testCurrencies_currencies_attributes),
        ("testCurrencies_currencies_ids_attributes", testCurrencies_currencies_ids_attributes),
        ("testCurrencies_prices", testCurrencies_prices),
        ("testCurrencies_dashboard", testCurrencies_dashboard),
        ("testCurrencies_currenciesInterval", testCurrencies_currenciesInterval),
        ("testCurrencies_currenciesInterval_end", testCurrencies_currenciesInterval_end),
        ("testCurrencies_currenciesSparkline", testCurrencies_currenciesSparkline),
        ("testCurrencies_currenciesSparkline_end", testCurrencies_currenciesSparkline_end),
        ("testCurrencies_suppliesInterval", testCurrencies_suppliesInterval),
        ("testCurrencies_suppliesInterval_end", testCurrencies_suppliesInterval_end),
        ("testCurrencies_allTimeHighs", testCurrencies_allTimeHighs),
    ]
}
