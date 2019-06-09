//
//  File.swift
//
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

public enum ResponseModel {
    // Currency
    case currenciesTicker([CurrencyTicker].Type)
    case currencies([Currency].Type)
    case price([Price].Type)
    case dashboard([Dashboard].Type)
    case currenciesInterval([CurrencyInterval].Type)
    case currenciesSparkline([CurrencySparkline].Type)
    case suppliesInterval([SupplyInterval].Type)
    case allTimeHighs([AllTimeHigh].Type)
    // Markerts
    case markets([Market].Type)
    case marketPrices([MarketPrice].Type)
    case marketInterval([MarketInterval].Type)
    case exchangeMarketPrices([ExchangeMarketPrice].Type)
    case exchangeMarketInterval([ExchangeMarketInterval].Type)
    case marketCapHistory([MarketCapHistory].Type)
    // Candles
    case aggregatedOHLCVCandles([AggregatedOHLCVCandle].Type)
    // Volume
    case globalVolumeHistory([VolumeHistory].Type)
    // Exchange Rates
    case exchangeRates([ExchangeRate].Type)
    case exchangeRatesHistory([ExchangeRateHistory].Type)
    case exchangeRatesInterval([ExchangeRateInterval].Type)
}
