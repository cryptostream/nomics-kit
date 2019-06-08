import XCTest
@testable import NomicsKit

final class NomicsTests: XCTestCase {
    private let nomics = Nomics()

    func testNomics_request() {
        let expect = XCTestExpectation(description: "Endpoint Request")

        nomics.request(endpoint: NomicsAPI.currencies(.dashboard).endpoint) { result in
            switch result {
            case .success(let data): XCTAssertNotNil(data)
            case .failure: XCTFail("failure")
            }
            expect.fulfill()
        }

        wait(for: [expect], timeout: 2)
    }

    static var allTests = [
        ("testNomics_request", testNomics_request),
    ]
}
