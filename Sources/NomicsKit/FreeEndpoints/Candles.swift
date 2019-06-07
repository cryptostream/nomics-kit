//
//  File.swift
//
//
//  Created by Joe Blau on 6/5/19.
//

import Foundation

enum Candles {
    case aggregatedOHLCVCandles(interval: [Interval], currency: String, start: Date? = nil, end: Date? = nil)

    var path: String {
        switch self {
        case .aggregatedOHLCVCandles: return "/v1/candles"
        }
    }

    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()

        switch self {
        case .aggregatedOHLCVCandles(let interval, let currency, let start, let end):
            let value = interval.map { $0.rawValue }.joined(separator: ",")
            queryItems.append(URLQueryItem(name: "interval", value: value))
            queryItems.append(URLQueryItem(name: "currency", value: currency))
            start.flatMap {
                queryItems.append(URLQueryItem(name: "start", value: DateFormatter.nomics.string(from: $0)))
            }
            end.flatMap {
                queryItems.append(URLQueryItem(name: "end", value: DateFormatter.nomics.string(from: $0)))
            }
        }

        return queryItems
    }

    var model: ResponseType {
        switch self {
        case .aggregatedOHLCVCandles: return .aggregatedOHLCVCandles([AggregatedOHLCVCandle].self)
        }
    }
}
