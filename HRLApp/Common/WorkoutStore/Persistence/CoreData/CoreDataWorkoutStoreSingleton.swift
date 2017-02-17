//
//  CoreDataWorkoutStoreSingleton.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class CoreDataWorkoutStoreSingleton {

    // MARK: - Public properties

    static let sharedInstance = CoreDataWorkoutStoreSingleton()

    // MARK: - Private properties

    fileprivate var store: CoreDataWorkoutStore

    // MARK: - Init methods

    private init() {
        store = CoreDataWorkoutStore()
    }
}

// MARK: - CoreDataConfigurable methods

extension CoreDataWorkoutStoreSingleton: CoreDataConfigurable {
    func setup(completionHandler: @escaping CoreDataConfigurable.CompletionHandler) {
        store.setup(completionHandler: completionHandler)
    }
}

// MARK: - PersistableWorkoutStore methods

extension CoreDataWorkoutStoreSingleton: PersistableWorkoutStore {
    func workoutCount() -> Int {
        return store.workoutCount()
    }

    func isWorkoutPersisted(_ workout: Workout) -> Bool {
        return store.isWorkoutPersisted(workout)
    }

    func persistedWorkout(at index: Int) -> Workout? {
        return store.persistedWorkout(at: index)
    }

    func appendWorkout(_ workout: Workout) {
        store.appendWorkout(workout)
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        return store.dateCount(forWorkoutAt: workoutIndex)
    }

    func isDatePersisted(_ date: Date, forWorkoutAt workoutIndex: Int) -> Bool {
        return store.isDatePersisted(date, forWorkoutAt: workoutIndex)
    }

    func persistedDate(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        return store.persistedDate(at: index, forWorkoutAt: workoutIndex)
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        store.appendDate(date, toWorkoutAt: workoutIndex)
    }

    func recordCount(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> Int? {
        return store.recordCount(forWorkoutAt: workoutIndex, dateAt: dateIndex)
    }

    func persistedRecord(at index: Int,
                         forWorkoutAt workoutIndex: Int,
                         dateAt dateIndex: Int) -> WorkoutRecord? {
        return store.persistedRecord(at: index, forWorkoutAt: workoutIndex, dateAt: dateIndex)
    }

    func appendRecord(_ record: WorkoutRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int) {
        store.appendRecord(record, toWorkoutAt: workoutIndex, dateAt: dateIndex)
    }

    func replaceRecord(at index: Int,
                       forWorkoutAt workoutIndex: Int,
                       dateAt dateIndex: Int,
                       with record: WorkoutRecord) {
        store.replaceRecord(at: index, forWorkoutAt: workoutIndex, dateAt: dateIndex, with: record)
    }

    func mostRecentRecord(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> WorkoutRecord? {
        return store.mostRecentRecord(forWorkoutAt: workoutIndex, dateAt: dateIndex)
    }
}
