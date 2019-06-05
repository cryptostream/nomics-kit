import XCTest
@testable import NomicsKit

final class NomicsKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NomicsKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
