//
//  GetHeartRatesInteractorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 04/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

class GetHeartRatesInteractorTests: XCTestCase {

    // MARK: - Properties

    let anyBPM = Float(60)
    let anyDate = Date()
    let anyDateIndex = 0
    let anyWorkoutIndex = 0

    let output = GetHeartRatesInteractorOutputTestDouble()
    let workoutStore = WorkoutStoreTestDouble()
    let heartRateStore = HeartRateStoreTestDouble()

    var sut = GetHeartRatesInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.output = output
        sut.workoutStore = workoutStore
        sut.heartRateStore = heartRateStore
    }

    // MARK: - Tests

    func testNoDateForGivenIndexes_execute_returnEmptyArray() {
        // given
        workoutStore.dateAtIndexResult = nil

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.dateAtIndexCount, 1)
        XCTAssertEqual(workoutStore.mostRecentRecordCount, 0)
        XCTAssertEqual(heartRateStore.queryRecordsAfterCount, 0)
        XCTAssertEqual(heartRateStore.queryRecordsAfterOrEqualCount, 0)
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, [])
    }

    func testMostRecentRecordAndDateForGivenIndexes_execute_queryRecordsAfterDate() {
        // given
        workoutStore.dateAtIndexResult = anyDate
        workoutStore.mostRecentRecordResult = makeWorkoutRecord(with: .unknown)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.dateAtIndexCount, 1)
        XCTAssertEqual(workoutStore.mostRecentRecordCount, 1)
        XCTAssertEqual(heartRateStore.queryRecordsAfterCount, 1)
        XCTAssertEqual(heartRateStore.queryRecordsAfterOrEqualCount, 0)
    }

    func testDateForGivenIndexesNoMostRecentRecord_execute_queryRecordsAfterOrEqualDate() {
        // given
        workoutStore.dateAtIndexResult = anyDate
        workoutStore.mostRecentRecordResult = nil

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.dateAtIndexCount, 1)
        XCTAssertEqual(workoutStore.mostRecentRecordCount, 1)
        XCTAssertEqual(heartRateStore.queryRecordsAfterCount, 0)
        XCTAssertEqual(heartRateStore.queryRecordsAfterOrEqualCount, 1)
    }

    func testHeartRateStoreWithRecords_execute_appendRecordsToWorkoutStore() {
        // given
        workoutStore.dateAtIndexResult = anyDate
        workoutStore.mostRecentRecordResult = nil
        heartRateStore.queryRecordsAfterOrEqualResult = makeHeartRateRecords(with: .unknown)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.appendRecordCount,
                       heartRateStore.queryRecordsAfterOrEqualResult!.count)
    }

    func testWorkoutStoreWithUnknownWorkingOut_execute_outputExpectedRecords() {
        // given
        let recordWorkingOut = WorkoutRecord.WorkingOut.unknown
        let heartRateWorkingOut = false

        let records = makeHeartRateRecords(with: recordWorkingOut)
        let heartRateRecords = makeFoundHeartRateRecords(with: recordWorkingOut,
                                                         heartRateWorkingOut: heartRateWorkingOut)
        let workoutRecord = makeWorkoutRecord(with: recordWorkingOut)

        workoutStore.dateAtIndexResult = anyDate
        workoutStore.mostRecentRecordResult = nil
        heartRateStore.queryRecordsAfterOrEqualResult = records
        workoutStore.recordCountResult = heartRateRecords.count
        workoutStore.recordAtIndexResult = workoutRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, heartRateRecords)
    }

    func testWorkoutStoreWithFalseWorkingOut_execute_outputExpectedRecords() {
        // given
        let recordWorkingOut = WorkoutRecord.WorkingOut.false
        let heartRateWorkingOut = false

        let records = makeHeartRateRecords(with: recordWorkingOut)
        let heartRateRecords = makeFoundHeartRateRecords(with: recordWorkingOut,
                                                         heartRateWorkingOut: heartRateWorkingOut)
        let workoutRecord = makeWorkoutRecord(with: recordWorkingOut)

        workoutStore.dateAtIndexResult = anyDate
        workoutStore.mostRecentRecordResult = nil
        heartRateStore.queryRecordsAfterOrEqualResult = records
        workoutStore.recordCountResult = heartRateRecords.count
        workoutStore.recordAtIndexResult = workoutRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, heartRateRecords)
    }

    func testWorkoutStoreWithTrueWorkingOut_execute_outputExpectedRecords() {
        // given
        let recordWorkingOut = WorkoutRecord.WorkingOut.true
        let heartRateWorkingOut = true

        let records = makeHeartRateRecords(with: recordWorkingOut)
        let heartRateRecords = makeFoundHeartRateRecords(with: recordWorkingOut,
                                                         heartRateWorkingOut: heartRateWorkingOut)
        let workoutRecord = makeWorkoutRecord(with: recordWorkingOut)

        workoutStore.dateAtIndexResult = anyDate
        workoutStore.mostRecentRecordResult = nil
        heartRateStore.queryRecordsAfterOrEqualResult = records
        workoutStore.recordCountResult = heartRateRecords.count
        workoutStore.recordAtIndexResult = workoutRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, heartRateRecords)
    }
}

// MARK: - Private body

private extension GetHeartRatesInteractorTests {
    func makeWorkoutRecord(with workingOut: WorkoutRecord.WorkingOut) -> WorkoutRecord {
        let heartRateRecord = HeartRateRecord(date: anyDate, bpm: anyBPM)

        return WorkoutRecord(heartRate: heartRateRecord, workingOut: workingOut)
    }

    func makeHeartRateRecords(with workingOut: WorkoutRecord.WorkingOut) -> [HeartRateRecord] {
        let workoutRecord = makeWorkoutRecord(with: workingOut)
        let heartRateRecord = HeartRateRecord(date: workoutRecord.date, bpm: workoutRecord.bpm)

        return [heartRateRecord, heartRateRecord]
    }

    func makeFoundHeartRateRecords(with workingOut: WorkoutRecord.WorkingOut,
                                   heartRateWorkingOut: Bool) -> [FoundHeartRateRecord] {
        let heartRateRecords = makeHeartRateRecords(with: workingOut)

        return heartRateRecords.map { (record) -> FoundHeartRateRecord in
            return FoundHeartRateRecord(date: record.date,
                                        bpm: record.bpm,
                                        workingOut: heartRateWorkingOut)
        }
    }
}
