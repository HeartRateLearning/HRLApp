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

final class StoreWorkoutInteractorTests: XCTestCase {

    // MARK: - Properties

    let validIndex = Workout.americanFootball.rawValue
    let invalidIndex = -1

    let numberOfDays = 2
    let dayInterval = TimeInterval(24 * 60 * 60)

    let anyDate = Date()
    lazy var twoDaysBeforeDate: Date = { [unowned self] in
        let timeInterval = -TimeInterval(self.numberOfDays) * self.dayInterval

        return self.anyDate.addingTimeInterval(timeInterval)
    }()
    lazy var futureDate: Date = { [unowned self] in
        return self.anyDate.addingTimeInterval(self.dayInterval)
    }()

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

    func testInvalidIndexAndAnyDate_executeWithWorkoutIndexAndStartingDate_doNotAppendWorkout() {
        // when
        sut.execute(withWorkoutIndex: invalidIndex, startingOn: anyDate)

        // then
        XCTAssertEqual(store.appendWorkoutCount, 0)
    }

    func testInvalidIndexAndAnyDate_executeWithWorkoutIndexAndStartingDate_forwardErrorToOuptut() {
        // when
        sut.execute(withWorkoutIndex: invalidIndex, startingOn: anyDate)

        // then
        XCTAssertEqual(output.didFailToStoreWorkoutWithIndexCount, 1)
        XCTAssertEqual(output.lastFailedWorkoutIndex, invalidIndex)
    }

    func testValidIndexAndAnyDate_executeWithWorkoutIndexAndStartingDate_appendWorkout() {
        // when
        sut.execute(withWorkoutIndex: validIndex, startingOn: anyDate)

        // then
        let expectedWorkout = Workout(rawValue: validIndex)!

        XCTAssertEqual(store.appendWorkoutCount, 1)
        XCTAssertEqual(store.lastAppendedWorkout, expectedWorkout)
    }

    func testValidIndexAndTwoDaysAgoDate_executeWithWorkoutIndexAndStartingDate_appendExpectedDates() {
        // when
        sut.execute(withWorkoutIndex: validIndex, startingOn: twoDaysBeforeDate)

        // then
        XCTAssertEqual(store.appendDateCount, numberOfDays + 1)
    }

    func testValidIndexAndAnyDate_executeWithWorkoutIndexAndStartingDate_appendOneDate() {
        // when
        sut.execute(withWorkoutIndex: validIndex, startingOn: anyDate)

        // then
        XCTAssertEqual(store.appendDateCount, 1)
    }

    func testValidIndexAndFutureDate_executeWithWorkoutIndexAndStartingDate_appendNoDate() {
        // when
        sut.execute(withWorkoutIndex: validIndex, startingOn: futureDate)

        // then
        XCTAssertEqual(store.appendDateCount, 0)
    }

    func testValidIndexAndAnyDate_executeWithWorkoutIndexAndStartingDate_forwardSuccessToOutput() {
        // when
        sut.execute(withWorkoutIndex: validIndex, startingOn: anyDate)

        // then
        let expectedWorkout = Workout(rawValue: validIndex)!

        XCTAssertEqual(output.didStoreWorkoutCount, 1)
        XCTAssertEqual(output.lastStoredWorkout, String(expectedWorkout))
    }
}
