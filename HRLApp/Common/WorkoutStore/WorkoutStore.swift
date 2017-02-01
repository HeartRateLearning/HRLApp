//
//  WorkoutStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class WorkoutStore {

    // MARK: - WorkoutStoreProtocol properties

    weak var delegate: WorkoutStoreDelegate?

    // MARK: - Private properties

    fileprivate var workouts = [] as [StoredWorkout]
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStore: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        return workouts.count
    }

    func workout(at index: Int) -> Workout? {
        return storedWorkout(at: index)?.workout
    }

    func appendWorkout(_ workout: Workout) {
        workouts.append(StoredWorkout(workout: workout))

        delegate?.workoutStore(self, didAppendWorkoutAtIndex: workouts.count - 1)
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        return storedWorkout(at: workoutIndex)?.dates.count
    }

    func date(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        return storedDate(at: index, forWorkoutAt: workoutIndex)?.date
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        storedWorkout(at: workoutIndex)?.dates.append(StoredDate(date: date))
    }

    func recordCount(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> Int? {
        return storedDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records.count
    }

    func record(at index: Int,
                forWorkoutAt workoutIndex: Int,
                dateAt dateIndex: Int) -> HeartRateRecord? {
        guard let records = storedDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records else {
            return nil
        }

        guard index < records.count else {
            return nil
        }

        return records[index]
    }

    func appendRecord(_ record: HeartRateRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int) {
        storedDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records.append(record)
    }
}

// MARK: - Private body

private extension WorkoutStore {

    // MARK: - Type definitions

    class StoredDate {
        let date: Date
        var records: [HeartRateRecord]

        init(date: Date, records: [HeartRateRecord] = []) {
            self.date = date
            self.records = records
        }
    }

    class StoredWorkout {
        let workout: Workout
        var dates: [StoredDate]

        init(workout: Workout, dates: [StoredDate] = []) {
            self.workout = workout
            self.dates = dates
        }
    }

    // MARK: - Private methods

    func storedWorkout(at index: Int) -> StoredWorkout? {
        guard index < workouts.count else {
            return nil
        }

        return workouts[index]
    }

    func storedDate(at index: Int, forWorkoutAt workoutIndex: Int) -> StoredDate? {
        guard let dates = storedWorkout(at: workoutIndex)?.dates else {
            return nil
        }

        guard index < dates.count else {
            return nil
        }

        return dates[index]
    }
}
