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

final class WorkoutStoreTests: XCTestCase {

    // MARK: - Properties

    let anyDateIndex = 0
    let anyRecordIndex = 0
    let anyWorkoutIndex = 0

    let anyRecord = WorkoutRecord(heartRate: HeartRateRecord(date: Date(), bpm: Float(60)),
                                  workingOut: .unknown)
    let anyDate = Date()
    let anyWorkout = Workout.other

    let store = PersistableWorkoutStoreTestDouble()
    let delegate = WorkoutStoreDelegateTestDouble()

    var sut: WorkoutStore!

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut = WorkoutStore(store: store)
        sut.delegate = delegate
    }

    // MARK: - Tests

    func test_workoutCount_forwardToPersistableStore() {
        // when
        _ = sut.workoutCount()

        // then
        XCTAssertEqual(store.workoutCountCount, 1)
    }

    func test_workoutAtIndex_forwardToPersistableStore() {
        // when
        _ = sut.workout(at: anyWorkoutIndex)

        // then
        XCTAssertEqual(store.persistedWorkoutAtIndexCount, 1)
        XCTAssertEqual(store.lastPersistedWorkoutIndex, anyWorkoutIndex)
    }

    func testWorkoutAlreadyPersisted_appendWorkout_doNotAppendWorkoutToPersistableStore() {
        // given
        store.isWorkoutPersistedResult = true

        // when
        sut.appendWorkout(anyWorkout)

        // then
        XCTAssertEqual(store.isWorkoutPersistedCount, 1)
        XCTAssertEqual(store.appendWorkoutCount, 0)
        XCTAssertEqual(delegate.didAppendWorkoutAtIndexCount, 0)
    }

    func testNonPersistedWorkout_appendWorkout_appendWorkoutToPersistableStore() {
        // given
        store.isWorkoutPersistedResult = false

        // when
        sut.appendWorkout(anyWorkout)

        // then
        XCTAssertEqual(store.isWorkoutPersistedCount, 1)
        XCTAssertEqual(store.appendWorkoutCount, 1)
        XCTAssertEqual(delegate.didAppendWorkoutAtIndexCount, 1)
    }

    func testAnyWorkoutIndex_dateCount_forwardToPersistableStore() {
        // when
        _ = sut.dateCount(forWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertEqual(store.dateCountCount, 1)
    }

    func testAnyIndexPath_dateAtIndex_forwardToPersistableStore() {
        // when
        _ = sut.date(at: anyDateIndex, forWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertEqual(store.persistedDateAtIndexCount, 1)
    }

    func testDateAlreadyPersisted_appendDate_doNotAppendDateToPersistableStore() {
        // given
        store.isDatePersistedResult = true

        // when
        sut.appendDate(anyDate, toWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertEqual(store.isDatePersistedCount, 1)
        XCTAssertEqual(store.appendDateCount, 0)
    }

    func testNonPersistedDate_appendDate_appendDateToPersistableStore() {
        // given
        store.isDatePersistedResult = false

        // when
        sut.appendDate(anyDate, toWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertEqual(store.isDatePersistedCount, 1)
        XCTAssertEqual(store.appendDateCount, 1)
    }

    func testAnyIndexPath_recordCount_forwardToPersistableStore() {
        // when
        _ = sut.recordCount(forWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // then
        XCTAssertEqual(store.recordCountCount, 1)
    }

    func testAnyIndexPath_recordAtIndex_forwardToPersistableStore() {
        // when
        _ = sut.record(at: anyRecordIndex, forWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // then
        XCTAssertEqual(store.persistedRecordAtIndexCount, 1)
    }

    func testAnyRecordAndIndexPath_appendRecord_forwardToPersistableStore() {
        // when
        sut.appendRecord(anyRecord, toWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // then
        XCTAssertEqual(store.appendRecordCount, 1)
    }

    func testAnyRecordAndIndexPath_insertRecord_forwardToPersistableStore() {
        // when
        sut.insertRecord(anyRecord,
                         intoWorkoutAt: anyWorkoutIndex,
                         dateAt: anyDateIndex,
                         recordAt: anyRecordIndex)

        // then
        XCTAssertEqual(store.insertRecordCount, 1)
    }

    func testAnyIndexPath_mostRecentRecord_forwardToPersistableStore() {
        // when
        _ = sut.mostRecentRecord(forWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // then
        XCTAssertEqual(store.mostRecentRecordCount, 1)
    }
}
