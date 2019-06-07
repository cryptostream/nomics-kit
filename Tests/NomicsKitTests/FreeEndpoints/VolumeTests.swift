//
//  VolumeTests.swift
//
//
//  Created by Joe Blau on 6/5/19.
//

import XCTest
@testable import NomicsKit

final class VolumeTests: XCTestCase {
    let startDate = Date(timeIntervalSince1970: 0)
    let endDate = Date(timeIntervalSince1970: 8400)

    // MARK: - Volume History

    func testVolume_globalVolumeHistory() {
        XCTAssertEqual(NomicsAPI.volume(.globalVolumeHistory()).endpoint.components.string,
                       "https://api.nomics.com/v1/volume/history")
    }

    func testVolume_globalVolumeHistory_start() {
        XCTAssertEqual(NomicsAPI.volume(.globalVolumeHistory(start: startDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/volume/history?start=1969-12-31T19:00:00Z")
    }

    func testVolume_globalVolumeHistory_start_end() {
        XCTAssertEqual(NomicsAPI.volume(.globalVolumeHistory(start: startDate, end: endDate)).endpoint.components.string,
                       "https://api.nomics.com/v1/volume/history?start=1969-12-31T19:00:00Z&end=1969-12-31T21:20:00Z")
    }

    static var allTests = [
        ("testVolume_globalVolumeHistory", testVolume_globalVolumeHistory),
        ("testVolume_globalVolumeHistory_start", testVolume_globalVolumeHistory_start),
        ("testVolume_globalVolumeHistory_start_end", testVolume_globalVolumeHistory_start_end),
    ]
}
