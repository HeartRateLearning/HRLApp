//
//  GetStoredWorkoutsInteractorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 23/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class GetStoredWorkoutsInteractorTests: XCTestCase {

    // MARK: - Properties

    let store = WorkoutStoreTestDouble()
    let output = GetStoredWorkoutsInteractorOutputTestDouble()

    let sut = GetStoredWorkoutsInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.store = store
        sut.output = output
    }

    // MARK: - Tests

    func test_execute_requestWorkoutsAndForwardToOuptut() {
        // when
        sut.execute()

        // then
        XCTAssertEqual(store.workoutCountCount, 1)
        XCTAssertEqual(output.didFindWorkoutsCount, 1)
    }

    func test_didAppendWorkoutAtIndex_requestWorkoutsAndForwardToOuptut() {
        // when
        sut.workoutStore(store, didAppendWorkoutAtIndex: 0)

        // then
        XCTAssertEqual(store.workoutCountCount, 1)
        XCTAssertEqual(output.didFindWorkoutsCount, 1)
    }
}
