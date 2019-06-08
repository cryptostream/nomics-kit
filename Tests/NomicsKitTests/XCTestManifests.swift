import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(NomicsTests.allTests),

        testCase(CandleTests.allTests),
        testCase(CurrenciesTests.allTests),
        testCase(ExchangeRatesTests.allTests),
        testCase(MarketsTests.allTests),
        testCase(VolumeTests.allTests),

        testCase(DateFormatter_ExtensionsTests.allTests),
        
        testCase(NomicsAPITests.allTests),

        testCase(NomicsTests.allTests),
    ]
}
#endif
