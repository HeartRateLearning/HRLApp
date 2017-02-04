//
//  GetHeartRatesInteractorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 04/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class GetHeartRatesInteractorTests: XCTestCase {

    // MARK: - Properties

    let anyWorkoutIndex = 0
    let anyDateIndex = 0

    let output = GetHeartRatesInteractorOutputTestDouble()
    let workoutStore = WorkoutStoreTestDouble()
    let heartRateStore = HeartRateStoreTestDouble()

    var sut = GetHeartRatesInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.output = output
        sut.workoutStore = workoutStore
        sut.heartRateStore = heartRateStore
    }

    // MARK: - Tests

    func testNoDateForGivenIndexes_execute_returnEmptyArray() {
        // given
        workoutStore.dateAtIndexResult = nil

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.dateAtIndexCount, 1)
        XCTAssertEqual(heartRateStore.queryRecordsCount, 0)
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, [])
    }

    func testDateForGivenIndexes_execute_returnExpectedRecords() {
        // given
        let date = Date()
        let records = [HeartRateRecord(date: date, bpm: Float(60))]

        workoutStore.dateAtIndexResult = date
        heartRateStore.queryRecordsResult = records

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.dateAtIndexCount, 1)
        XCTAssertEqual(heartRateStore.queryRecordsCount, 1)
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, records)
    }
}
