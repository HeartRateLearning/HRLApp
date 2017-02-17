//
//  InMemoryWorkoutStoreTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class InMemoryWorkoutStoreTests: XCTestCase {

    // MARK: - Properties

    let anyDateIndex = 0
    let anyRecordIndex = 0
    let anyWorkoutIndex = 0
    let outOfRangeDateIndex = 1000
    let outOfRangeRecordIndex = 1000
    let outOfRangeWorkoutIndex = 1000

    let anyRecord = WorkoutRecord(heartRate: HeartRateRecord(date: Date(),
                                                             bpm: Float(60)),
                                  workingOut: .unknown)
    let otherRecord = WorkoutRecord(heartRate: HeartRateRecord(date: Date().addingTimeInterval(60),
                                                               bpm: Float(60)),
                                    workingOut: .unknown)
    let anyWorkout = Workout.other

    let sut = InMemoryWorkoutStore()

    // MARK: - Tests

    func testOutOfRangeIndex_persistedWorkoutAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let workout = sut.persistedWorkout(at: outOfRangeWorkoutIndex)

        // then
        XCTAssertNil(workout)
    }

    func testEmptyStore_appendSameWorkoutTwice_TwoWorkoutsAreAddedToStore() {
        // when
        sut.appendWorkout(anyWorkout)
        sut.appendWorkout(anyWorkout)

        // then
        XCTAssertEqual(sut.workoutCount(), 2)
    }

    func testOutOfRangeWorkoutIndex_dateCount_returnNil() {
        // given
        fillSut()

        // when
        let count = sut.dateCount(forWorkoutAt: outOfRangeWorkoutIndex)

        // then
        XCTAssertNil(count)
    }

    func testOutOfRangeWorkoutIndex_persistedDateAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let date = sut.persistedDate(at: anyDateIndex, forWorkoutAt: outOfRangeWorkoutIndex)

        // then
        XCTAssertNil(date)
    }

    func testSutWithWorkoutAndOutRangeDateIndex_persistedDateAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let date = sut.persistedDate(at: outOfRangeDateIndex, forWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertNil(date)
    }

    func testSutWithAppendedDate_persistedDateAtIndex_returnExpectedDate() {
        // given
        fillSut()

        // when
        let date = sut.persistedDate(at: anyDateIndex, forWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertEqual(anyRecord.date, date)
    }

    func testSutWithWorkout_appendSameDateTwice_TwoDatesAreAddedToStore() {
        // given
        fillSut()

        // when
        sut.appendDate(anyRecord.date, toWorkoutAt: anyWorkoutIndex)

        // then
        XCTAssertEqual(sut.dateCount(forWorkoutAt: anyWorkoutIndex), 2)
    }

    func testOutOfRangeWorkoutIndex_recordCount_returnNil() {
        // given
        fillSut()

        // when
        let count = sut.recordCount(forWorkoutAt: outOfRangeWorkoutIndex, dateAt: anyDateIndex)

        // then
        XCTAssertNil(count)
    }

    func testOutOfRangeDateIndex_recordCount_returnNil() {
        // given
        fillSut()

        // when
        let count = sut.recordCount(forWorkoutAt: anyWorkoutIndex, dateAt: outOfRangeDateIndex)

        // then
        XCTAssertNil(count)
    }

    func testOutOfRangeWorkoutIndex_persistedRecordAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let record = sut.persistedRecord(at: anyRecordIndex,
                                         forWorkoutAt: outOfRangeRecordIndex,
                                         dateAt: anyDateIndex)

        // then
        XCTAssertNil(record)
    }

    func testOutOfRangeDateIndex_persistedRecordAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let record = sut.persistedRecord(at: anyRecordIndex,
                                         forWorkoutAt: anyWorkoutIndex,
                                         dateAt: outOfRangeDateIndex)

        // then
        XCTAssertNil(record)
    }

    func testOutOfRangeRecordIndex_persistedRecordAtIndex_returnNil() {
        // given
        fillSut()

        // when
        let record = sut.persistedRecord(at: outOfRangeRecordIndex,
                                         forWorkoutAt: anyWorkoutIndex,
                                         dateAt: anyDateIndex)

        // then
        XCTAssertNil(record)
    }

    func testSutWithAppendedDate_persistedRecordAtIndex_returnExpectedRecord() {
        // given
        fillSut()

        // when
        let record = sut.persistedRecord(at: anyRecordIndex,
                                         forWorkoutAt: anyWorkoutIndex,
                                         dateAt: anyDateIndex)

        // then
        XCTAssertEqual(anyRecord, record)
    }

    func testSutWithAppendedRecord_replaceRecordWithIndexOufOfRange_recordCountDoesNotChange() {
        // given
        fillSut()

        // when
        sut.replaceRecord(at: outOfRangeRecordIndex,
                          forWorkoutAt: anyWorkoutIndex,
                          dateAt: anyDateIndex,
                          with: otherRecord)

        // then
        XCTAssertEqual(sut.recordCount(forWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex), 1)
    }

    func testSutWithAppendedRecord_replaceRecordWithIndexInRange_recordCountDoesNotChangeButNewRecordIsReturned() {
        // given
        fillSut()

        // when
        sut.replaceRecord(at: anyRecordIndex,
                          forWorkoutAt: anyWorkoutIndex,
                          dateAt: anyDateIndex,
                          with: otherRecord)

        // then
        XCTAssertEqual(sut.recordCount(forWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex), 1)

        let record = sut.persistedRecord(at: anyRecordIndex,
                                         forWorkoutAt: anyWorkoutIndex,
                                         dateAt: anyDateIndex)
        XCTAssertEqual(record, otherRecord)
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

    func testSutWithOneRecordReplacedAndOtherAppended_mostRecentRecord_returnExpectedRecord() {
        // given
        fillSut()

        let anyBPM = Float(60)
        let minuteInterval = TimeInterval(60)

        let newestDate = anyRecord.date.addingTimeInterval(minuteInterval + minuteInterval)
        let newestRecord = WorkoutRecord(heartRate: HeartRateRecord(date: newestDate, bpm: anyBPM),
                                         workingOut: .unknown)
        sut.replaceRecord(at: anyRecordIndex,
                          forWorkoutAt: anyWorkoutIndex,
                          dateAt: anyDateIndex,
                          with: newestRecord)

        let newerDate = anyRecord.date.addingTimeInterval(minuteInterval)
        let newerRecord = WorkoutRecord(heartRate: HeartRateRecord(date: newerDate, bpm: anyBPM),
                                        workingOut: .unknown)
        sut.appendRecord(newerRecord, toWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)
        
        // when
        let record = sut.mostRecentRecord(forWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)
        
        // then
        XCTAssertEqual(record, newestRecord)
    }
}

// MARK: - Private body

private extension InMemoryWorkoutStoreTests {
    func fillSut() {
        sut.appendWorkout(anyWorkout)
        sut.appendDate(anyRecord.date, toWorkoutAt: anyWorkoutIndex)
        sut.appendRecord(anyRecord, toWorkoutAt: anyWorkoutIndex, dateAt: anyDateIndex)
    }
}
