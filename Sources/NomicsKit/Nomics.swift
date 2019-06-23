//
//  Endpiont.swift
//
//
//  Created by Joe Blau on 6/4/19.
//

import Combine
import Foundation

public enum NomicsError: Error {
    case buildRequestError
    case httpStatusError
}

public final class Nomics {
    private var key: String
    private let decoder = JSONDecoder()
    private let sharedSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.httpMaximumConnectionsPerHost = 8
        return URLSession(configuration: configuration)
    }()

    public init(key: String = "2018-09-demo-dont-deploy-b69315e440beb145") {
        self.key = key
    }

    public func request(endpoint: NomicsAPIEndpoint) throws -> AnyPublisher<Decodable, Error> {
        let request = try buildRequest(endpoint: endpoint)
        return sharedSession.dataTaskPublisher(for: request)
            .tryMap({ (data, response) -> Decodable in
                guard let httpReponse = response as? HTTPURLResponse,
                    httpReponse.statusCode == 200 else {
                        throw NomicsError.httpStatusError
                }
                do {
                    switch endpoint.responseModel {

                    // Currencies
                    case .currenciesTicker(let type): return try self.decoder.decode(type, from: data)
                    case .currencies(let type): return try self.decoder.decode(type, from: data)
                    case .price(let type): return try self.decoder.decode(type, from: data)
                    case .dashboard(let type): return try self.decoder.decode(type, from: data)
                    case .currenciesInterval(let type): return try self.decoder.decode(type, from: data)
                    case .currenciesSparkline(let type): return try self.decoder.decode(type, from: data)
                    case .suppliesInterval(let type): return try self.decoder.decode(type, from: data)
                    case .allTimeHighs(let type): return try self.decoder.decode(type, from: data)

                    // Markets
                    case .markets(let type): return try self.decoder.decode(type, from: data)
                    case .marketPrices(let type): return try self.decoder.decode(type, from: data)
                    case .marketInterval(let type): return try self.decoder.decode(type, from: data)
                    case .exchangeMarketPrices(let type): return try self.decoder.decode(type, from: data)
                    case .exchangeMarketInterval(let type): return try self.decoder.decode(type, from: data)
                    case .marketCapHistory(let type): return try self.decoder.decode(type, from: data)

                    // Candles
                    case .aggregatedOHLCVCandles(let type): return try self.decoder.decode(type, from: data)

                    // Volume
                    case .globalVolumeHistory(let type): return try self.decoder.decode(type, from: data)

                    // Exchange Rates
                    case .exchangeRates(let type): return try self.decoder.decode(type, from: data)
                    case .exchangeRatesHistory(let type): return try self.decoder.decode(type, from: data)
                    case .exchangeRatesInterval(let type): return try self.decoder.decode(type, from: data)
                    }
                } catch {
                    throw error
                }
            })
            .eraseToAnyPublisher()
    }

    private func buildRequest(endpoint: NomicsAPIEndpoint) throws -> URLRequest {
        var components = endpoint.components

        switch components.queryItems {
        case .none:
            components.queryItems = [URLQueryItem(name: "key", value: key)]
        case .some(let queryItems):
            components.queryItems = queryItems + [URLQueryItem(name: "key", value: key)]
        }

        guard let url = components.url else { throw NomicsError.buildRequestError }
        return URLRequest(url: url)
    }
}
