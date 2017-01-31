//
//  GetWorkoutDatesInteractorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 31/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class GetWorkoutDatesInteractorTests: XCTestCase {

    // MARK: - Properties

    let store = WorkoutStoreTestDouble()
    let output = GetWorkoutDatesInteractorOutputTestDouble()

    let sut = GetWorkoutDatesInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.store = store
        sut.output = output
    }

    // MARK: - Tests

    func testOutOfRangeWorkoutIndex_execute_forwardEmptyListToOutput() {
        // given
        let workoutIndex = 0
        store.dateCountResult = nil

        // when
        sut.execute(withWorkoutIndex: workoutIndex)

        // then
        XCTAssertEqual(store.dateCountCount, 1)
        XCTAssertEqual(store.dateAtIndexCount, 0)
        XCTAssertEqual(output.didFindDatesCount, 1)
        XCTAssertEqual(output.lastFoundDates, [])
    }

    func testIndexForWorkoutWithoutDates_execute_forwardEmptyListToOutput() {
        // given
        let workoutIndex = 0
        store.dateCountResult = 0

        // when
        sut.execute(withWorkoutIndex: workoutIndex)

        // then
        XCTAssertEqual(store.dateCountCount, 1)
        XCTAssertEqual(store.dateAtIndexCount, 0)
        XCTAssertEqual(output.didFindDatesCount, 1)
        XCTAssertEqual(output.lastFoundDates, [])
    }

    func testIndexForWorkoutWithTwoDates_execute_forwardExpectedListToOuput() {
        // given
        let workoutIndex = 0
        let count = 2
        let date = Date()

        store.dateCountResult = count
        store.dateAtIndexResult = date

        // when
        sut.execute(withWorkoutIndex: workoutIndex)

        // then
        XCTAssertEqual(store.dateCountCount, 1)
        XCTAssertEqual(store.dateAtIndexCount, count)
        XCTAssertEqual(output.didFindDatesCount, 1)
        XCTAssertEqual(output.lastFoundDates, [date, date])

    }
}
