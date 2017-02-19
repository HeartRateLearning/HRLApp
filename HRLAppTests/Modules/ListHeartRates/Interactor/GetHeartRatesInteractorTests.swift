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

final class GetHeartRatesInteractorTests: XCTestCase {

    // MARK: - Properties

    let anyBPM = Float(60)
    let anyDate = Date()
    let anyDateIndex = 0
    let anyWorkout = Workout.other
    let anyWorkoutIndex = 0

    let output = GetHeartRatesInteractorOutputTestDouble()
    let factory = PredictorFactoryTestDouble()
    let predictor = PredictorTestDouble()
    let workoutStore = WorkoutStoreTestDouble()
    let heartRateReader = HeartRateReaderTestDouble()

    var sut = GetHeartRatesInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        factory.makePredictorResult = predictor

        sut.output = output
        sut.factory = factory
        sut.workoutStore = workoutStore
        sut.heartRateReader = heartRateReader

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.dateAtIndexResult = anyDate
        workoutStore.mostRecentRecordResult = nil
    }

    // MARK: - Tests

    func testNoWorkoutForGivenIndexes_execute_returnEmptyArray() {
        // given
        workoutStore.workoutAtIndexResult = nil

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.workoutAtIndexCount, 1)
        XCTAssertEqual(workoutStore.dateAtIndexCount, 0)
        XCTAssertEqual(workoutStore.mostRecentRecordCount, 0)
        XCTAssertEqual(heartRateReader.queryRecordsAfterCount, 0)
        XCTAssertEqual(heartRateReader.queryRecordsAfterOrEqualCount, 0)
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, [])
    }

    func testNoDateForGivenIndexes_execute_returnEmptyArray() {
        // given
        workoutStore.dateAtIndexResult = nil

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.workoutAtIndexCount, 1)
        XCTAssertEqual(workoutStore.dateAtIndexCount, 1)
        XCTAssertEqual(workoutStore.mostRecentRecordCount, 0)
        XCTAssertEqual(heartRateReader.queryRecordsAfterCount, 0)
        XCTAssertEqual(heartRateReader.queryRecordsAfterOrEqualCount, 0)
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, [])
    }

    func testMostRecentRecordAndDateForGivenIndexes_execute_queryRecordsAfterDate() {
        // given
        workoutStore.mostRecentRecordResult = makeWorkoutRecord(with: .unknown)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.dateAtIndexCount, 1)
        XCTAssertEqual(workoutStore.mostRecentRecordCount, 1)
        XCTAssertEqual(heartRateReader.queryRecordsAfterCount, 1)
        XCTAssertEqual(heartRateReader.queryRecordsAfterOrEqualCount, 0)
    }

    func testDateForGivenIndexesNoMostRecentRecord_execute_queryRecordsAfterOrEqualDate() {
        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.dateAtIndexCount, 1)
        XCTAssertEqual(workoutStore.mostRecentRecordCount, 1)
        XCTAssertEqual(heartRateReader.queryRecordsAfterCount, 0)
        XCTAssertEqual(heartRateReader.queryRecordsAfterOrEqualCount, 1)
    }

    func testHeartRateReaderWithRecords_execute_factoryMakesPredictor() {
        // given
        heartRateReader.queryRecordsAfterOrEqualResult = makeHeartRateRecords(with: .unknown)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(factory.makePredictorCount, 1)
    }

    func testHeartRateReaderWithRecords_execute_classifierPredictsWorkingOut() {
        // given
        heartRateReader.queryRecordsAfterOrEqualResult = makeHeartRateRecords(with: .unknown)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(predictor.predictedCount,
                       heartRateReader.queryRecordsAfterOrEqualResult!.count)
    }

    func testHeartRateReaderWithRecords_execute_appendRecordsToWorkoutStore() {
        // given
        heartRateReader.queryRecordsAfterOrEqualResult = makeHeartRateRecords(with: .unknown)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(workoutStore.appendRecordCount,
                       heartRateReader.queryRecordsAfterOrEqualResult!.count)
    }

    func testWorkoutStoreWithUnknownWorkingOut_execute_outputExpectedRecords() {
        // given
        let recordWorkingOut = WorkingOut.unknown
        let heartRateWorkingOut = false

        let records = makeHeartRateRecords(with: recordWorkingOut)
        let heartRateRecords = makeFoundHeartRateRecords(with: recordWorkingOut,
                                                         heartRateWorkingOut: heartRateWorkingOut)
        let workoutRecords = makeWorkoutRecords(with: recordWorkingOut,
                                                count: heartRateRecords.count)

        heartRateReader.queryRecordsAfterOrEqualResult = records
        workoutStore.records = workoutRecords

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, heartRateRecords)
    }

    func testWorkoutStoreWithFalseWorkingOut_execute_outputExpectedRecords() {
        // given
        let recordWorkingOut = WorkingOut.false
        let heartRateWorkingOut = false

        let records = makeHeartRateRecords(with: recordWorkingOut)
        let heartRateRecords = makeFoundHeartRateRecords(with: recordWorkingOut,
                                                         heartRateWorkingOut: heartRateWorkingOut)
        let workoutRecords = makeWorkoutRecords(with: recordWorkingOut,
                                                count: heartRateRecords.count)

        heartRateReader.queryRecordsAfterOrEqualResult = records
        workoutStore.records = workoutRecords

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, heartRateRecords)
    }

    func testWorkoutStoreWithTrueWorkingOut_execute_outputExpectedRecords() {
        // given
        let recordWorkingOut = WorkingOut.true
        let heartRateWorkingOut = true

        let records = makeHeartRateRecords(with: recordWorkingOut)
        let heartRateRecords = makeFoundHeartRateRecords(with: recordWorkingOut,
                                                         heartRateWorkingOut: heartRateWorkingOut)
        let workoutRecords = makeWorkoutRecords(with: recordWorkingOut,
                                                count: heartRateRecords.count)

        heartRateReader.queryRecordsAfterOrEqualResult = records
        workoutStore.records = workoutRecords

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex, dateIndex: anyDateIndex)

        // then
        XCTAssertEqual(output.didFindHeartRatesCount, 1)
        XCTAssertEqual(output.lastFoundRecords!, heartRateRecords)
    }
}

// MARK: - Private body

private extension GetHeartRatesInteractorTests {
    func makeWorkoutRecord(with workingOut: WorkingOut) -> WorkoutRecord {
        let heartRateRecord = HeartRateRecord(date: anyDate, bpm: anyBPM)

        return WorkoutRecord(heartRate: heartRateRecord, workingOut: workingOut)
    }

    func makeWorkoutRecords(with workingOut: WorkingOut, count: Int) -> [WorkoutRecord] {
        var records = [] as [WorkoutRecord]

        for _ in 0..<count {
            records.append(makeWorkoutRecord(with: workingOut))
        }

        return records
    }

    func makeHeartRateRecords(with workingOut: WorkingOut) -> [HeartRateRecord] {
        let workoutRecord = makeWorkoutRecord(with: workingOut)
        let heartRateRecord = HeartRateRecord(date: workoutRecord.date, bpm: workoutRecord.bpm)

        return [heartRateRecord, heartRateRecord]
    }

    func makeFoundHeartRateRecords(with workingOut: WorkingOut,
                                   heartRateWorkingOut: Bool) -> [FoundHeartRateRecord] {
        let heartRateRecords = makeHeartRateRecords(with: workingOut)

        return heartRateRecords.map { (record) -> FoundHeartRateRecord in
            return FoundHeartRateRecord(date: record.date,
                                        bpm: record.bpm,
                                        workingOut: heartRateWorkingOut)
        }
    }
}
