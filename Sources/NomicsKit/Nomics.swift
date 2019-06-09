//
//  Endpiont.swift
//
//
//  Created by Joe Blau on 6/4/19.
//

import Foundation

public final class Nomics {
    private var key: String
    private let decoder = JSONDecoder()
    private let sharedSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.httpMaximumConnectionsPerHost = 8
        return URLSession(configuration: configuration)
    }()

    init(key: String = "2018-09-demo-dont-deploy-b69315e440beb145") {
        self.key = key
    }

    public func request(endpoint: NomicsAPIEndpoint, completion: @escaping (Result<Decodable, Error>) -> Void) {
        
        guard let request = buildRequest(endpoint: endpoint) else {
            return
        }

        let task = sharedSession.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    switch endpoint.responseModel {

                    // Currencies
                    case .currenciesTicker(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .currencies(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .price(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .dashboard(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .currenciesInterval(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .currenciesSparkline(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .suppliesInterval(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .allTimeHighs(let type): completion(.success(try self.decoder.decode(type, from: data)))

                    // Markets
                    case .markets(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .marketPrices(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .marketInterval(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .exchangeMarketPrices(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .exchangeMarketInterval(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .marketCapHistory(let type): completion(.success(try self.decoder.decode(type, from: data)))

                    // Candles
                    case .aggregatedOHLCVCandles(let type): completion(.success(try self.decoder.decode(type, from: data)))

                    // Volume
                    case .globalVolumeHistory(let type): completion(.success(try self.decoder.decode(type, from: data)))

                    // Exchange Rates
                    case .exchangeRates(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .exchangeRatesHistory(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    case .exchangeRatesInterval(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    }
                } catch {
                    print(error)
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func buildRequest(endpoint: NomicsAPIEndpoint) -> URLRequest? {
        var components = endpoint.components
        
        switch components.queryItems {
        case .none:
            components.queryItems = [URLQueryItem(name: "key", value: key)]
        case .some(let queryItems):
            components.queryItems = queryItems + [URLQueryItem(name: "key", value: key)]
        }
        
        guard let url = components.url else { return nil }
        return URLRequest(url: url)
    }
}
