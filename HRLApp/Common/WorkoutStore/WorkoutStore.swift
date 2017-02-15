//
//  WorkoutStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class WorkoutStore {

    // MARK: - WorkoutStoreProtocol properties

    weak var delegate: WorkoutStoreDelegate?

    // MARK: - Private properties

    fileprivate let store: PersistableWorkoutStore

    // MARK: - Init object

    init(store: PersistableWorkoutStore) {
        self.store = store
    }
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStore: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        return store.workoutCount()
    }

    func workout(at index: Int) -> Workout? {
        return store.persistedWorkout(at: index)
    }

    func appendWorkout(_ workout: Workout) {
        guard !store.isWorkoutPersisted(workout) else {
            return
        }

        store.appendWorkout(workout)

        delegate?.workoutStore(self, didAppendWorkoutAtIndex: store.workoutCount() - 1)
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        return store.dateCount(forWorkoutAt: workoutIndex)
    }

    func date(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        return store.persistedDate(at: index, forWorkoutAt: workoutIndex)
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        guard !store.isDatePersisted(date, forWorkoutAt: workoutIndex) else {
            return
        }

        store.appendDate(date, toWorkoutAt: workoutIndex)
    }

    func recordCount(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> Int? {
        return store.recordCount(forWorkoutAt: workoutIndex, dateAt: dateIndex)
    }

    func record(at index: Int,
                forWorkoutAt workoutIndex: Int,
                dateAt dateIndex: Int) -> WorkoutRecord? {
        return store.persistedRecord(at: index, forWorkoutAt: workoutIndex, dateAt: dateIndex)
    }

    func appendRecord(_ record: WorkoutRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int) {
        store.appendRecord(record, toWorkoutAt: workoutIndex, dateAt: dateIndex)
    }

    func insertRecord(_ record: WorkoutRecord,
                      intoWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int,
                      recordAt recordIndex: Int) {
        store.insertRecord(record,
                           intoWorkoutAt: workoutIndex,
                           dateAt: dateIndex,
                           recordAt: recordIndex)
    }

    func mostRecentRecord(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> WorkoutRecord? {
        return store.mostRecentRecord(forWorkoutAt: workoutIndex, dateAt: dateIndex)
    }
}
