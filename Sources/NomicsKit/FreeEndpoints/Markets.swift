//
//  File.swift
//  
//
//  Created by Joe Blau on 6/5/19.
//

import Foundation


enum Markets {
    case markets(exchange: String? = nil, base: [String]? = nil, quote: [String]? = nil)
    case marketPrices(currency: String)
    case marketInterval(currency: String, hours: Int = 1, start: Date? = nil, end: Date? = nil )
    case exchangeMarketPrices(currency: String? = nil, exchange: String? = nil)
    case exchangeMarketInterval(currency: String? = nil, exchange: String? = nil, start: Date, end: Date? = nil)
    case marketCapHistory(start: Date, end: Date? = nil)
    
    var path: String {
        switch self {
        case .markets: return "/v1/markets"
        case .marketPrices: return "/v1/markets/prices"
        case .marketInterval: return "/v1/markets/interval"
        case .exchangeMarketPrices: return "/v1/exchange-markets/prices"
        case .exchangeMarketInterval: return "/v1/exchange-markets/interval"
        case .marketCapHistory: return "/v1/market-cap/history"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()

        switch self {
        case .markets(let exchange, let base, let quote):
            exchange.flatMap {
                queryItems.append(URLQueryItem(name: "exchange", value: $0))
            }
            base.flatMap {
                let value = $0.joined(separator: ",")
                queryItems.append(URLQueryItem(name: "base", value: value))
            }
            quote.flatMap {
                let value = $0.joined(separator: ",")
                queryItems.append(URLQueryItem(name: "quote", value: value))
            }
            
        case .marketPrices(let currency):
            queryItems.append(URLQueryItem(name: "currency", value: currency))
            
        case .marketInterval(let currency, let hours, let start, let end):
            queryItems.append(URLQueryItem(name: "currency", value: currency))
            queryItems.append(URLQueryItem(name: "hours", value: String(hours)))
            start.flatMap {
                queryItems.append(URLQueryItem(name: "start", value: DateFormatter.nomics.string(from: $0)))
            }
            end.flatMap {
                queryItems.append(URLQueryItem(name: "end", value: DateFormatter.nomics.string(from: $0)))
            }
            
        case .exchangeMarketPrices(let currency, let exchange):
            currency.flatMap {
                queryItems.append(URLQueryItem(name: "currency", value: $0))
            }
            exchange.flatMap {
                queryItems.append(URLQueryItem(name: "exchange", value: $0))
            }
            
        case .exchangeMarketInterval(let currency, let exchange, let start, let end):
            currency.flatMap {
                queryItems.append(URLQueryItem(name: "currency", value: $0))
            }
            exchange.flatMap {
                queryItems.append(URLQueryItem(name: "exchange", value: $0))
            }
            queryItems.append(URLQueryItem(name: "start", value: DateFormatter.nomics.string(from: start)))
            end.flatMap {
                queryItems.append(URLQueryItem(name: "end", value: DateFormatter.nomics.string(from: $0)))
            }
            
        case .marketCapHistory(let start, let end):
            queryItems.append(URLQueryItem(name: "start", value: DateFormatter.nomics.string(from: start)))
            end.flatMap {
                queryItems.append(URLQueryItem(name: "end", value: DateFormatter.nomics.string(from: $0)))
            }
        }
        
        return queryItems
    }
    
    var model: ResponseType {
        switch self {
        case .markets: return .markets([Market].self)
        case .marketPrices: return .marketPrices([MarketPrice].self)
        case .marketInterval: return  .marketInterval([MarketInterval].self)
        case .exchangeMarketPrices: return .exchangeMarketPrices([ExchangeMarketPrice].self)
        case .exchangeMarketInterval: return .exchangeMarketInterval([ExchangeMarketInterval].self)
        case .marketCapHistory: return .marketCapHistory([MarketCapHistory].self)
        }
    }
}
