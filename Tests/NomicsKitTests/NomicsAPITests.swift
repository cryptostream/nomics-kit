import XCTest
@testable import NomicsKit

final class NomicsAPITests: XCTestCase {

    func testInstantiaton() {
        XCTAssertEqual(NomicsAPI.currencies(.dashboard).host, "api.nomics.com")
        XCTAssertEqual(NomicsAPI.currencies(.dashboard).scheme, "https")
    }

    static var allTests = [
        ("testInstantiaton", testInstantiaton),
    ]
}
