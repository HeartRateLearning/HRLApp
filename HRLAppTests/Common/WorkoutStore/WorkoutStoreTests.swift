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
    let anyRecordIndex = 0
    let anyWorkoutIndex = 0
    let outOfRangeDateIndex = 1000
    let outOfRangeRecordIndex = 1000
    let outOfRangeWorkoutIndex = 1000

    let anyRecord = WorkoutRecord(heartRate: HeartRateRecord(date: Date(), bpm: Float(60)),
                                  workingOut: .unknown)
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
        // given
        fillSut()

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
        // given
        fillSut()

        // when
        let count = sut.dateCount(forWorkoutAt: outOfRangeWorkoutIndex)

        // then
        XCTAssertNil(count)
    }

    func testOutOfRangeWorkoutIndex_dateAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let date = sut.date(at: anyDateIndex, forWorkoutAt: outOfRangeWorkoutIndex)

        // then
        XCTAssertNil(date)
    }

    func testSutWithWorkoutAndOutRangeDateIndex_dateAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let date = sut.date(at: outOfRangeDateIndex, forWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertNil(date)
    }

    func testSutWithAppendedDate_dateAtIndex_returnExpectedDate() {
        // given
        fillSut()

        // when
        let date = sut.date(at: anyDateIndex, forWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertEqual(anyRecord.date, date)
    }

    func testOutOfRangeWorkoutIndex_recordCount_returnNil() {
        // given
        fillSut()

        // when
        let count = sut.record(at: anyRecordIndex,
                               forWorkoutAt: outOfRangeWorkoutIndex,
                               dateAt: anyDateIndex)

        // then
        XCTAssertNil(count)
    }

    func testOutOfRangeDateIndex_recordCount_returnNil() {
        // given
        fillSut()

        // when
        let count = sut.record(at: anyRecordIndex,
                               forWorkoutAt: anyWorkoutIndex,
                               dateAt: outOfRangeDateIndex)

        // then
        XCTAssertNil(count)
    }

    func testOutOfRangeRecordIndex_recordCount_returnNil() {
        // given
        fillSut()

        // when
        let count = sut.record(at: outOfRangeRecordIndex,
                               forWorkoutAt: anyWorkoutIndex,
                               dateAt: anyDateIndex)

        // then
        XCTAssertNil(count)
    }

    func testOutOfRangeWorkoutIndex_recordAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let record = sut.record(at: anyRecordIndex,
                                forWorkoutAt: outOfRangeRecordIndex,
                                dateAt: anyDateIndex)

        // then
        XCTAssertNil(record)
    }

    func testOutOfRangeDateIndex_recordAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let record = sut.record(at: anyRecordIndex,
                                forWorkoutAt: anyWorkoutIndex,
                                dateAt: outOfRangeDateIndex)

        // then
        XCTAssertNil(record)
    }

    func testOutOfRangeRecordIndex_recordAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let record = sut.record(at: outOfRangeRecordIndex,
                                forWorkoutAt: anyWorkoutIndex,
                                dateAt: anyDateIndex)

        // then
        XCTAssertNil(record)
    }

    func testSutWithAppendedDate_recordAtIndex_returnExpectedRecord() {
        // given
        fillSut()

        // when
        let record = sut.record(at: anyRecordIndex,
                                forWorkoutAt: anyWorkoutIndex,
                                dateAt: anyDateIndex)

        // then
        XCTAssertEqual(anyRecord, record)
    }

    func testSutWithTwoRecordsAppendedInInverseOrder_mostRecentRecord_returnExpectedRecord() {
        // given
        fillSut()

        let anyBPM = Float(60)
        let minuteInterval = TimeInterval(60)

        let newestDate = anyRecord.date.addingTimeInterval(minuteInterval + minuteInterval)
        let newestRecord = WorkoutRecord(heartRate: HeartRateRecord(date: newestDate, bpm: anyBPM),
                                         workingOut: .unknown)
        sut.appendRecord(newestRecord, toWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        let newerDate = anyRecord.date.addingTimeInterval(minuteInterval)
        let newerRecord = WorkoutRecord(heartRate: HeartRateRecord(date: newerDate, bpm: anyBPM),
                                        workingOut: .unknown)
        sut.appendRecord(newerRecord, toWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // when
        let record = sut.mostRecentRecord(forWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // then
        XCTAssertEqual(record, newestRecord)
    }

    func testSutWithTwoRecordsAppendedInDifferentDates_mostRecentRecord_returnExpectedRecord() {
        // given
        fillSut()

        let anyBPM = Float(60)
        let dayInterval = TimeInterval(24 * 60 * 60)

        let newestDate = anyRecord.date.addingTimeInterval(dayInterval)
        sut.appendDate(newestDate, toWorkoutAt: anyWorkoutIndex)

        let newestRecord = WorkoutRecord(heartRate: HeartRateRecord(date: newestDate, bpm: anyBPM),
                                         workingOut: .unknown)
        sut.appendRecord(newestRecord, toWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex + 1)

        // when
        let record = sut.mostRecentRecord(forWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)

        // then
        XCTAssertEqual(record, anyRecord)
    }
}

// MARK: - Private body

private extension WorkoutStoreTests {
    func fillSut() {
        sut.appendWorkout(anyWorkout)
        sut.appendDate(anyRecord.date, toWorkoutAt: anyWorkoutIndex)
        sut.appendRecord(anyRecord, toWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)
    }
}
