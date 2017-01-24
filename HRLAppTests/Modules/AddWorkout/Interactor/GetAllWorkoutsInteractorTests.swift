//
//  GetAllWorkoutsInteractorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class GetAllWorkoutsInteractorTests: XCTestCase {

    // MARK: - Properties

    let output = GetAllWorkoutsInteractorOutputTestDouble()

    let sut = GetAllWorkoutsInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.output = output
    }

    // MARK: - Tests

    func test_execute_forwardToOuptut() {
        // when
        sut.execute()

        // then
        XCTAssertEqual(output.didFindWorkoutsCount, 1)
        XCTAssertEqual(output.lastFoundWorkouts.count, numberOfWorkouts())
    }
}

// MARK: - Private body

private extension GetAllWorkoutsInteractorTests {
    func numberOfWorkouts() -> Int {
        var count = 0

        var workout = Workout(rawValue: count)
        while workout != nil {
            count += 1

            workout = Workout(rawValue: count)
        }

        return count
    }
}
