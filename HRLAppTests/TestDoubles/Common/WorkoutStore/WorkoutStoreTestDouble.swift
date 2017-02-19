//
//  WorkoutStoreTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class WorkoutStoreTestDouble {

    // MARK: - WorkoutStoreProtocol properties

    weak var delegate: WorkoutStoreDelegate?

    // MARK: - Public properties

    fileprivate (set) var workoutCountCount = 0
    fileprivate (set) var workoutAtIndexCount = 0
    fileprivate (set) var appendWorkoutCount = 0
    fileprivate (set) var dateCountCount = 0
    fileprivate (set) var dateAtIndexCount = 0
    fileprivate (set) var appendDateCount = 0
    fileprivate (set) var recordCountCount = 0
    fileprivate (set) var recordAtIndexCount = 0
    fileprivate (set) var appendRecordCount = 0
    fileprivate (set) var replaceRecordCount = 0
    fileprivate (set) var mostRecentRecordCount = 0

    fileprivate (set) var lastWorkoutIndex = -1
    fileprivate (set) var lastAppendedWorkout: Workout?
    fileprivate (set) var lastDateCountWorkoutIndex = -1
    fileprivate (set) var lastDateIndex = -1
    fileprivate (set) var lastDateWorkoutIndex = -1
    fileprivate (set) var lastAppendedDate: Date?
    fileprivate (set) var lastAppendedDateWorkoutIndex = -1
    fileprivate (set) var lastRecordCountWorkoutIndex = -1
    fileprivate (set) var lastRecordCountDateIndex = -1
    fileprivate (set) var lastRecordIndex = -1
    fileprivate (set) var lastRecordWorkoutIndex = -1
    fileprivate (set) var lastRecordDateIndex = -1
    fileprivate (set) var lastAppendedRecord: WorkoutRecord?
    fileprivate (set) var lastAppendedRecordWorkoutIndex = -1
    fileprivate (set) var lastAppendedRecordDateIndex = -1

    fileprivate (set) var lastReplacedRecord: WorkoutRecord?
    fileprivate (set) var lastReplacedRecordIndex = -1
    fileprivate (set) var lastReplacedRecordWorkoutIndex = -1
    fileprivate (set) var lastReplacedRecordDateIndex = -1

    fileprivate (set) var lastMostRecentRecordWorkoutIndex = -1
    fileprivate (set) var lastMostRecentRecordDateIndex = -1

    var workoutCountResult = 0
    var workoutAtIndexResult: Workout?
    var dateCountResult: Int?
    var dateAtIndexResult: Date?
    var records: [WorkoutRecord]?
    var mostRecentRecordResult: WorkoutRecord?
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStoreTestDouble: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        workoutCountCount += 1

        return workoutCountResult
    }

    func workout(at index: Int) -> Workout? {
        workoutAtIndexCount += 1

        lastWorkoutIndex = index

        return workoutAtIndexResult
    }

    func appendWorkout(_ workout: Workout) {
        appendWorkoutCount += 1

        lastAppendedWorkout = workout
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        dateCountCount += 1

        lastDateCountWorkoutIndex = workoutIndex

        return dateCountResult
    }

    func date(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        dateAtIndexCount += 1

        lastDateIndex = index
        lastDateWorkoutIndex = workoutIndex

        return dateAtIndexResult
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        appendDateCount += 1

        lastAppendedDate = date
        lastAppendedDateWorkoutIndex = workoutIndex
    }

    func recordCount(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> Int? {
        recordCountCount += 1

        lastRecordCountWorkoutIndex = workoutIndex
        lastRecordCountDateIndex = dateIndex

        return records?.count
    }

    func record(at index: Int,
                forWorkoutAt workoutIndex: Int,
                dateAt dateIndex: Int) -> WorkoutRecord? {
        recordAtIndexCount += 1

        lastRecordIndex = index
        lastRecordWorkoutIndex = workoutIndex
        lastRecordDateIndex = dateIndex

        return records?[index]
    }

    func appendRecord(_ record: WorkoutRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int) {
        appendRecordCount += 1

        lastAppendedRecord = record
        lastAppendedRecordWorkoutIndex = workoutIndex
        lastAppendedRecordDateIndex = dateIndex
    }

    func replaceRecord(at index: Int,
                       forWorkoutAt workoutIndex: Int,
                       dateAt dateIndex: Int,
                       with record: WorkoutRecord) {
        replaceRecordCount += 1

        lastReplacedRecord = record
        lastReplacedRecordIndex = index
        lastReplacedRecordWorkoutIndex = workoutIndex
        lastReplacedRecordDateIndex = dateIndex
    }

    func mostRecentRecord(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> WorkoutRecord? {
        mostRecentRecordCount += 1

        lastMostRecentRecordWorkoutIndex = workoutIndex
        lastMostRecentRecordDateIndex = dateIndex

        return mostRecentRecordResult
    }
}
