//
//  StoreWorkoutInteractorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 25/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class StoreWorkoutInteractorTests: XCTestCase {

    // MARK: - Properties

    let store = WorkoutStoreTestDouble()
    let output = StoreWorkoutInteractorOutputTestDouble()

    let sut = StoreWorkoutInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.store = store
        sut.output = output
    }

    // MARK: - Tests

    func testInvalidIndex_executeWithWorkoutIndex_doNotAppendWorkoutAndForwardErrorToOuptut() {
        // given
        let invalidIndex = -1

        // when
        sut.execute(withWorkoutIndex: invalidIndex)

        // then
        XCTAssertEqual(store.appendWorkoutCount, 0)
        XCTAssertEqual(output.didFailToStoreWorkoutWithIndexCount, 1)
        XCTAssertEqual(output.lastFailedWorkoutIndex, invalidIndex)
    }

    func testValidIndex_executeWithWorkoutIndex_appendWorkoutAndForwardSuccessToOutput() {
        // given
        let expectedWorkout = Workout.americanFootball

        // when
        sut.execute(withWorkoutIndex: expectedWorkout.rawValue)

        // then
        XCTAssertEqual(store.appendWorkoutCount, 1)
        XCTAssertEqual(store.lastAppendedWorkout, expectedWorkout)
        XCTAssertEqual(output.didStoreWorkoutCount, 1)
        XCTAssertEqual(output.lastStoredWorkout, String(expectedWorkout))
    }
}
