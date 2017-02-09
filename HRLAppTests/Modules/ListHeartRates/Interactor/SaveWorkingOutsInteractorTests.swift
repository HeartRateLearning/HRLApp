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
    let anyWorkoutIndex = 0
    let anyWorkingOuts = [true]
    let anyHeartRate = HeartRateRecord(date: Date(), bpm: Float(60))

    let output = SaveWorkingOutsInteractorOutputTestDouble()
    let trainer = TrainerTestDouble()
    let workoutStore = WorkoutStoreTestDouble()

    var sut = SaveWorkingOutsInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        sut.output = output
        sut.trainer = trainer
        sut.workoutStore = workoutStore
    }

    // MARK: - Tests

    func testSutWithRecordCountEqualToNil_execute_outputFail() {
        // given
        workoutStore.recordCountResult = nil

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: anyWorkingOuts)

        // then
        XCTAssertEqual(workoutStore.recordCountCount, 1)
        XCTAssertEqual(output.didFailCount, 1)
    }

    func testSutWithDifferentRecordCountThanWorkingOuts_execute_outputFail() {
        // given
        workoutStore.recordCountResult = anyWorkingOuts.count + 1

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: anyWorkingOuts)

        // then
        XCTAssertEqual(workoutStore.recordCountCount, 1)
        XCTAssertEqual(output.didFailCount, 1)
    }

    func testRecordWithWorkingOutToUnkwnonAndInputWorkingOutToTrue_execute_insertNewRecordWithWorkingOutToTrue() {
        // given
        let workingOuts = [true]
        let unknownRecord = makeWorkoutRecord(with: .unknown)

        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = unknownRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let trueRecord = makeWorkoutRecord(with: .true)

        XCTAssertEqual(workoutStore.insertRecordCount, 1)
        XCTAssertEqual(workoutStore.lastInsertedRecord!, trueRecord)
        XCTAssertEqual(trainer.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testMultipleRecordsWithWorkingOutToUnkwnonAndInputWorkingOutsToTrue_execute_trainerFitDataOnlyOnce() {
        // given
        let workingOuts = [true, true, true]
        let unknownRecord = makeWorkoutRecord(with: .unknown)

        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = unknownRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        XCTAssertEqual(workoutStore.insertRecordCount, workingOuts.count)
        XCTAssertEqual(trainer.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToUnkwnonAndInputWorkingOutToFalse_execute_insertNewRecordWithWorkingOutToFalse() {
        // given
        let workingOuts = [false]
        let unknownRecord = makeWorkoutRecord(with: .unknown)

        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = unknownRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let falseRecord = makeWorkoutRecord(with: .false)

        XCTAssertEqual(workoutStore.insertRecordCount, 1)
        XCTAssertEqual(workoutStore.lastInsertedRecord!, falseRecord)
        XCTAssertEqual(trainer.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToTrueAndInputWorkingOutToFalse_execute_insertNewRecordWithWorkingOutToFalse() {
        // given
        let workingOuts = [false]
        let trueRecord = makeWorkoutRecord(with: .true)

        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = trueRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let falseRecord = makeWorkoutRecord(with: .false)

        XCTAssertEqual(workoutStore.insertRecordCount, 1)
        XCTAssertEqual(workoutStore.lastInsertedRecord!, falseRecord)
        XCTAssertEqual(trainer.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToFalseAndInputWorkingOutToTrue_execute_insertNewRecordWithWorkingOutToTrue() {
        // given
        let workingOuts = [true]
        let falseRecord = makeWorkoutRecord(with: .false)

        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = falseRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let trueRecord = makeWorkoutRecord(with: .true)

        XCTAssertEqual(workoutStore.insertRecordCount, 1)
        XCTAssertEqual(workoutStore.lastInsertedRecord!, trueRecord)
        XCTAssertEqual(trainer.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToFalseAndInputWorkingOutToFalse_execute_doNotInsertNewRecordDoNotTrainButOuputSuccess() {
        // given
        let workingOuts = [false]
        let falseRecord = makeWorkoutRecord(with: .false)

        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = falseRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        XCTAssertEqual(workoutStore.insertRecordCount, 0)
        XCTAssertEqual(trainer.fitCount, 0)
        XCTAssertEqual(output.didSaveCount, 1)
    }
}

// MARK: - Private body

private extension SaveWorkingOutsInteractorTests {
    func makeWorkoutRecord(with workingOut: WorkingOut) -> WorkoutRecord {
        return WorkoutRecord(heartRate: anyHeartRate, workingOut: workingOut)
    }
}
