//
//  PersistableWorkoutStoreTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class PersistableWorkoutStoreTestDouble {

    // MARK: - Public properties

    fileprivate (set) var workoutCountCount = 0
    fileprivate (set) var isWorkoutPersistedCount = 0
    fileprivate (set) var persistedWorkoutAtIndexCount = 0
    fileprivate (set) var appendWorkoutCount = 0

    fileprivate (set) var dateCountCount = 0
    fileprivate (set) var isDatePersistedCount = 0
    fileprivate (set) var persistedDateAtIndexCount = 0
    fileprivate (set) var appendDateCount = 0

    fileprivate (set) var recordCountCount = 0
    fileprivate (set) var persistedRecordAtIndexCount = 0
    fileprivate (set) var appendRecordCount = 0
    fileprivate (set) var insertRecordCount = 0

    fileprivate (set) var mostRecentRecordCount = 0

    fileprivate (set) var lastCheckedWorkout: Workout?
    fileprivate (set) var lastPersistedWorkoutIndex = -1
    fileprivate (set) var lastAppendedWorkout: Workout?

    fileprivate (set) var lastDateCountWorkoutIndex = -1
    fileprivate (set) var lastCheckedDate: Date?
    fileprivate (set) var lastIsDatePersistedWorkoutIndex = -1
    fileprivate (set) var lastPersistedDateIndex = -1
    fileprivate (set) var lastPersistedDateWorkoutIndex = -1
    fileprivate (set) var lastAppendedDate: Date?
    fileprivate (set) var lastAppendedDateWorkoutIndex = -1

    fileprivate (set) var lastRecordCountWorkoutIndex = -1
    fileprivate (set) var lastRecordCountDateIndex = -1
    fileprivate (set) var lastPersistedRecordIndex = -1
    fileprivate (set) var lastPersistedRecordWorkoutIndex = -1
    fileprivate (set) var lastPersistedRecordDateIndex = -1
    fileprivate (set) var lastAppendedRecord: WorkoutRecord?
    fileprivate (set) var lastAppendedRecordWorkoutIndex = -1
    fileprivate (set) var lastAppendedRecordDateIndex = -1
    fileprivate (set) var lastInsertedRecord: WorkoutRecord?
    fileprivate (set) var lastInsertedRecordWorkoutIndex = -1
    fileprivate (set) var lastInsertedRecordDateIndex = -1
    fileprivate (set) var lastInsertedRecordRecordIndex = -1

    fileprivate (set) var lastMostRecentRecordWorkoutIndex = -1
    fileprivate (set) var lastMostRecentRecordDateIndex = -1

    var workoutCountResult = 0
    var isWorkoutPersistedResult = false
    var persistedWorkoutAtIndexResult: Workout?

    var dateCountResult: Int?
    var isDatePersistedResult = false
    var persistedDateAtIndexResult: Date?

    var recordCountResult: Int?
    var persistedRecordAtIndexResult: WorkoutRecord?

    var mostRecentRecordResult: WorkoutRecord?
}

// MARK: - PersistableWorkoutStoreTestDouble methods

extension PersistableWorkoutStoreTestDouble: PersistableWorkoutStore {
    func workoutCount() -> Int {
        workoutCountCount += 1

        return workoutCountResult
    }

    func isWorkoutPersisted(_ workout: Workout) -> Bool {
        isWorkoutPersistedCount += 1

        lastCheckedWorkout = workout

        return isWorkoutPersistedResult
    }

    func persistedWorkout(at index: Int) -> Workout? {
        persistedWorkoutAtIndexCount += 1

        lastPersistedWorkoutIndex = index

        return persistedWorkoutAtIndexResult
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

    func isDatePersisted(_ date: Date, forWorkoutAt workoutIndex: Int) -> Bool {
        isDatePersistedCount += 1

        lastCheckedDate = date
        lastIsDatePersistedWorkoutIndex = workoutIndex

        return isDatePersistedResult
    }

    func persistedDate(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        persistedDateAtIndexCount += 1

        lastPersistedDateIndex = index
        lastPersistedDateWorkoutIndex = workoutIndex

        return persistedDateAtIndexResult
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

        return recordCountResult
    }

    func persistedRecord(at index: Int,
                         forWorkoutAt workoutIndex: Int,
                         dateAt dateIndex: Int) -> WorkoutRecord? {
        persistedRecordAtIndexCount += 1

        lastPersistedRecordIndex = index
        lastPersistedRecordWorkoutIndex = workoutIndex
        lastPersistedRecordDateIndex = dateIndex

        return persistedRecordAtIndexResult
    }

    func appendRecord(_ record: WorkoutRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int) {
        appendRecordCount += 1

        lastAppendedRecord = record
        lastAppendedRecordWorkoutIndex = workoutIndex
        lastAppendedRecordDateIndex = dateIndex
    }

    func insertRecord(_ record: WorkoutRecord,
                      intoWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int,
                      recordAt recordIndex: Int) {
        insertRecordCount += 1

        lastInsertedRecord = record
        lastInsertedRecordWorkoutIndex = workoutIndex
        lastInsertedRecordDateIndex = dateIndex
        lastInsertedRecordRecordIndex = recordIndex
    }

    func mostRecentRecord(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> WorkoutRecord? {
        mostRecentRecordCount += 1
        
        lastMostRecentRecordWorkoutIndex = workoutIndex
        lastMostRecentRecordDateIndex = dateIndex
        
        return mostRecentRecordResult
    }
}
