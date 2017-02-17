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
    let anyHeartRate = HeartRateRecord(date: Date(), bpm: Float(60))

    let output = SaveWorkingOutsInteractorOutputTestDouble()
    let factory = TrainableFactoryTestDouble()
    let trainee = TrainableTestDouble()
    let workoutStore = WorkoutStoreTestDouble()

    var sut = SaveWorkingOutsInteractor()

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()

        factory.makeTrainableResult = trainee

        sut.output = output
        sut.factory = factory
        sut.workoutStore = workoutStore
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
        workoutStore.recordCountResult = nil

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
        workoutStore.recordCountResult = anyWorkingOuts.count + 1

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
        let workingOuts = [true]
        let unknownRecord = makeWorkoutRecord(with: .unknown)

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = unknownRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let trueRecord = makeWorkoutRecord(with: .true)

        XCTAssertEqual(workoutStore.replaceRecordCount, 1)
        XCTAssertEqual(workoutStore.lastReplacedRecord!, trueRecord)
        XCTAssertEqual(factory.makeTrainableCount, 1)
        XCTAssertEqual(trainee.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testMultipleRecordsWithWorkingOutToUnkwnonAndInputWorkingOutsToTrue_execute_trainerFitDataOnlyOnce() {
        // given
        let workingOuts = [true, true, true]
        let unknownRecord = makeWorkoutRecord(with: .unknown)

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = unknownRecord

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
        let workingOuts = [false]
        let unknownRecord = makeWorkoutRecord(with: .unknown)

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = unknownRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let falseRecord = makeWorkoutRecord(with: .false)

        XCTAssertEqual(workoutStore.replaceRecordCount, 1)
        XCTAssertEqual(workoutStore.lastReplacedRecord!, falseRecord)
        XCTAssertEqual(factory.makeTrainableCount, 1)
        XCTAssertEqual(trainee.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToTrueAndInputWorkingOutToFalse_execute_insertNewRecordWithWorkingOutToFalse() {
        // given
        let workingOuts = [false]
        let trueRecord = makeWorkoutRecord(with: .true)

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = trueRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let falseRecord = makeWorkoutRecord(with: .false)

        XCTAssertEqual(workoutStore.replaceRecordCount, 1)
        XCTAssertEqual(workoutStore.lastReplacedRecord!, falseRecord)
        XCTAssertEqual(factory.makeTrainableCount, 1)
        XCTAssertEqual(trainee.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToFalseAndInputWorkingOutToTrue_execute_insertNewRecordWithWorkingOutToTrue() {
        // given
        let workingOuts = [true]
        let falseRecord = makeWorkoutRecord(with: .false)

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = falseRecord

        // when
        sut.execute(withWorkoutIndex: anyWorkoutIndex,
                    dateIndex: anyDateIndex,
                    workingOuts: workingOuts)

        // then
        let trueRecord = makeWorkoutRecord(with: .true)

        XCTAssertEqual(workoutStore.replaceRecordCount, 1)
        XCTAssertEqual(workoutStore.lastReplacedRecord!, trueRecord)
        XCTAssertEqual(factory.makeTrainableCount, 1)
        XCTAssertEqual(trainee.fitCount, 1)
        XCTAssertEqual(output.didSaveCount, 1)
    }

    func testRecordWithWorkingOutToFalseAndInputWorkingOutToFalse_execute_doNotInsertNewRecordDoNotTrainButOuputSuccess() {
        // given
        let workingOuts = [false]
        let falseRecord = makeWorkoutRecord(with: .false)

        workoutStore.workoutAtIndexResult = anyWorkout
        workoutStore.recordCountResult = workingOuts.count
        workoutStore.recordAtIndexResult = falseRecord

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
}

// MARK: - Private body

private extension SaveWorkingOutsInteractorTests {
    func makeWorkoutRecord(with workingOut: WorkingOut) -> WorkoutRecord {
        return WorkoutRecord(heartRate: anyHeartRate, workingOut: workingOut)
    }
}
