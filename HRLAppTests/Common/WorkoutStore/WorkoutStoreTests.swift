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

    let delegate = WorkoutStoreDelegateTestDouble()

    let sut = WorkoutStore()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.delegate = delegate
    }

    // MARK: - Tests

    func testEmptyStoreAndAnyWorkout_appendWorkout_forwardToDelegateWithExpectedData() {
        // given
        let anyWorkout = Workout.other

        // when
        sut.appendWorkout(anyWorkout)

        // then
        XCTAssertEqual(delegate.didAppendWorkoutAtIndexCount, 1)
        XCTAssertEqual(delegate.lastAppendedWorkoutIndex, 0)
    }
}
