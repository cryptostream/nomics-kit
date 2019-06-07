//
//  File.swift
//  
//
//  Created by Joe Blau on 6/5/19.
//

import Foundation

enum Currencies {
    case currenciesTicker(intervals: [Interval]? = nil, currency: String? = nil)
    case currencies(ids: [String]? = nil, attributes: [Attiributes]? = nil)
    case prices
    case dashboard
    case currenciesInterval(start: Date, end: Date? = nil)
    case currenciesSparkline(start: Date, end: Date? = nil)
    case suppliesInterval(start: Date, end: Date? = nil)
    case allTimeHighs
    
    var path: String {
        switch self {
        case .currenciesTicker: return "/v1/currencies/ticker"
        case .currencies: return "/v1/currencies"
        case .prices: return "/v1/prices"
        case .dashboard: return "/v1/dashboard"
        case .currenciesInterval: return "/v1/currencies/interval"
        case .currenciesSparkline: return "/v1/currencies/sparkline"
        case .suppliesInterval: return "/v1/supplies/interval"
        case .allTimeHighs: return "/v1/currencies/highs"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()

        switch self {
        case .currenciesTicker(let intervals, let currency):
            intervals.flatMap {
                let value = $0.map { $0.rawValue }.joined(separator: ",")
                queryItems.append(URLQueryItem(name: "intervals", value: value))
            }
            currency.flatMap {
                queryItems.append(URLQueryItem(name: "quote-currency", value: $0))
            }
            
        case .currencies(let ids, let attributes):
            ids.flatMap {
                let value = $0.joined(separator: ",")
                queryItems.append(URLQueryItem(name: "ids", value: value))
            }
            attributes.flatMap {
                let value = $0.map { $0.rawValue }.joined(separator: ",")
                queryItems.append(URLQueryItem(name: "attributes", value: value))
            }
            
        case .currenciesInterval(let start, let end),
             .currenciesSparkline(let start, let end),
             .suppliesInterval(let start, let end):
            queryItems.append(URLQueryItem(name: "start", value: DateFormatter.nomics.string(from: start)))
            end.flatMap {
                queryItems.append(URLQueryItem(name: "end", value: DateFormatter.nomics.string(from: $0)))
            }
            
        case .prices,
             .dashboard,
             .allTimeHighs:
            break
        }
        
        return queryItems
    }
    
    var model: ResponseType {
        switch self {
        case .currenciesTicker: return .currenciesTicker([CurrencyTicker].self)
        case .currencies: return .currencies([Currency].self)
        case .prices: return .price([Price].self)
        case .dashboard: return .dashboard([Dashboard].self)
        case .currenciesInterval: return .currenciesInterval([CurrencyInterval].self)
        case .currenciesSparkline: return .currenciesSparkline([CurrencySparkline].self)
        case .suppliesInterval: return .suppliesInterval([SupplyInterval].self)
        case .allTimeHighs: return .allTimeHighs([AllTimeHigh].self)
        }
    }
}

