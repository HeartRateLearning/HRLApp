//
//  WorkoutStoreTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 27/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class WorkoutStoreTests: XCTestCase {

    // MARK: - Properties

    let anyDateIndex = 0
    let outOfRangeWorkoutIndex = 1000
    let outOfRangeDateIndex = 1000

    let anyWorkout = Workout.other

    let delegate = WorkoutStoreDelegateTestDouble()

    let sut = WorkoutStore()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.delegate = delegate
    }

    // MARK: - Tests

    func testOutOfRangeIndex_workoutAtIndex_returnNil() {
        // when
        let workout = sut.workout(at: outOfRangeWorkoutIndex)

        // then
        XCTAssertNil(workout)
    }

    func testEmptyStoreAndAnyWorkout_appendWorkout_forwardToDelegateWithExpectedData() {
        // when
        sut.appendWorkout(anyWorkout)

        // then
        XCTAssertEqual(delegate.didAppendWorkoutAtIndexCount, 1)
        XCTAssertEqual(delegate.lastAppendedWorkoutIndex, 0)
    }

    func testOutOfRangeWorkoutIndex_dateCount_returnNil() {
        // when
        let count = sut.dateCount(forWorkoutAt: outOfRangeWorkoutIndex)

        // then
        XCTAssertNil(count)
    }

    func testOutOfRangeWorkoutIndex_dateAtIndex_returnNil() {
        // when
        let date = sut.date(at: anyDateIndex, forWorkoutAt: outOfRangeWorkoutIndex)

        // then
        XCTAssertNil(date)
    }

    func testSutWithWorkoutAndOutRangeDateIndex_dateAtIndex_returnNil() {
        // given
        sut.appendWorkout(anyWorkout)

        // when
        let workoutIndex = 0
        let date = sut.date(at: outOfRangeDateIndex, forWorkoutAt: workoutIndex)

        // then
        XCTAssertNil(date)
    }

    func testSutWithAppendedDate_dateAtIndex_returnExpectedDate() {
        // given
        let expectedDate = Date()
        let workoutIndex = 0

        sut.appendWorkout(anyWorkout)
        sut.appendDate(expectedDate, toWorkoutAt: workoutIndex)

        // when
        let dateIndex = 0
        let date = sut.date(at: dateIndex, forWorkoutAt: workoutIndex)

        // then
        XCTAssertEqual(expectedDate, date)
    }
}
