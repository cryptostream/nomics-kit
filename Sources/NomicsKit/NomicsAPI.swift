//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public struct NomicsAPIEndpoint {
    let components: URLComponents
    let responseModel: ResponseModel
}

enum NomicsAPI {
    case currencies(Currencies)
    case markets(Markets)
    case candles(Candles)
    case volume(Volume)
    case exchangeRates(ExchangeRates)

    var endpoint: NomicsAPIEndpoint {
        var components = URLComponents()
        components.scheme = scheme
        components.host =  host

        switch self {
        case .currencies(let currencies):
            components.path = currencies.path
            components.queryItems = currencies.queryItems.isEmpty ? nil : currencies.queryItems
            return NomicsAPIEndpoint(components: components, responseModel: currencies.model)
        case .markets(let markets):
            components.path = markets.path
            components.queryItems = markets.queryItems.isEmpty ? nil : markets.queryItems
            return NomicsAPIEndpoint(components: components, responseModel: markets.model)
        case .candles(let candles):
            components.path = candles.path
            components.queryItems = candles.queryItems.isEmpty ? nil : candles.queryItems
            return NomicsAPIEndpoint(components: components, responseModel: candles.model)
        case .volume(let volume):
            components.path = volume.path
            components.queryItems = volume.queryItems.isEmpty ? nil : volume.queryItems
            return NomicsAPIEndpoint(components: components, responseModel: volume.model)
        case .exchangeRates(let exchangeRates):
            components.path = exchangeRates.path
            components.queryItems = exchangeRates.queryItems.isEmpty ? nil : exchangeRates.queryItems
            return NomicsAPIEndpoint(components: components, responseModel: exchangeRates.model)
        }
    }

    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.nomics.com"
    }
}
