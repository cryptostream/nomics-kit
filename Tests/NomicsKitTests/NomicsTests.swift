import Combine
import XCTest
@testable import NomicsKit

final class NomicsTests: XCTestCase {
    private let nomics = Nomics()

    func testNomics_request() {
        let expect = XCTestExpectation(description: "Endpoint Request")
        let subscriber = AnySubscriber<Decodable, Error>(receiveSubscription: { subscription in
            subscription.request(.unlimited)
        }, receiveValue: { (_) -> Subscribers.Demand in
            expect.fulfill()
            return .none
        })

        try? nomics.request(endpoint: NomicsAPI.currencies(.dashboard).endpoint).receive(subscriber: subscriber)
        wait(for: [expect], timeout: 2)
    }

    static var allTests = [
        ("testNomics_request", testNomics_request),
    ]
}
