//
//  ExchangeRatesswift
//
//
//  Created by Joe Blau on 6/5/19.
//

import Foundation

enum ExchangeRates {
    case exchangeRates
    case exchangeRatesHistory(currency: String, start: Date, end: Date? = nil)
    case exchangeRatesInterval(start: Date, end: Date? = nil)

    var path: String {
        switch self {
        case .exchangeRates: return "/v1/exchange-rates"
        case .exchangeRatesHistory: return "/v1/exchange-rates/history"
        case .exchangeRatesInterval: return "/v1/exchange-rates/interval"
        }
    }

    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()

        switch self {
        case .exchangeRates:
            break

        case .exchangeRatesHistory(let currency, let start, let end):
            queryItems.append(URLQueryItem(name: "currency", value: currency))
            queryItems.append(URLQueryItem(name: "start", value: DateFormatter.nomics.string(from: start)))
            end.flatMap {
                queryItems.append(URLQueryItem(name: "end", value: DateFormatter.nomics.string(from: $0)))
            }

        case .exchangeRatesInterval(let start, let end):
            queryItems.append(URLQueryItem(name: "start", value: DateFormatter.nomics.string(from: start)))
            end.flatMap {
                queryItems.append(URLQueryItem(name: "end", value: DateFormatter.nomics.string(from: $0)))
            }
        }

        return queryItems
    }

    var model: ResponseModel {
        switch self {
        case .exchangeRates: return .exchangeRates([ExchangeRate].self)
        case .exchangeRatesHistory: return .exchangeRatesHistory([ExchangeRateHistory].self)
        case .exchangeRatesInterval: return .exchangeRatesInterval([ExchangeRateInterval].self)
        }
    }
}
