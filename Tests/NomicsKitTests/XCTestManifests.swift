import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(NomicsKitTests.allTests),
        
        testCase(CandleTests.allTests),
        testCase(CurrenciesTests.allTests),
        testCase(ExchangeRatesTests.allTests),
        testCase(MarketsTests.allTests),
        testCase(VolumeTests.allTests),

    ]
}
#endif
