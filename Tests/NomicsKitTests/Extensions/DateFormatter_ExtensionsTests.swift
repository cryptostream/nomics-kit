import XCTest
@testable import NomicsKit

final class DateFormatter_ExtensionsTests: XCTestCase {

    let date = Date(timeIntervalSince1970: 0)

    func testFormat() {
        let startDate = DateFormatter.nomics.string(from: date)
        XCTAssertEqual(startDate, "1969-12-31T19:00:00Z")
    }

    static var allTests = [
        ("testFormat", testFormat),
    ]
}
