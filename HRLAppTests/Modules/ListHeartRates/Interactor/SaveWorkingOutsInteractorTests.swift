//
//  SaveWorkingOutsInteractorTests.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 06/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import XCTest

@testable import HRLApp

// MARK: - Main body

final class SaveWorkingOutsInteractorTests: XCTestCase {

    // MARK: - Properties

    let anyDateIndex = 0
    let anyWorkout = Workout.other
    let anyWorkoutIndex = 0
    let anyWorkingOuts = [true]

    let output = SaveWorkingOutsInteractorOutputTestDouble()
    let factory = TrainableFactoryTestDouble()
    let trainee = TrainableTestDouble()
    let workoutStore = WorkoutStoreTestDouble()
    let workoutWriter = WorkoutWriterTestDouble()

    var sut = SaveWorkingOutsInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        factory.makeTrainableResult = trainee

        sut.output = output
        sut.factory = factory
        sut.workoutStore = workoutStore
        sut.workoutWriter = workoutWriter
    }

    // MARK: - Tests

    func testWorkoutStoreWithWorkoutEqualToNil_execute_outputFail() {
        // given
        workoutStore.workoutAtIndexResult = nil

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: anyWorkingOuts)

        // then
        XCTAssertEqual(workoutStore.workoutAtIndexCount, 1)
        XCTAssertEqual(workoutStore.recordCountCount, 0)
        XCTAssertEqual(output.didFailCount, 1)
    }

    func testWorkoutStoreWithRecordCountEqualToNil_execute_outputFail() {
        // given
        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = nil

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: anyWorkingOuts)

        // then
        XCTAssertEqual(workoutStore.workoutAtIndexCount, 1)
        XCTAssertEqual(workoutStore.recordCountCount, 1)
        XCTAssertEqual(output.didFailCount, 1)
    }

    func testWorkoutStoreWithDifferentRecordCountThanWorkingOuts_execute_outputFail() {
        // given
        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = makeWorkoutRecords(tuple: (Date(), .unknown),
                                                  count: anyWorkingOuts.count + 1)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: anyWorkingOuts)

        // then
        XCTAssertEqual(workoutStore.workoutAtIndexCount, 1)
        XCTAssertEqual(workoutStore.recordCountCount, 1)
        XCTAssertEqual(output.didFailCount, 1)
    }

    func testRecordWithWorkingOutToUnkwnonAndInputWorkingOutToTrue_execute_insertNewRecordWithWorkingOutToTrue() {
        // given
        let date = Date()
        let workingOuts = [true]

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = makeWorkoutRecords(tuple: (date, .unknown), count: workingOuts.count)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let trueRecords = makeWorkoutRecords(tuple: (date, .true), count: workingOuts.count)

        XCTAssertEqual(workoutStore.replaceRecordCount, 1)
        XCTAssertEqual(workoutStore.lastReplacedRecord!, trueRecords.last!)
        XCTAssertEqual(factory.makeTrainableCount, 1)
        XCTAssertEqual(trainee.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testMultipleRecordsWithWorkingOutToUnkwnonAndInputWorkingOutsToTrue_execute_trainerFitDataOnlyOnce() {
        // given
        let workingOuts = Array(repeating: true, count: 3)

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = makeWorkoutRecords(tuple: (Date(), .unknown),
                                                  count: workingOuts.count)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        XCTAssertEqual(workoutStore.replaceRecordCount, workingOuts.count)
        XCTAssertEqual(factory.makeTrainableCount, 1)
        XCTAssertEqual(trainee.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToUnkwnonAndInputWorkingOutToFalse_execute_insertNewRecordWithWorkingOutToFalse() {
        // given
        let date = Date()
        let workingOuts = [false]

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = makeWorkoutRecords(tuple: (date, .unknown), count: workingOuts.count)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let falseRecords = makeWorkoutRecords(tuple: (date, .false), count: workingOuts.count)

        XCTAssertEqual(workoutStore.replaceRecordCount, 1)
        XCTAssertEqual(workoutStore.lastReplacedRecord!, falseRecords.last!)
        XCTAssertEqual(factory.makeTrainableCount, 1)
        XCTAssertEqual(trainee.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToTrueAndInputWorkingOutToFalse_execute_insertNewRecordWithWorkingOutToFalse() {
        // given
        let date = Date()
        let workingOuts = [false]

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = makeWorkoutRecords(tuple: (date, .true), count: workingOuts.count)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let falseRecords = makeWorkoutRecords(tuple: (date, .false), count: workingOuts.count)

        XCTAssertEqual(workoutStore.replaceRecordCount, 1)
        XCTAssertEqual(workoutStore.lastReplacedRecord!, falseRecords.last!)
        XCTAssertEqual(factory.makeTrainableCount, 1)
        XCTAssertEqual(trainee.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToFalseAndInputWorkingOutToTrue_execute_insertNewRecordWithWorkingOutToTrue() {
        // given
        let date = Date()
        let workingOuts = [true]

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = makeWorkoutRecords(tuple: (date, .false), count: workingOuts.count)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let trueRecords = makeWorkoutRecords(tuple: (date, .true), count: workingOuts.count)

        XCTAssertEqual(workoutStore.replaceRecordCount, 1)
        XCTAssertEqual(workoutStore.lastReplacedRecord!, trueRecords.last!)
        XCTAssertEqual(factory.makeTrainableCount, 1)
        XCTAssertEqual(trainee.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToFalseAndInputWorkingOutToFalse_execute_doNotInsertNewRecordDoNotTrainButOuputSuccess() {
        // given
        let workingOuts = [false]

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = makeWorkoutRecords(tuple: (Date(), .false), count: workingOuts.count)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        XCTAssertEqual(workoutStore.replaceRecordCount, 0)
        XCTAssertEqual(factory.makeTrainableCount, 0)
        XCTAssertEqual(trainee.fitCount, 0)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testInputWorkingOutsEqualToFalse_execute_doNotSaveAnyWorkout() {
        // given
        let workingOuts = Array(repeating: false, count: 6)

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = makeWorkoutRecords(tuple: (Date(), .false), count: workingOuts.count)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        XCTAssertEqual(workoutWriter.saveWorkoutCount, 0)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testInputWorkingOutsEqualToTrue_execute_saveOneWorkoutBetweenExpectedDates() {
        // given
        let workingOuts = Array(repeating: true, count: 6)
        let records = makeWorkoutRecords(tuple: (Date(), .false), count: workingOuts.count)

        let startDate = records.first!.date
        let endDate = records.last!.date

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = records.reversed()

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        XCTAssertEqual(workoutWriter.saveWorkoutCount, 1)
        XCTAssertEqual(workoutWriter.lastSaveWorkoutWorkout, anyWorkout)
        XCTAssertEqual(workoutWriter.lastSaveWorkoutStartDate, startDate)
        XCTAssertEqual(workoutWriter.lastSaveWorkoutEndDate, endDate)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testMixedInputWorkingOuts_execute_doNotSaveAnyWorkout() {
        // given
        let workingOuts = [true, false, true, false, true, false]

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = makeWorkoutRecords(tuple: (Date(), .false), count: workingOuts.count)

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        XCTAssertEqual(workoutWriter.saveWorkoutCount, 0)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testTwoConsecutiveWorkingOutsEqualToTrue_execute_saveOnlyOneWorkoutBetweenExpectedDates() {
        // given
        let workingOuts = [false, false, true, true, false, false]
        let records = makeWorkoutRecords(tuple: (Date(), .false), count: workingOuts.count)

        let startDate = records[2].date
        let endDate = records[3].date

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = records

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        XCTAssertEqual(workoutWriter.saveWorkoutCount, 1)
        XCTAssertEqual(workoutWriter.lastSaveWorkoutWorkout, anyWorkout)
        XCTAssertEqual(workoutWriter.lastSaveWorkoutStartDate, startDate)
        XCTAssertEqual(workoutWriter.lastSaveWorkoutEndDate, endDate)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testConsecutiveWorkingOutsEqualToTrueAtTheBeginningAndTheEnd_execute_saveTwoWorkouts() {
        // given
        let workingOuts = [true, true, false, false, true, true]
        let records = makeWorkoutRecords(tuple: (Date(), .false), count: workingOuts.count)

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.records = records

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        XCTAssertEqual(workoutWriter.saveWorkoutCount, 2)
        XCTAssertEqual(output.didSaveCount, 1)
    }
}

// MARK: - Private body

private extension SaveWorkingOutsInteractorTests {

    // MARK: - Private methods

    func makeWorkoutRecord(tuple: (Date, WorkingOut)) -> WorkoutRecord {
        let anyHeartRate = HeartRateRecord(date: tuple.0, bpm: Float(60))

        return WorkoutRecord(heartRate: anyHeartRate, workingOut: tuple.1)
    }

    func makeWorkoutRecords(tuple: (Date, WorkingOut), count: Int) -> [WorkoutRecord] {
        var records = [] as [WorkoutRecord]

        for increment in 0..<count {
            let nextTuple = (tuple.0.addingTimeInterval(TimeInterval(increment)), tuple.1)

            records.append(makeWorkoutRecord(tuple: nextTuple))
        }

        return records
    }
}
